class DevicesController < ApplicationController
  #before_action :set_device, only: [:show, :edit, :update, :destroy, :use, :release]
  before_action :set_device, except: [:index, :new]
  before_action :set_user

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
    #TODO: should get from login-user
    user_id = @user[:id]

    #TODO: should validate?

    if @device.use user_id
      redirect_to devices_url, notice: 'Device locked for you'
    else
      render action: 'index', notice: 'fail to use'
    end

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
    #TODO: should get from login-user
    user_id = @user[:id]

    #TODO: should use format json
    msg = if @device.release user_id
            {notice: 'Device released'}
          else
            {warn: 'fail or you are not using'}
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

    #TODO should authentication
    def set_user
      @user = {id: 'kato'}
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params.require(:device).permit(:name, :long_name, :os)
    end

#    def user_params
#      params.require(:user).permit(:id)
#    end
end
