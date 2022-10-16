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

  def ==(volunteer_to_compare)
    if volunteer_to_compare != nil
  (self.volunteer() == volunteer_to_compare.volunteer()) && (self.project_id() == volunteer_to_compare.project_id())
    else
      false
    end
  end

  