class VoiceResponse < ActiveRecord::Base
  attr_accessible :manager_id, :suggestion_id
  belongs_to :manager
end
