require 'pry'

class Artist
  
  extend Concerns::Findable 

attr_accessor :name

@@all = []

def initialize(name)
  @name = name 
  @songs = []
end

def self.all
  @@all
end

def save
  self.class.all << self
end

def self.destroy_all
  @@all.clear
end

def self.create(name)
  name =  Artist.new
  name.save
  name
end

def songs 
  @songs
end

def add_song(song)
  song.artist = self if song.artist == nil
  @songs << song unless @songs.include?(song)
end

def genres
 genres_arr = @songs.collect {|song| song.genre}
 genres_arr.uniq
end 

end