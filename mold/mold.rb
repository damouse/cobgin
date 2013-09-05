=begin
Eww, mold! 

No, not that kind of mold. This class is a metablueprint for creating 
objective-c objects.	

=end

class Mold
	require './mold/property'
	require './electrician/wire_internal'

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
		#puts "#{@name} url: #{@url}"

		ret = "@interface #{@name} : NSObject\n\n"

		@properties.each { |p| ret << p.write }

		ret << "\n+ (RKObjectMapping *) mapping;\n"

		ret << "\n@end"
	end

	#returns a string that is the source code of this object's .m file
	def write_m
		ret = "#import \"#{@name}.h\"\n"
		ret << import #get all the needed imports
		ret << "@interface #{@name} {\n\n}\n\n"
		ret << "@implementation #{name}\n"

		unless properties.empty?
			ret << "@synthesize "
			@properties.each { |p| ret << p.name + ", " }
			#remove the last two characters from the string
			ret.chop!.chop!
		end

		#create the internal wiring electrician, use him to write out the mapping function
		electrician = Wire_Internal.new @properties
		ret << electrician.write

		ret << "\n\n@end"
	end

	private
	def import
		ret = ''

		@properties.each do |p|
			unless p.nested == nil
				ret << "#import \"#{p.nested}.h\"\n"
			end
		end

		ret << "\n"
	end

	def duplicate_panic property

		#THIS WILL NOT WORK AS INTEDED
		if @properties.include? property
			puts "PANIC: mold was given a duplicate property"
		end
	end
end