require('spec_helper')
require('project')


  describe Project do 
    describe "#title" do
    project = Project.new({:title => "humpty dumpty", :id => nil})
    expect(project.title).to(eq("humpty dumpty"))
  end
end

  context "#id" do 
  it "returns id before saving" do 
    project = Project.new({:title => "humpty dumpty", :id => nil})
    project.save()
    expect(project.id).to(eq(nil))
  end

  it "returns id after saving" do 
    project = Project.new({:title => 'humpty dumpty',:id => nil})
    project.save()
    expect(project.id).to(be_an_instance_of(Integer))
  end

  describe "#==" do 
  it "is the same project if title is same" do 
    project1 = Project.new({:title => "humpty dumpty", :id => nil})
    project2 = Project.new({:title => "humpty dumpty", :id => nil})
    expect(project1 == project2).to(eq(true))
  end
end

  context ".all" do 
    it "is empty" do 
      expect(Project.all).to(eq([]))
    end
  end

  it "returned all projects" do 
    project1 = Project.new({:title => "humpty dumpty", :id => nil})
    project1.save()
    project2 = Project.new({:title => "BIG FOOT", :id => nil})
    project2.save()
    expect(Project.all).to(eq([project1,project2]))
  end

  describe "#save" do 
  it "saves a project to database" do 
    project = Project.new({:title => "humpty dumpty", :id => nil})
    project.save()
    expect(Project.all).to(eq([project]))
  end
end

  describe ".find" do 
    it "return project by id" do 
      project1 = Project.new({:title => "humpty dumpty", :id =>
    nil})
      project1.save()
      project2 = Project.new({:title => "BIG FOOT", :id => nil})
      project2.save()
      expect(Project.find(project1.id)).to(eq(project1))
