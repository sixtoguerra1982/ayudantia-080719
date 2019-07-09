class Movies
  def initialize(nombre, fecha_estreno, stock)
    @name = nombre
    @fecha = fecha_estreno
    @stock = stock
  end
end

class BlueRay < Movies
  @@contador = 0
  def initialize(name, date, stock)
   @@contador += 1
  end
  def self.contador_instancias
    @@contador
  end
  def self.ladrar
    "gua gua gua"
  end
end


class Dvd < Movies

end


dvd = []
blue = []
movies_a = []
data = []
data = File.open('movies.txt', 'r').readlines.map(&:chomp)
cont = 0
hash_movie = {}
data.each do |movie|
  ls = movie.split('; ')
  # movies_a.push (Movies.new ls[0], ls[1], ls[2].to_i)
  if ls[3].chomp == 'B'
    blue.push (BlueRay.new ls[0], ls[1], ls[2].to_i)
  elsif ls[3].chomp == "D"
    dvd << (Dvd.new ls[0] , ls[1], ls[2].to_i)
  else
     cont = cont + 1
  end
  hash_movie[ls[0]] = ls[2]
end

puts "Cantidad de BlueRay instanciados #{BlueRay.contador_instancias}"
puts "Cantidad de Dvd instanciados #{dvd.count}"
puts "Cantidad de Otro tipo #{cont}"
puts hash_movie
