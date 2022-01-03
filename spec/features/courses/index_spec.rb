require 'rails_helper'

RSpec.describe "Courses Index Page" do
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

  it 'shows a list of students and their information' do
    visit "/courses"

    within("#course-#{@defense.id}") do
      expect(page).to have_content(3)
    end

    within("#course-#{@potions.id}") do
      expect(page).to have_content(2)
    end

    within("#course-#{@herbs.id}") do
      expect(page).to have_content(0)
    end
  end
end
