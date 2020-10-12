# Describes an Song
class Song
### CLASS ###

  # Class variables
  @@all = [] # list of all Songs

  # Reader for all class variable
  def self.all
    @@all
  end  


  ### INSTANCE ###

  # instance readers and writers
  attr_accessor :name, :artist

# default constructor
  def initialize(name=nil)
    self.name = name
    self.save
  end

# saves Song instance to all class variable
  def save
    self.class.all << self
  end

  # returns the name of the artist for this song
  def artist_name
    self.artist.name if self.artist
  end

end