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
	attr_accessor :cogbin

	def initialize cogbin
		@cogbin = cogbin
		@last_object = nil
	end 

	#decide what a given line means, act accordingly
	def decide line
		input_panic line

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
		object = nil

		if split.count > 2 
			link = split[2] 

			if link.include?('(')
				#if the link includes a parenthesis, theres an array of Objects
				nested = link.split('(')
				#link = nested.shift

				object = nested[1].delete(')')
				object = 'object : '  << object
				#puts object
			end
		end

		#we have property information, fetch appropriate spawner and issue commands
		#cogbin will create the spawner if it doesn't exist, else return the matching one
		mold = @cogbin.spawn(@last_object, nil)
		mold.property_add(type, name, link, object)
	end

	#deal with objects
	def object line
		object_panic line

		split = line.split(" ")

		#at this point line should contain the name of the object, call to cogbin
		@last_object = split.shift
		@cogbin.spawn @last_object, split.shift
	end

	#panic if something goes wrong
	def object_panic line
		if line.split(" ").count != 2
			puts 'PANIC: object'
		end
	end

	def property_panic line

		if @last_object == nil
			puts 'PANIC: no object found'
		end

		num = line.split(" ").count

		if(num < 2 || num > 3)
			puts "PANIC: property. Got #{num} arguments"
		end
	end

	def input_panic line

	end
end
