class Song
  
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name =  name
    @artist = artist if artist 
    @genre = genre if genre
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.class.all.clear
  end

  def create(song)
    song = self.new(song)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre 
    genre.add_song(self)
  end

end