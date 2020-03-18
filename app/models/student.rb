class Student < ApplicationRecord
  has_many :results
  has_many :courses, through: :results
end
