class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :profile_exists, only: [:new, :create]
  # this will prevent normal users from viewing the list of all profiles
  before_action :admin_restriction, only: [:index]
  
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    # allow user_id assignment to admin, admin can create any users' profile
    if admin_signed_in?
      @profile = Profile.new(admin_profile_params)
    # prevent mass assignemnt for normal users
    else
      @profile = Profile.new(profile_params)
    # link current user's id to the user_id of the profile being created
      @profile.user_id = current_user.id
    end

    # if a user creates a profile with company name, rather than first and last name, assign iscompany to true in profile's table
    unless @profile.company_name.nil?
      @profile.iscompany = true
    end

    respond_to do |format|
      if @profile.save
        format.html { redirect_to admin_redirect, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to admin_redirect, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_profile
      # this condition will prevent users from seeing their profile_ids in url, while still allowing admins to edit and delete individual profiles
      if admin_signed_in?
        @profile = Profile.find(params[:id])
      else
        @profile = current_user.profile
      end
    end

    def admin_restriction
      unless admin_signed_in?
        redirect_to root_url
        flash[:notice] = "Yo, turn back!"
      end
    end

    def profile_exists
      unless admin_signed_in?
        if current_user.profile
          respond_to do |format|
            format.html { redirect_to root_url, notice: 'You already have a profile'}
          end
        end
      end
    end

    def admin_redirect
      if admin_signed_in?
        path = profile_url(@profile)
      else
        path = my_profile_path
      end
      return path
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    
    # Got rid of :user_id permitted parameter to avoid user assigning profile to different user
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :gender, :dob, :phone, :occupation, :description, :company_name, :photo, :iscompany)
    end
    # but allow user assignment to admin
    def admin_profile_params
      params.require(:profile).permit(:user_id, :first_name, :last_name, :gender, :dob, :phone, :occupation, :description, :company_name, :photo, :iscompany)
    end
end
