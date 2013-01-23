class Note < ActiveRecord::Base
  attr_accessible :desc, :dir, :user_id

  belongs_to :user
end
