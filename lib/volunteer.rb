require('rspec')
require('pg')
require('pry')

class Volunteer
  attr_reader :id
  attr_accessor :volunteer, :project_id

  def initalize(attributes)
    @id = attributes.fetch(:id)
    @volunteer = attributes.fetch(:volunteer)
    @project_id = attributes.fetch(:project_id)
  end