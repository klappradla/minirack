require "Thin"

module Minirack

	class Server

		def initialize(args)
			@options = default_options
			@options[:file] = args[0] || "default.mru"
			@app = build_app
		end

		def self.start
			new(ARGV).start # ARGV passes command line arguments
		end

		def start
			args = [@options[:host], @options[:port], @app]
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
			Minirack::AppBuilder.parse_file(@options[:file])
		end
	end

	class AppBuilder
		def self.parse_file(file_path)
			content = IO.read(file_path)
			build(content)
		end

		def self.build(proc_string)
			eval "Minirack::App.new { \n" + proc_string + "\n}.to_app"			
		end
	end

	class App
		def initialize(&block) # &-prefix allows to have block as param
			instance_eval(&block) if block_given?
		end

		def to_app
			@app # set instance variable app
		end

		def run(app)
			@app = app # return app
		end
		
	end
end







