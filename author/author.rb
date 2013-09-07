#this class is responsible for writing out the molds into source code files
class Author
	def initialize (molds, path)
		@molds = molds
		@path = path
	end

	#write all the source code out
	def write
		#clear the directory before doing anything else
		clear @path

		#write out source code files
		@molds.each do |mold|
			write_object(mold.name + ".h", header(mold))
			write_object(mold.name + ".m", source(mold))
		end
	end

	private
	#writes a .h file of a given mold
	def header mold
		#puts "#{@name} url: #{@url}"

		ret = comment(mold.name)

		ret << "@interface #{mold.name} : NSObject\n\n"

		#writes the property declaration in the header file
		mold.properties.each { |p| ret << property(p) }

		ret << "\n+ (RKObjectMapping *) mapping;\n"

		ret << "\n@end"
	end

	#writes a .m file for a given mold
	def source mold
		ret = comment(mold.name)

		ret << "#import \"#{mold.name}.h\"\n"
		ret << import(mold) #get all the needed imports
		#ret << "@interface #{mold.name} {\n\n}\n\n"
		ret << "@implementation #{mold.name}\n"

		#synthesize all of the properties in the .h file automatically
		unless mold.properties.empty?
			ret << "@synthesize "
			mold.properties.each { |p| ret << p.name + ", " }
			#remove the last two characters from the string
			ret.chop!.chop!
		end

		#create the internal wiring electrician, use him to write out the mapping function
		electrician = Wire_Internal.new mold.properties
		ret << electrician.write

		ret << coding(mold)

		ret << "\n\n@end"
	end

	#return a string containing the comment block which sits on top of the file
	def comment name
		empty = "//\n"

		ret = ''
		ret << empty << empty
		ret << "// #{name}\n"
		ret << "// This is an object created by COBGIN\n"
		ret << empty << empty
		ret << "// by Mickey Barboi\n"
		ret << empty << empty << "\n\n"

		ret
	end

	#automatically implement NSCoding protocols
	def coding mold
		#encode
		ret = "\n#pragma mark NSCoding Protocol\n"
		ret << "-(void)encodeWithCoder:(NSCoder *)encoder {\n"

		mold.properties.each { |p| ret << "\t[encoder encodeObject:#{p.name} forKey:@\"#{p.name}\"];\n" }

		ret << "}\n\n"


		#decode
		ret << "- (id)initWithCoder:(NSCoder *)decoder {\n\tself = [super init];\n"

		mold.properties.each { |p| ret << "\tself.#{p.name} = [decoder decodeObjectForKey:@\"#{p.name}\"];\n" }

		ret << "\treturn self;\n}\n\n"
	end

	#returns a string that is the property correctly written out to a line
	def property property
		ret = '@property '

		case property.type
		when 'int' then ret << '(nonatomic) int '
		when 'bool' then ret << '(nonatomic) BOOL '
		when 'flt' then ret << '(nonatomic) float '
		when 'str' then ret << '(strong, nonatomic) NSString * '
		when 'arr' then ret << '(strong, nonatomic) NSArray * '
		when 'dict' then ret << '(strong, nonatomic) NSDictionary * '
		else
			#fallthrough: a custom object was provided
			ret << "(strong, nonatomic) #{property.type} * "
		end

		ret << property.name << ";\n"
		ret
	end

	#imports the correct headers where needed
	def import mold
		ret = ''

		mold.properties.each do |p|
			unless p.nested == nil
				ret << "#import \"#{p.nested}.h\"\n"
			end
		end

		ret << "\n"
	end

	#writes an individual object's source code files out
	def write_object(name, text)

		dir = @path + name

		File.open(dir, "wb") do |file|
			file << text
		end
	end

	#clears output directory
	def clear path
		Dir.foreach(path) do |f| 
			fn = File.join(path, f);
			File.delete(fn) if f != '.' && f != '..'
		end
	end
end