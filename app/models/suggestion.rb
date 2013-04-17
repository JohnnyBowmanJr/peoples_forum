class Suggestion < ActiveRecord::Base
  attr_accessible :body, :employee_id, :title, :votes
  belongs_to :employee
  has_many :comments
  has_many :voice_responses

 
end
