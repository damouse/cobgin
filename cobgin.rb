=begin

cobgin - an Objective-C Engine

Mickey Barboi

v0.0.01 		8/26/13 	created file
v0.0.02			8/28		first migration from testbed, wired parsing tools

This is an Objective-C scaffolding tool	used to quickly make the "dumb items" that normally 
have to be made by hand for every new project. This is somewhat meant for esoteric
use since it pairs with MBConnectionManager (a custom, unreleased framework)
	
Parts to this tool
- parser: parses the files, does all the things
	- reader: goes through the source code line by line, removing comments and whitespace
	- decider: interprets the commands in the source code
- mold: acts as a mold for objective-c objects, is filled with information and knows how to write itself
	- property: abstract representation of an objective-c property
- electrician: broadly speaking, this takes care of all the wiring between created files (get it?)
	- internal: internal wiring, or connections between objects
	- external: external wiring, connections to MBCM and ultimately API
- author: responsible for writing all of the objects out as objective-c source code
=end

class Cobgin
	#imports
	require './parser/reader'
	require './parser/decider'
	require './mold/mold'
	require './author/author'

	attr_accessor :molds

	def initialize 
		@molds = Array.new
	end

	#This is the main entry point of execution for the object. It does everything.
	#There are FOUR stages to execution: parsing, spawning, wiring, writing
	#NOTE: the decider is in charge of spawning. The method is here so that cobgin 
	#retains overarching control of the process and the molds
	def generate fname
		parse fname
		wire
		write

		#log_molds
	end

	#this method is responsible for handling the reader and decider objects, as 
	#well as taking care of any setup needed by the two classes
	def parse fname
		reader = Reader.new fname
		decider = Decider.new self

		#feed every line from reader into decider
		while reader.has_next
		  	decider.decide reader.next
		end
	end

	#create the "objects" managed by the spawner array
	#this method is exclusively called from Decider
	def spawn name
		#puts "Spawner searching for #{name}"
		mold = @molds.select {|x| x.name.eql? name}
		#puts "Array : #{@molds}"

		mold = mold.shift

		if mold.nil?
			puts "Spawning  object named #{name}..."
			mold = Mold.new(name)
			@molds << mold
		end

		return mold
	end

	#wire up the connections, internally and externally between objects
	def wire
		
	end

	#write the objects to files
	def write
		author = Author.new(@molds, "./Output/")
		author.write
	end


	##HELPER METHODS
	def log_molds
		puts "\nInternal object log:"
		puts @molds
		puts "\n"
	end
end


#start cobgin
cob = Cobgin.new 
cob.generate 'obg_source_sample.cob'