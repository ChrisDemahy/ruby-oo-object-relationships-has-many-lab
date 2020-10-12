# Describes an Artist
class Artist
### CLASS ###


  # Class variables
  @@all = [] # list of all Artists

  # Reader for all class variable
  def self.all
    @@all
  end  

  # Returns the total number of songs by any artist 
  def self.song_count()
    Song.all.count do |e|
      e.artist # if it has an artist count it 
    end
  end

  ### INSTANCE DEFINITIONS ###

  # instance readers and writers
  attr_accessor :name

# default constructor
  def initialize(name=nil)
    self.name = name
    self.save
  end

# saves Artist instance to all class variable
  def save
    self.class.all << self
  end

  # Returns an array of all songs by that artist
  def songs
    Song.all.find_all do |item| 
      item.artist == self
    end
  end

  # tells the song that it belongs to current artist
  def add_song(song)
    song.artist = self
  end
  # takes the name of a new song, initializes the song, and joins it to the artist 
  def add_song_by_name(song_name)
    song = Song.new(song_name)
    self.add_song(song) # use instance method
  end

end