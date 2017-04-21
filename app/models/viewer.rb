class Viewer
  attr_accessor :first_name, :last_name

  ALL = []

  def self.all
    ALL
  end

  def self.find_by_name(name)
    self.all.find do |viewer|
       viewer.full_name == name
    end
  end

  def initialize(name)
    #@name = name # not really needed, but came with the challenge
    @first_name, @last_name = name.split
    self.class.all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def create_rating(score, movie)
    Rating.new(score, movie, self)
  end
end
