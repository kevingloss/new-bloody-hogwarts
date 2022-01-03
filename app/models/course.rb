class Course < ApplicationRecord
  has_many :student_courses
  has_many :students, through: :student_courses

  validates :name, presence: true

  def num_students
    students.count
  end
end
