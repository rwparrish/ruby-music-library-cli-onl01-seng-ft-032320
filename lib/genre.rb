class Genre
  
  extend Concerns::Findable

  attr_accessor :name, :song, :artist

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

  def add_song(song)
    song.genre = self if song.genre == nil
    @songs << song unless @songs.include?(song)
  end

  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    art_arr = @songs.collect {|song| song.artist}
    art_arr.uniq
  end

end