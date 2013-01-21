class SchedulesController < ApplicationController

  before_filter :authenticate_user!

  # GET /schedules
  # GET /schedules.json
  def index
    if current_user.last_update_schedule != Date.today.to_time_in_current_zone 
      current_user.schedules.upgrade current_user.id
    end

    @schedules = current_user.schedules.includes(:task).today
    @schedules_today_done = current_user.tasks.today_done

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedules }
    end
  end

  def done
    @schedule = current_user.schedules.find(params[:id])

    @task = current_user.tasks.find(@schedule.task_id)
    @task.isDone = !@task.isDone
    @task.done_at = Time.zone.now  
    @task.save

    redirect_to  :back
  end
end
