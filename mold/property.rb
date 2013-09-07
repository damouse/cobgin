#abstract representation of an objective-c property
class Property
	attr_accessor :name, :type, :api, :nested

	def initialize (type, name, api = nil, nested = nil)
		@name = name
		@type = type
		@nested = nested		
		@api = check_custom api
	end

	def to_s
		"#{@type}, #{@name}, #{@api}, #{@nested}"
	end

	private
	#check and see if this property refers to a loaded object
	def check_custom key
		return nil if key == nil

		return key unless key.include?('(')

		split = key.split("(")
		key = split.shift
		@custom_object = split.shift.split(")")

		return key
	end
end