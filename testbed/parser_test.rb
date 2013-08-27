##Test class for the parsing "reader,"
class Reader
	attr_accessor :file, :lines

	def initialize (fname)  
		#note the last is optional, the first two are not
		@file = File.open(fname,"r").read

		@lines = load_lines file

		puts 
	end 

	## return the next line of the file that contains content, "EOF" if finished
	def next
		return 'EOF' if lines.empty? 

		lines.shift
	end

	private
	##load the lines from the file, remove comments, blank lines, whitespace, set the ivar
	def load_lines file

		lines = Array.new
		lines = @file.split("\n")

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

		lines.each { |line| line.chomp! }

		lines
	end

end

class Poo
	require './testbed'
	def greet
		puts 'poo'
	end
end

=begin 
Decides what lines actually mean, acts acordingly
The tricky part here is going to be managing control of Parser and allowing 
cogbin main to control the Decider without having to micromanage it. 

I think the best course of action is to route all Parser.next calls through
cogbin so cogbin can hold down the fort if something happens

cogbin will hold a list of spawners, created when Decider thinks things need to be done

Decider is ABSOLUTELY STATELESS when between items!
=end
class Decider
	require_relative 'testbed'

	def initialize ()  
		@last_object = nil
	end 

	def greet
		puts 'hello'
	end

	#decide what a given line means, act accordingly
	def decide line
		input_panic line

		puts line
		return

		#note... this is stupidly unsafe. Please find a way to sanitize this
		if line[0].eql? "\t"
			property line
		else
			object line
		end
	end


	private

	#deal with properties
	def property line
		property_panic line

		split = line.split(" ")
		type = split[0]
		name = split[1]
		link = nil

		if split.count > 2 
			link = split[2] 
		end

		#we have property information, fetch appropriate spawner and issue commands
		#cogbin will create the spawner if it doesn't exist, else return the matching one
		spawner = cogbin.spawn @last_object
		spawner.property_add(type, name, link)

		#cogbin property_add 
	end

	#deal with objects
	def object line
		object_panic line

		#at this point line should contain the name of the object, call to parent
		@last_object = line
		#cogbin object_found line
	end

	#panic if something goes wrong
	def object_panic line
		if line.split(" ").count > 1
			puts 'PANIC: object'
		end
	end

	def property_panic line
		if @last_object == nil
			puts 'PANIC: no object found'
		end

		num = line.split(" ").count

		if(num < 2 || num < 3)
			puts 'PANIC: property'
		end
	end

	def input_panic line

	end
end

## creates and populates objects
class Spawner
	
end