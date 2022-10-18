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

  it "returns all volunteers" do 
    project = Project.new({:title => "humpty dumpty", :id => nil})
    project.save()
    volunteer1 = Volunteer.new({:volunteer => "Anthony", :project_id => project.id, :id => nil})
    volunteer1.save()
    volunteer2 = Volunteer.new({:volunteer => "Kacie", :project_id => project.id, :id => nil})
    volunteer2.save()
    expect(Volunteer.all).to(eq([volunteer1,volunteer2]))
  end
end

describe "#save" do 
  it "save a volunteer to project" do 
    vol = Volunteer.new({:volunteer => "Anthony", :project_id => 1, :id => nil})
    vol.save()
    expect(Volunteer.all).to(eq([vol]))
  end
end

describe ".find" do
  it "return volunteer by id" do 
    volunteer1 = Volunteer.new({:volunteer => "Anthony", :project_id => 1, :id => nil})
    volunteer1.save()
    volunteer2 = Volunteer.new({:volunteer => "Kacie", :project_id => 1, :id => nil})
    volunteer2.save()
    expect(Volunteer.find(volunteer1.id)).to(eq(volunteer1))
  end
end

describe ".find_by_project" do
  it "finds volunteers for project" do 
    project = Project.new({:title => "humpty dumpty", :id => nil})
    project.save()
    volunteer1 = Volunteer.new({:volunteer => "Anthony", :project_id => 1, :id => nil})
    volunteer1.save()
    volunteer2 = Volunteer.new({:volunteer => "Kacie", :project_id => 1, :id => nil})
    volunteer2.save()
    expect(Volunteer.find_by_project(1)).to(eq([volunteer1,volunteer2]))
  end
end

describe "#update" do 
  it "update a volunteer id" do 
    volunteer = Volunteer.new({:volunteer => "Anthony", :project_id => 1, :id => nil})
    volunteer.save()
    volunteer.update("humpty lumpty", 1)
    expect(volunteer.volunteer).to(eq('humpty lumpty'))
  end
end

describe "#delete" do
  it "allows user to delete volunteer by id" do 
    volunteer1 = Volunteer.new({:volunteer => "Anthony", :project_id => 1, :id => nil})
    volunteer1.save()
    volunteer2 = Volunteer.new({:volunteer => "Kacie", :project_id => 1, :id => nil})
    volunteer2.save()
    volunteer1.delete()
    expect(Volunteer.all).to(eq([volunteer2]))
  end
end

describe "#project" do 
  it "finds the project a volunteer belongs to" do
    volunteer = Volunteer.new({:volunteer => "Anthony", :project_id => 1, :id => nil})
    volunteer.save()
    expect(volunteer.project()).to(eq(@project))
  end
end

describe ".clear" do
  it "clear all volunteers" do
    volunteer1 = Volunteer.new({:volunteer => "Anthony", :project_id => 1, :id => nil})
    volunteer1.save()
    volunteer2 = Volunteer.new({:volunteer => "Kacie", :project_id => 1, :id => nil})
    volunteer2.save()
    Volunteer.clear()
    expect(Volunteer.all).to(eq([]))
  end
end


