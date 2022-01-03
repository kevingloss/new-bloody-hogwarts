require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'methods' do
    before :each do
      @harry = Student.create!(name: "Harry Potter", age: 14, house: "Gryffindor")
      @draco = Student.create!(name: "Draco Malfoy", age: 13, house: "Slytherin")
      @ron = Student.create!(name: "Ron Weasley", age: 15, house: "Gryffindor")
      @luna = Student.create!(name: "Luna Lovegood", age: 12, house: "Ravenclaw")

      @defense = Course.create!(name: "Defense Against the Dark Arts")
      @potions = Course.create!(name: "Potions")
      @herbs = Course.create!(name: "Herbology")

      sc_1 = StudentCourse.create!(student: @harry, course: @defense)
      sc_2 = StudentCourse.create!(student: @ron, course: @defense)
      sc_3 = StudentCourse.create!(student: @luna, course: @defense)
      sc_4 = StudentCourse.create!(student: @draco, course: @potions)
      sc_5 = StudentCourse.create!(student: @harry, course: @potions)
    end

    it 'can count the number of students enrolled' do
      expect(@defense.num_students).to eq(3)
      expect(@potions.num_students).to eq(2)
      expect(@herbs.num_students).to eq(0)
    end
  end
end
