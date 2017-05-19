
module MyModule
  
  def self.hello
    puts "hey"
  end
  
  def hi
    puts "hi"
  end
  
end

MyModule::hello

include MyModule

hi

class Muukii
end

m = Muukii.new
m.hi
