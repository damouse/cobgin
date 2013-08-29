# THIS IS A TESTING SECTION FOR COBGIN CODE
#this is where code will be tried out before being implemented in cobgin source-code


=begin To test, lookup, etc
	- namespace magic
	- 
=end


#requires

class Test
	require './mold/mold'
	require './author/author'

	attr_accessor :molds

	def initialize
		@molds = Array.new		
		puts 'TESTBED LAUNCHING'
	end

	#TEST 1- objects and stuff
	def test_1
		puts write 'int'
		puts write 'str'
	end

	def write str
		ret = ''

		case str

		when 'int' then ret = 'int'
		when 'str' then ret = 'NSString'
		
		end

		ret
	end

end


############################
############################
#TOP LEVEL TESTING EXECUTION-- dont put anything put the current test here!
test = Test.new

test.test_1

#END EXECUTION