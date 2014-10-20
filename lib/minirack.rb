require "Thin"

module Minirack

	class Server

		def initialize(args)
			@options = default_options
			@options[:file] = args[0]
			@app = build_app
		end

		def self.start
			new(ARGV).start # ARGV passes command line arguments
		end

		def start
			host = @options[:host]
			port = @options[:port]
			args = [host, port, @app]
			server = ::Thin::Server.new(*args) # "*"turns args into array
			server.start
		end

		private

		def default_options
			{
				host: "localhost",
				port: "9292",
				environment: "development"
			}
		end

		def build_app
			Minirack::Builder.parse_file(@options[:file])
		end

	end


	class Builder

		def self.parse_file(file)
			content = File.read(file)
			build_content(content)
		end

		def self.build_content(build_string)
			eval "Minirack::Builder.new { \n" + build_string + "\n}.to_app"
		end

		def initialize(&block)
			instance_eval(&block) if block_given?
		end

		def to_app
			@run
		end

		def run(app)
			@run = app
		end

	end
end







