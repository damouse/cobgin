#this class is responsible for writing out the molds into source code files
class Author
	def initialize (molds, path)
		@molds = molds
		@path = path
	end

	#write all the source code out
	def write
		#clear the directory before doing anything else
		clear @path

		#write out source code files
		@molds.each do |mold|
			write_object(mold.name + ".h", mold.write_h)
			write_object(mold.name + ".m", mold.write_m)
		end

		
	end

	private
	#writes an individual object's source code files out
	def write_object(name, text)
		dir = @path + name

		File.open(dir, "wb") do |file|
			file << text
		end
	end

	#clears output directory
	def clear path
		Dir.foreach(path) do |f| 
			fn = File.join(path, f);
			File.delete(fn) if f != '.' && f != '..'
		end

	end
end