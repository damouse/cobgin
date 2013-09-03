=begin
Eww, mold! 

No, not that kind of mold. This class is a metablueprint for creating 
objective-c objects.	

=end

class Mold
	require './mold/property'

	attr_accessor :name, :properties, :url

	def initialize name, link
		@name = name
		@url = link
		@properties = Array.new
	end

	def to_s
		ret = "#{name}"

		@properties.each do |p|
			ret << "\n\t" + p.to_s
		end

		return ret
	end

	def property_add (type, name, api_key = nil, nested = nil)
		#puts "Adding property named #{name} to object #{@name}"

		p = Property.new(type, name, api_key, nested);

		#panic if this property alreadt exists
		duplicate_panic p

		@properties << p
	end

	#returns a string that is the source code of this object's .h file
	def write_h
		ret = "@interface #{@name} : NSObject\n\n"

		@properties.each { |p| ret << p.write }

		ret << "\n@end"
	end

	#returns a string that is the source code of this object's .m file
	def write_m
		ret = "#import \"#{@name}.h\"\n\n"
		ret << "@interface #{@name} {\n\n}\n\n"
		ret << "@implementation #{name}\n"

		unless properties.empty?
			ret << "@synthesize "
			@properties.each { |p| ret << p.name + ", " }
			#remove the last two characters from the string
			ret.chop!.chop!
		end

		ret << mapping_boring
		#ret << mapping

		ret << "\n\n@end"
	end

	private
	def mapping
		#write the mapping inside the .m file
	end

	def mapping_boring
		#write the boring crap in the mapper
		boring =  "#pragma mark Connection Manager\n"
		boring << "(RKObjectMapping *) mapping {\n"
		boring << "//returns the mapping needed by RestKit to perform API calls\n"
		boring << "RKObjectMapping* mapping = [RKObjectMapping mappingForClass:[self class]];\n"
		
	end

	def duplicate_panic property

		#THIS WILL NOT WORK AS INTEDED
		if @properties.include? property
			puts "PANIC: mold was given a duplicate property"
		end
	end
end