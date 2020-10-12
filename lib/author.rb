# Describes an Author
class Author
  ### CLASS DEFINITIONS ###


  # Class variables
  @@all = [] # list of all Authors

  # Reader for all class variable
  def self.all
    @@all
  end  

  # returns the count of all posts associated with authors
  def self.post_count
    Post.all.count do |post|
      post.author # if it has an author count it 
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

  # saves Author instance to all class variable
  def save
    self.class.all << self
  end

  # returns all posts that are associated with this author
  def posts
    Post.all.find_all do |post|
      post.author == self
    end
  end

  # Associates a given post with this author
  def add_post(post)
    post.author = self
  end

  # Creates a new post and associates it with this author
  def add_post_by_title(title)
    new_post = Post.new(title)    
    self.add_post(new_post)
  end
end