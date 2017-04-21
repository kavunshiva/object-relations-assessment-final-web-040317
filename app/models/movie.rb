class Movie
  attr_accessor :title

  ALL = []

  def self.all
    ALL
  end

  def self.find_by_title(title)
    self.all.find do |movie|
      movie.title == title
    end
  end

  def initialize(title)
    self.title = title
    self.class.all << self
  end

  def ratings
    Rating.all.select do |rating|
      rating.movie == self
    end
  end

  def viewers
    ratings.collect do |rating|
      rating.viewer
    end
  end

  def average_rating
    ratings_scores = ratings.collect do |rating|
      rating.score
    end
    sum_of_all_scores = ratings_scores.inject do |sum, score|
      sum + score
    end
    sum_of_all_scores.to_f / ratings_scores.size
  end
end

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
