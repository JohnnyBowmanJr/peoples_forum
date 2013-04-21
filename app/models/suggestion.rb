class Suggestion < ActiveRecord::Base
  attr_accessible :body, :employee_id, :title, :votes, :user_id
  belongs_to :user
  has_many :comments
  has_many :voice_responses
 
end
