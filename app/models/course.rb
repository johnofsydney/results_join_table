class Course < ApplicationRecord
  has_many :results
  has_many :students, through: :results
end
