class User < ApplicationRecord
  # We want to compare a newly created place to all users to determine how closely they are matched
  # u = one user or all users?
  # p = newly created place
  QUESTIONS =[:q1, :q2, :q3, :q4, :q5]

  # We pluck the question results from our Active Record Entry to create an array that we can then compare in our calculation
  def entry_to_array
    [q1, q2, q3, q4, q5]
  end

  # So now that we've calculated the euclidian distance to get the closeness of two points we need to convert that to a meaningful percentage (how close are the points actually?)
  # To do this we grab the maximum value a user can attain across questions (e.g. 5 questions with scores out of 100 = 500 or 5/5)
  # Then we square that value - Math.sqrt (5) = 2.23606797749979
  # Now we can do (100 - ((euclidean_distance(user)*100)/maximumValue))
  # We now have a percentage out of a 100 which we can round for fun.
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
