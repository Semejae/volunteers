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
    expect(project.id).to(be_an_instance_of(Integer))
  end
