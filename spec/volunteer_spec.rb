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

describe "#project_id" do 
  it "returns volunteer project_id" do 
    volunteer = Volunteer.new({:volunteer => "Anthony", :project_id => 1, :id => nil})
    expect(volunteer.project_id).to(eq(1))
  end
end

describe "#==" do 
  it "check for same volunteer" do 
    volunteer1 = Volunteer.new({:volunteer => "Anthony", :project_id => 1, :id => nil })
    volunteer1 = Volunteer.new({:volunteer => "Anthony", :project_id => 1, :id => nil })
    expect(volunteer1 == volunteer1).to(eq(true))
  end
end

context ".all" do 
  it "is empty" do 
    expect(Volunteer.all).to(eq([]))
  end
end
