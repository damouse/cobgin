# yet another testing file for cobgin

class Alternate
	#this is an instance variable, synthesized and everything
	attr_accessor :name, :age, :job
	@@num = 0

	#this is a stock constructor in ruby
	def initialize (name, age, job = 'unemployed')  
		#note the last is optional, the first two are not
		@name = name  
		@age = age  
		@job = job  

		#this is a class variable (coooool)
		@@num += 1
	end 

	def num
		@@num
	end

	def greet  
		#how does this know to autoreturn?
     	"#{@name} says, 'Hello there!'"  
    end  

    def detail
    	"#{@name} #{age} #{job} says, 'Hello there!'"  
    end

    private
    #anything here is a private method and is obviously not visible to external classes
end

