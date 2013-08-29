=begin
Eww, mold! 

No, not that kind of mold. This class is a metablueprint for creating 
objective-c objects.	

=end

class Mold
	require './mold/property'

	attr_accessor :name, :properties

	def initialize name
		@name = name
		@properties = Array.new
	end

	def to_s
		ret = "#{name}"

		@properties.each do |p|
			ret << "\n\t" + p.to_s
		end

		return ret
	end

	def property_add (type, name, api_key = nil)
		#puts "Adding property named #{name} to object #{@name}"

		p = Property.new(type, name, api_key);

		duplicate_panic p
		@properties << p
	end

	def duplicate_panic property

		#THIS WILL NOT WORK AS INTEDED
		if @properties.include? property
			puts "PANIC: mold was given a duplicate property"
		end
	end
end