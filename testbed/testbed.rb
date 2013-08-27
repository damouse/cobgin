# THIS IS A TESTING SECTION FOR COBGIN CODE
#this is where code will be tried out before being implemented in cobgin source-code


=begin To test, lookup, etc
	- namespace magic
	- 
=end


#requires
require './alternate'

#TEST 1- objects and stuff
def test_1
	obj = Alternate.new 'beefcake', 14, 'employed'
	ano = Alternate.new 'pudding', 12
	#puts obj.greet
	#puts obj.meet

	#obj.ivar = 2
	#puts obj.ivar

	#obj.name = 'beefcake'
	puts obj.detail
	puts obj.num
	puts ano.num #this prints the global variable all Alternate objects can see, in this case the count =>2


end


#TEST 2- parsing!
def test_2
	file = File.open("obg_source_sample.obg","r").read

	lines = Array.new
	lines = file.split("\n")

	#fuck that, i dont like the dyanmic feed, just pre-parse it
	lines.map! do |line| #map overwrites the old array
		if line.include? '#'
			split = line.split '#'
			#puts split.to_s
			split.shift
		else
			line
		end
	end

	#removing blank lines
	lines.delete_if do |line|
		true if line.empty?
	end

	lines.each do |line|
		line.chomp!
		puts line
	end
	#hmm... how many sub-items does it make sense to have here?
	#reader- gets rid of comments, ignores spaces, etc
	#decider- figures out what things mean, interperets reserved words 
	#spawner- feeds data into objects

end


##TEST 3- parser test 1-- WORKS
def test_3	
	require './parser_test'

	reader = Reader.new('obg_source_sample.obg')
	decider = Decider.new()

	line = ''
	while !line.eql?('EOF')
		line = reader.next
		
		decider.greet
	end
end

##TEST 4- decider testing... great
def test_4
	require './parser_test'
	poo = Poo.new
	poo.greet
end

############################
############################
#TOP LEVEL TESTING EXECUTION-- dont put anything put the current test here!
test_4
#END EXECUTION