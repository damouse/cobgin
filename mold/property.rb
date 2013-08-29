#abstract representation of an objective-c property
class Property
	attr_accessor :name, :type, :api

	def initialize (type, name, api = nil)
		@name = name
		@type = type
		@api = api
	end

	def to_s
		"#{@type} #{@name} #{@api}"
	end

	#return the source code representation of this property
	def write
		ret = '@property '

		case type
		when 'int' then ret << '(nonatomic) int '
		when 'bool' then ret << '(nonatomic) BOOL '
		when 'flt' then ret << '(nonatomic) float '
		when 'str' then ret << '(strong, nonatomic) NSString * '
		when 'arr' then ret << '(strong, nonatomic) NSArray * '
		when 'dict' then ret << '(strong, nonatomic) NSDictionary * '
		end

		ret << @name << ";\n"
		ret
	end
end