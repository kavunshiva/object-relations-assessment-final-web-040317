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
