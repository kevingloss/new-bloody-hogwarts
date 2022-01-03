require 'rails_helper'

RSpec.describe "Student show page" do
  before :each do
    @harry = Student.create!(name: "Harry Potter", age: 14, house: "Gryffindor")
    @draco = Student.create!(name: "Draco Malfoy", age: 13, house: "Slytherin")
    @ron = Student.create!(name: "Ron Weasley", age: 15, house: "Gryffindor")
    @luna = Student.create!(name: "Luna Lovegood", age: 12, house: "Ravenclaw")

    @defense = @harry.courses.create!(name: "Defense Against the Dark Arts")
    @potions = @harry.courses.create!(name: "Potions")
    @herbs = @harry.courses.create!(name: "Herbology")
  end

  it 'will list out all the courses a student is in' do
    visit "/students/#{@harry.id}"

    expect(page).to have_content(@defense.name)
    expect(page).to have_content(@potions.name)
    expect(page).to have_content(@herbs.name)
  end
end
