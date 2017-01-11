class User < ApplicationRecord
  # We want to compare a newly created place to all users to determine how closely they are matched
  # u = one user or all users?
  # p = newly created place
  QUESTIONS =[:q1, :q2, :q3, :q4, :q5]

  def match_vector
    QUESTIONS.map{|match|self.send(match)}
  end

  def entry_to_array(input)
    (Array(input)).drop(1)
  end

  def euclidean_distance(other)
    attribute_pairs = (entry_to_array(self)).match_vector.zip((entry_to_array(other)).match_vector)
    square_distance = attribute_pairs.reduce(0) do |acc, (a, b)|
      acc + (a-b) **2
    end

    Math.sqrt square_distance
  end
end
