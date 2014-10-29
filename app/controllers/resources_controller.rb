class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  attr_accessor :from, :to

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all
    @sresource = Resource.new
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
      @resource.from = @resource.path.from unless @resource.path.nil?
      @resource.to = @resource.path.to unless @resource.path.nil?
  end

  # GET /resources/new
  def new
    @resource = Resource.new
    @resource.from = ""
    @resource.to = ""
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)
    path = Path.find_by_from_and_to( resource_params[:from], resource_params[:to])
    path = Path.create(resource_params.permit(:from, :to)) if path.nil?
    @resource.path = path

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    respond_to do |format|
      path = Path.find_by_from_and_to( resource_params[:from], resource_params[:to])
      path = path.create(resource_params.permit(:from, :to)) if path.nil?
      @resource.path = path
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:path_id, :start_time, :open_time, :close_time, :created_by_id, :driver_id, :from, :to)
    end
end
