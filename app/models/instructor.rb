class Instructor < ApplicationRecord
  validates :f_name, :l_name, :birthday, :education, presence: true
  has_many :cohorts_instructors, dependent: :destroy
  has_many :cohorts, through: :cohorts_instructors, dependent: :destroy
  validates :age, inclusion: {in: 1..150}
	validates :salary, numericality: { greater_than: 0 }
end
