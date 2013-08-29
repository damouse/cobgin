# THIS IS A TESTING SECTION FOR COBGIN CODE
#this is where code will be tried out before being implemented in cobgin source-code


=begin To test, lookup, etc
	- namespace magic
	- 
=end


#requires

class Test


	attr_accessor :molds

	def initialize
		@molds = Array.new		
		puts 'TESTBED LAUNCHING'
	end

	#TEST 1- objects and stuff
	def test_1
		puts check_custom nil
		puts check_custom "hi"
		puts check_custom 'hi(there)'
	end

	def check_custom key
		return nil if key == nil

		return key unless key.include?('(')

		split = key.split("(")
		key = split.shift
		obj = split.shift.split(")")
		return obj
	end

end


############################
############################
#TOP LEVEL TESTING EXECUTION-- dont put anything put the current test here!
test = Test.new

test.test_1

#END EXECUTION