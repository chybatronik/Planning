class TasksController < ApplicationController

  before_filter :authenticate_user!
  
  # GET /tasks
  # GET /tasks.json
  def index
    @directions = current_user.directions.active
    
    if params.has_key? :direction_id
      @tasks = current_user.directions.find(params[:direction_id]).tasks.not_done
      @tasks_today_done = current_user.directions.find(params[:direction_id]).tasks.today_done
      @tasks_done = current_user.directions.find(params[:direction_id]).tasks.done
      @tasks_add_count = current_user.directions.find(params[:direction_id]).tasks.today_add.size
      @cur_direction = current_user.directions.find(params[:direction_id])
      @today_tasks_complete = (!(@tasks_today_done.size >= @cur_direction.count_limit) or
                            !current_user.directions.find(params[:direction_id]).isLimit)
      @today_tasks_add_complete = (!(@tasks_add_count >=@cur_direction.count_limit) or
                            !current_user.directions.find(params[:direction_id]).isLimit)
    else
      @tasks = current_user.tasks.not_done
      @tasks_today_done = current_user.tasks.today_done
      @tasks_done = current_user.tasks.done
      @tasks_add_count = current_user.tasks.today_add.size
      @today_tasks_complete = false
      @today_tasks_add_complete = false
      @cur_direction = nil
    end   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = current_user.tasks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = current_user.tasks.new

    if params.has_key? :direction_id
      @task.direction_id = params[:direction_id].to_i
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = current_user.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.new(params[:task])
    @task.isDone = false

    if params.has_key? :direction_id
      @task.direction_id = params[:direction_id].to_i
    end
    
    respond_to do |format|
      if @task.save

        format.html { redirect_to :back, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = current_user.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to direction_tasks_url(@task.direction), notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
      format.js
    end
  end

  def done
    @task = current_user.tasks.find(params[:id])
    @task.isDone = !@task.isDone
    @task.done_at = Time.zone.now  
    @task.save
    redirect_to  :back
  end
end
