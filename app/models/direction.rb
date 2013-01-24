class Direction < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy

  attr_accessible :active, :name, :user_id, :is_limit, :icon, :count_limit, :desc

  scope :active, where(:active => true)

  after_save do |dir|
	Schedule.upgrade dir.user_id
  end
end
