# Describes an Post
class Post
  ### CLASS DEFINITIONS ###


  # Class variables
  @@all = [] # list of all Posts

  # Reader for all class variable
  def self.all
    @@all
  end  


  ### INSTANCE DEFINITIONS ###

  # instance readers and writers
  attr_accessor :title, :author

  # default constructor
  def initialize(title=nil)
    self.title = title
    self.save
  end

  # saves Post instance to all class variable
  def save
    self.class.all << self
  end

  # Return the name of the author for this post instance
  def author_name 
    self.author.name if self.author
  end

end