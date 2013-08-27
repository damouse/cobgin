=begin

cobgin - an Objective-C Engine

Mickey Barboi

v0.0.1 		8/26/13

This is an Objective-C scaffolding tool	used to quickly make the "dumb items" that normally 
have to be made by hand for every new project. This is somewhat meant for esoteric
use since it pairs with MBConnectionManager (a custom, unreleased framework)
	
Parts to this tool
- parser: parses the files, does all the things
- mold: acts as a mold for objective-c objects, is filled with information and knows how to write itself
- electrician: broadly speaking, this takes care of all the wiring between created files (get it?)
	- internal: internal wiring, or connections between objects
	- external: external wiring, connections to MBCM and ultimately API
- author: responsible for writing all of the objects out as objective-c source code
- panic: deals with errors in any stage of the process
=end

