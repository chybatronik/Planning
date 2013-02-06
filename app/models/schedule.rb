class Schedule < ActiveRecord::Base
  belongs_to :task

  attr_accessible :is_done, :task_id, :user_id, :index_of_day

  scope :today, where(:index_of_day => 0)

  def self.upgrade user_id
  	self.delete_all    
    user = User.find(user_id)
    user.last_update_schedule = Date.today.to_time_in_current_zone
    user.save!

  	p user_id
  	dict_list = []
  	list_direction = Direction.where(:active => true, :user_id => user_id)
  						.order("created_at")
  	max_lenght_list = 0
    dictOfIndex_count = {}
    dictOfIndex = {}

  	list_direction.each do |direction|
  		list_tasks = direction.tasks.not_done
  		dict_list << list_tasks
      if direction.tasks.today_done.length == 0
        dictOfIndex_count[direction.id] = 0
      else
        dictOfIndex_count[direction.id] = direction.tasks.today_done.length
      end
      dictOfIndex[direction.id] = 0

  		if list_tasks.size > max_lenght_list
  			max_lenght_list = list_tasks.size
  		end
  	end
  	rezult = []

  	max_lenght_list.times do |index|
  		dict_list.each do |direction_list|
  			if direction_list.size >= (index +1) 
  				rezult << direction_list[index] 
	  		end
  		end
  	end

    count_of_play = 0

  	rezult.each do |task|
  		schdl = Schedule.new
  		schdl.task_id = task.id
  		schdl.user_id = task.user_id
  		schdl.is_done = false

      if task.is_play
        count_of_play += 1
        if count_of_play > 1
          task.update_attribute(:is_play,false)
        end
      end


      dictOfIndex_count[task.direction_id] += 1
      if dictOfIndex_count[task.direction_id] > task.direction.count_limit
        dictOfIndex_count[task.direction_id] = 0
        dictOfIndex[task.direction_id] += 1
      end
      schdl.index_of_day = dictOfIndex[task.direction_id] 
  		schdl.save!
  	end
  end


end
