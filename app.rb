require("pg")
require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('pry')
require('./lib/volunteer')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})  

get('/') do
  @projects = Project.all
  erb(:projects)
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

get('/projects/new') do
  erb(:new_project)
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  erb(:project)
end

post('/projects') do
  title = params[:project_name]
  project = Project.new(:title => title, :id => nil)
  project.save()
  @projects = Project.all()
  erb(:projects)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

patch('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.update(params)
  @projects = Project.all
  erb(:projects)
end

delete('/projects/:id') do
  @project = Project.find(params[:id].to_i())
  @project.delete()
  @projects = Project.all
  erb(:projects)
end

post('/projects/:id/volunteer') do
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.new({:volunteer => params[:volunteer_name], :project_id => @project.id, :id => nil})
  # test_volunteer = Volunteer.new({:volunteer => 'Anthony', :project_id => project_id, :id => nil})
  volunteer.save()
  erb(:project)
end

patch('/projects/:id/volunteer/:volunteer_id') do
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.find(params[:volunteer_id].to_i())
  volunteer.update(params[:name], @project.id)
  erb(:project)
end


delete('/projects/:id/volunteer/:volunteer_id') do

  volunteer = Volunteer.find(params[:volunteer_id].to_i())
  volunteer.delete
  @project = Project.find(params[:id].to_i())
  erb(:project)
end