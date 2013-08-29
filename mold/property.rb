#abstract representation of an objective-c property
class Property
	attr_accessor :name, :type, :api, :custom_object

	def initialize (type, name, api = nil)
		@name = name
		@type = type
		
		@api = check_custom api
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
		else
			#fallthrough: a custom object was provided
			name_panic

			ret << "(strong, nonatomic) #{type} * "
		end

		ret << @name << ";\n"
		ret
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

	def name_panic
		
	end
end