require('spec_helper')
require('volunteer')

describe Volunteer do

  before(:each) do 
    @project = Project.new(:title => "humpty dumpty", :id => nil)
    @project.save()
  end

describe "#name" do
  it "returns volunteer name" do 
    practice_volunteer = Volunteer.new({:volunteer => "Anthony", :project_id => 1, :id => nil})
    expect(practice_volunteer.volunteer).to(eq("Anthony"))
  end
end