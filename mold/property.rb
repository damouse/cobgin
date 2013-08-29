#abstract representation of an objective-c property
class Property
	attr_accessor :name, :type, :api

	def initialize (name, type, api = nil)
		@name = name
		@type = type
		@api = api
	end

	def to_s
		"#{@type} #{@name} #{@api}"
	end
end