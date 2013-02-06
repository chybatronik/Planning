class Task < ActiveRecord::Base

	belongs_to :direction
	belongs_to :user
	has_many :schedules, :dependent => :destroy

	attr_accessible :is_done, :name, :done_at, :direction_id, :desc,
					:is_play, :duration_done, :start_play

	validates :name,  :presence => true
	validates :is_done, :inclusion => { :in => [true, false] }

	default_scope includes(:direction)

	scope :not_done , where(:is_done => false).order("created_at")

	scope :done, where(:is_done => true).order("done_at desc")

	scope :today_done, where('is_done = ? and done_at > ? ', 
					true, Date.today.to_time_in_current_zone).
							order("done_at desc")

	scope :today_add, where("created_at > ?", Date.today.to_time_in_current_zone)

	after_save do |task|
		Schedule.upgrade task.user_id
	end
end
