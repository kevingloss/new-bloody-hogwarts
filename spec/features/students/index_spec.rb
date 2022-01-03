require 'rails_helper'

RSpec.describe "Students Index Page" do
  before :each do
    @harry = Student.create!(name: "Harry Potter", age: 14, house: "Gryffindor")
    @draco = Student.create!(name: "Draco Malfoy", age: 13, house: "Slytherin")
    @ron = Student.create!(name: "Ron Weasley", age: 15, house: "Gryffindor")
    @luna = Student.create!(name: "Luna Lovegood", age: 12, house: "Ravenclaw")
  end

  it 'shows a list of students and their information' do
    visit "/students"

    within("#student-#{@harry.id}") do
      expect(page).to have_content(@harry.name)
      expect(page).to have_content(@harry.age)
      expect(page).to have_content(@harry.house)
    end
    
    within("#student-#{@draco.id}") do
      expect(page).to have_content(@draco.name)
      expect(page).to have_content(@draco.age)
      expect(page).to have_content(@draco.house)
    end
  end
end
