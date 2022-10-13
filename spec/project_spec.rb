require('spec_helper')
require('project')


  describe Project do 
    describe "#title" do
    project = Project.new({:title => "humpty dumpty", :id => nil})
    expect(project.title).to(eq("humpty dumpty"))
  end
end