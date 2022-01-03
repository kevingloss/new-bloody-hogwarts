require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe '#methods' do
    before :each do
      @harry = Student.create!(name: "Harry Potter", age: 14, house: "Gryffindor")
      @draco = Student.create!(name: "Draco Malfoy", age: 13, house: "Slytherin")
      @ron = Student.create!(name: "Ron Weasley", age: 15, house: "Gryffindor")
      @luna = Student.create!(name: "Luna Lovegood", age: 12, house: "Ravenclaw")
    end

    it 'calculates the average age of students' do
      expect(Student.average_age).to eq(13.5)
    end
  end
end
