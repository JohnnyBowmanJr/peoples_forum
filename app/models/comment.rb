class Comment < ActiveRecord::Base
  attr_accessible :body, :suggestion_id
  belongs_to :suggestion
  belongs_to :user
end
