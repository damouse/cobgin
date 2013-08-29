class Reader
	attr_accessor :file, :lines

	def initialize (fname)  
		file_panic fname

		#note the last is optional, the first two are not
		@file = File.open(fname,"r").read

		@lines = load_lines file
	end 

	## return the next line of the file that contains content, "EOF" if finished
	def next
		lines.shift
	end

	def has_next
		return !lines.empty?
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

	def file_panic fname
		unless File.exist? fname
			puts 'PANIC: reader was given a file that does not exist'
		end
	end
end