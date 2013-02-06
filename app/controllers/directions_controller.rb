class DirectionsController < ApplicationController

  before_filter :authenticate_user!
  
  # GET /directions
  # GET /directions.json
  def index
    @directions = current_user.directions.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @directions }
    end
  end

  # GET /directions/1
  # GET /directions/1.json
  def show
    @direction = current_user.directions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @direction }
    end
  end

  # GET /directions/new
  # GET /directions/new.json
  def new
    @direction = current_user.directions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @direction }
    end
  end

  # GET /directions/1/edit
  def edit
    @direction = current_user.directions.find(params[:id])
  end

  # POST /directions
  # POST /directions.json
  def create
    @direction = current_user.directions.new(params[:direction])

    respond_to do |format|
      if @direction.save
        format.html { redirect_to  :action => "index", notice: 'Direction was successfully created.' }
        format.json { render json: @direction, status: :created, location: @direction }
      else
        format.html { render action: "new" }
        format.json { render json: @direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /directions/1
  # PUT /directions/1.json
  def update
    @direction = current_user.directions.find(params[:id])

    respond_to do |format|
      if @direction.update_attributes(params[:direction])
        format.html { redirect_to  :action => "index", notice: 'Direction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directions/1
  # DELETE /directions/1.json
  def destroy
    @direction = current_user.directions.find(params[:id])
    @direction.destroy

    respond_to do |format|
      format.html { redirect_to directions_url }
      format.json { head :no_content }
    end
  end

  def active
    @dir = current_user.directions.find(params[:id])
    @dir.active = !@dir.active
    @dir.save!
    redirect_to  :back
  end

  def limit
    @dir = current_user.directions.find(params[:id])
    @dir.is_limit = !@dir.is_limit
    @dir.save!
    redirect_to  :back
  end
end
