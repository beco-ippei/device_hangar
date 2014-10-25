class DevicesController < ApplicationController
  #before_action :set_device, only: [:show, :edit, :update, :destroy, :use, :release]
  before_action :set_device, except: [:index, :new]

  # GET /devices
  # GET /devices.json
  def index
    @devices = Device.all
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # GET /devices/new
  def new
    @device = Device.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /use
  # POST /use.json
  def use
    #TODO: should validate?

    flash = case @device.use current_user
            when :using, true
              {notice: 'device locked for you'}
            when :used
              {alert: 'another user locked'}
            else
              {alert: 'fail to use'}
            end
    redirect_to devices_url, flash

    #TODO: format
#    respond_to do |format|
#      if @device.use user_id
#        format.html { redirect_to @device, notice: 'Device used' }
#        format.json { render action: 'index', status: :used, location: @device }
#      else
#        format.html { render action: 'index', notice: 'fail to use' }
#        format.json { render json: @device.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # POST /release
  # POST /release.json
  def release
    #TODO: should use format json
    msg = if @device.release current_user
            {notice: 'Device released'}
          else
            {alert: 'fail or you are not using'}
          end
    #msg = if @device.user != user_id
    #        {warn: 'you are not using'}
    #      elsif @device.release user_id
    #        {notice: 'Device released'}
    #      else
    #        {warn: 'fail to release'}
    #      end
    redirect_to devices_url, msg
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.html { redirect_to @device, notice: 'Device was successfully created.' }
        format.json { render action: 'show', status: :created, location: @device }
      else
        format.html { render action: 'new' }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.html { redirect_to @device, notice: 'Device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.html { redirect_to devices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:name, :long_name, :carrier, :os, :version)
    end
end
