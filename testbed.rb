# THIS IS A TESTING SECTION FOR COBGIN CODE
#this is where code will be tried out before being implemented in cobgin source-code


=begin To test, lookup, etc
	- namespace magic
	- 
=end


#requires

class Test
	require './mold/mold'

	attr_accessor :molds

	def initialize
		@molds = Array.new		
		puts 'hello'
	end

	#TEST 1- objects and stuff
	def test_1
		puts spawn 'phil'
		puts spawn 'menu'
		puts spawn 'goodies'
		puts spawn 'phil'
	end

	def spawn name
		#puts "Spawner searching for #{name}"
		mold = @molds.select {|x| x.name.eql? name}
		#puts "Array : #{@molds}"

		mold = mold.shift

		if mold.nil?
			puts "No existing mold found for #{name}, spawning..."
			mold = Mold.new(name)
			@molds << mold
		end

		return mold
	end
end


############################
############################
#TOP LEVEL TESTING EXECUTION-- dont put anything put the current test here!
test = Test.new

test.test_1

#END EXECUTION