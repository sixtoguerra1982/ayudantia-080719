class Movie
	def initialize(name, date, stock)
		@name = name
		@date = date
		@stock = stock
	end
end

class Dvd < Movie
	@@conta = 0
	def initialize(name, date, stock)
		super
		@@conta += 1
	end	
	def self.get_number_of_instances
 		@@conta
 	end
end

class BlueRay < Movie
	@@conta = 0
	def initialize(name, date, stock)
		super
		@@conta += 1
	end	
	def self.get_number_of_instances
 		@@conta
 	end
end

def cantidadtotal
 Dvd.get_number_of_instances + BlueRay.get_number_of_instances
end

movies = []
data = []
File.open('movies.txt', 'r') { |file| data = file.readlines }
data.each do |movie|
  ls = movie.split('; ')
  if ls[3].to_s.chomp == "D"
  	movies << Dvd.new(ls[0], ls[1], ls[2])
  elsif ls[3].to_s.chomp == "B"
  	movies << BlueRay.new(ls[0], ls[1], ls[2])
  end
end

puts "DVD #{Dvd.get_number_of_instances}"
puts "BlueRay #{BlueRay.get_number_of_instances}"
puts "Total #{cantidadtotal}"