class Task < ActiveRecord::Base

	belongs_to :direction
	belongs_to :user
	has_many :schedules, :dependent => :destroy

	attr_accessible :isDone, :name, :done_at, :direction_id, :desc

	validates :name,  :presence => true
	validates :isDone, :inclusion => { :in => [true, false] }

	default_scope includes(:direction)

	scope :not_done , where(:isDone => false).order("created_at")

	scope :done, where(:isDone => true).order("done_at desc")

	scope :today_done, where('isDone = ? and done_at > ? ', 
					true, Date.today.to_time_in_current_zone).
							order("done_at desc")

	scope :today_add, where("created_at > ?", Date.today.to_time_in_current_zone)

	after_save do |task|
		Schedule.upgrade task.user_id
	end
end
