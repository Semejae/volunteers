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

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    vol = []
    returned_volunteers.each() do |teer| 
      name = teer.fetch("volunteer")
      project_id = teer.fetch("project_id").to_i
      vol.push(Volunteer.new({:volunteer => name, :project_id => project_id, :id => id}))
    end
    vol
  end

  def save 
    result = DB.exec("INSERT INTO volunteers (volunteer, project_id) VALUES ('#{@volunteer}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};").first
    if volunteer
      name = volunteer.fetch("volunteer")
      project_id = volunteer.fetch("project_id").to_i
      id = volunteer.fetch("id").to_i
      Volunteer.new({:volunteer => name, :project_id => project_id, :id => id})
    else
      nil
    end
  end

  