class User < ApplicationRecord
  # We want to compare a newly created place to all users to determine how closely they are matched
  # u = one user or all users?
  # p = newly created place
  QUESTIONS =[:q1, :q2, :q3, :q4, :q5]

  # We pluck the question results from our Active Record Entry to create an array that we can then compare in our calculation
  def entry_to_array
    [q1, q2, q3, q4, q5]
  end

  def distance_to_percentage(other)
    maximumValue = 2.23606797749979
    (100 - ((euclidean_distance(other)*100)/maximumValue)).round
  end

  # TODO: doc the method
  def euclidean_distance(other)
    distance = 0
    QUESTIONS.each do |question_name|
      distance += (self[question_name]-other[question_name])**2
    end

    Math.sqrt distance
  end

  
end
