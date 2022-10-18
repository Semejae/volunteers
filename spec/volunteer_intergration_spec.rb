require('capybara/rspec')
require('./app')
require('pry')
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the project creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can create a project' do
    visit '/'
    click_on('Add a new project')
    fill_in('project_name', :with => 'humpty dumpty')
    click_button('Create Project')
    expect(page).to have_content('humpty dumpty')
  end
end

# A user should be able to click on a project to see its detail. The detail page includes a form where the project can be updated. When the form is submitted, the user can be directed to either the home page or that project's detail page. (The test will work for either.)

describe 'the project update path', {:type => :feature} do
  it 'allows a user to change the name of the project' do
    test_project = Project.new({:title => 'humpty dumpty', :id => nil})
    test_project.save
    visit '/'
    click_link('humpty dumpty')
    click_link('Edit Project')
    fill_in('title', :with => 'humpty dumpty')
    click_button('Update Project')
    expect(page).to have_content('humpty dumpty')
  end
end

# A user should be able to nagivate to a project's detail page and delete the project. The user will then be directed to the index page. The project should no longer be on the list of projects.

describe 'the project delete path', {:type => :feature} do
  it 'allows a user to delete a project' do
    test_project = Project.new({:title => 'humpty dumpty', :id => nil})
    test_project.save
    id = test_project.id
    visit "/projects/#{id}/edit"
    click_button('Delete Project')
    visit '/'
    expect(page).not_to have_content("humpty dumpty")
  end
end

# The user should be able to click on a project detail page and see a list of all volunteers working on that project. The user should be able to click on a volunteer to see the volunteer's detail page.

describe 'the volunteer detail page path', {:type => :feature} do
  it 'shows a volunteer detail page' do
    test_project = Project.new({:title => 'humpty dumpty', :id => nil})
    test_project.save
    project_id = test_project.id.to_i
    test_volunteer = Volunteer.new({:volunteer => 'Anthony', :project_id => project_id, :id => nil})
    test_volunteer.save
    visit "/projects/#{project_id}"
    expect(page).to have_content('Anthony')
  end
end