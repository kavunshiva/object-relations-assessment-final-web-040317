class Rating
  attr_accessor :score
  attr_reader :movie, :viewer

  ALL = []

  def self.all
    ALL
  end

  def initialize(score, movie, viewer)
    @score = score
    @movie = movie
    @viewer = viewer
    self.class.all << self
  end
end
