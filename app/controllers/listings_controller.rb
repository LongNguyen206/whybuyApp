class ListingsController < ApplicationController
  # every action involving listings, except 'show', requires the user/admin to be logged in
  before_action :authenticate, except: [:show]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  # before_action :detach_associated, only: [:destroy]
 
  # GET /listings
  # GET /listings.json
  def index
    # only allow admins to view the index page for listings (with CRUD rights)
    unless admin_signed_in?
      no_access
    end
    # order the listings for ADMIN view (users access listings list in home page)
    @listings = Listing.all.order(created_at: :asc)
  end

  def indiv_index
    # here we define @listings for each user's profile view (when logged in)
    @listings = Listing.where(:user_id => current_user.id)
  end
  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
    unless admin_signed_in? || (@listing.user_id == current_user.id)
      no_access
    end
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    respond_to do |format|
      if @listing.save
        format.html { redirect_to admin_redirect, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to admin_redirect, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to admin_redirect, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # request logging in for all operations with listings (except 'show')
    def authenticate
      unless user_signed_in? || admin_signed_in?
        redirect_to new_user_session_url
      end
    end
    
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def admin_redirect
      if admin_signed_in?
        path = listing_url(@listing)
      else
        path = my_listings_url
      end
      return path
    end

    def no_access
      redirect_to root_path
      flash[:notice] = "Can't touch dis!"
    end

    # def detach_associated
    #   @listing.rent_requests.update_all(:listing_id => nil)
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :rate, :deposit, :description)
    end
    
end
