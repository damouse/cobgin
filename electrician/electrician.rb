#this class wires up all the written classes to the connection manager
class Electrician
	attr_accessor :molds, :dir, :name

	def initialize molds, dir, name
		@molds = molds
		@dir = dir
		@name = name
	end

	def write
		#make the connection manage subclass and write it to file

		write_string(@name + '.m' , write_m(@molds, @name))
		write_string(@name + '.h', write_h(@molds, @name))
	end

	private
	#write the .m connection manager
	def write_m molds, name
		source = ''

		source << "#import \"MBConnectionManager.h\"\n"

		@molds.each { |m| source << "#import \"#{m.name}.h\"\n" }

		source << "\n@implementation MBConnectionManager\n\n#pragma mark Initialization\n"
		source << "+ (MBConnectionManager *) manager {\n"
    	source << "\tstatic MBConnectionManager *conMan = nil;\n"
    	source << "\tif (conMan != nil) return conMan;\n\n"
    	source << "\tstatic dispatch_once_t safer;\n\n"
    	source << "\tdispatch_once(&safer, ^(void) {\n"
        source << "\t\tconMan = [[#{name} alloc] init]; \n\t});\n\n"
    	source << "\treturn conMan\n\n}\n\n";
    	source << "#pragma mark Requests\n"
    	#create a method for each API call
    	
    	@molds.each do |mold|
    		#ignore objects that do not have API urls
    		unless mold.url == nil
    			source << method(mold.name) << " {\n"
			    source << "\t[self apiRequestWithMapping:[#{mold.name} mapping] success:success fail:failure]; \n"
			    source << "}\n\n"
    		end
    	end

		source << "@end\n"
	end

	#write the .h connection manager
	def write_h molds, name 
		header = ''

		header << "#import <Foundation/Foundation.h>\n"
		header << "@interface #{name} : MBConnectionManager\n\n"
		header << "+ (#{name} *) manager;\n\n"

		@molds.each { |m| header << method(m.name) << ";\n\n" }

		header << "@end"
	end

	#builds a method with the given parameters. NOTE: no ending (colon or parenthesis)
	def method name
		"- (void) API_#{name}_get_success:(void (^)(RKMappingResult *))success fail:(void (^)(NSError *))failure"
	end

	#writes given text to file
	def write_string(name, text)

		path = @dir + name

		File.open(path, "wb") do |file|
			file << text
		end
	end
end