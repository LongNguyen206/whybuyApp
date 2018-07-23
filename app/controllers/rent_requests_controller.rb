class RentRequestsController < ApplicationController
  # every action involving rent requests, requires the user/admin to be logged in
  before_action :authenticate
  before_action :set_rent_request, only: [:show, :edit, :update, :destroy]
  # call a set_listing action before any other to determine which listing we are working with
  before_action :set_listing

  # GET /rent_requests
  # GET /rent_requests.json

  # index action will be used as an aggregated view for all the requests for a particular listing
  def index
    if current_user.id != @listing.user_id
      no_access
    else
      @rent_requests = RentRequest.where(:listing_id => @listing.id)
    end
    # @rent_requests = RentRequest.all.order(created_at: :asc)
  end

  # GET /rent_requests/1
  # GET /rent_requests/1.json
  def show
  end

  # GET /rent_requests/new
  def new
    # we instantiate RentRequest objects as children of Listing object
    if current_user.id == @listing.user_id
      redirect_to root_path
      flash[:notice] = "You cannot request your own item!"
    else
      @rent_request = @listing.rent_requests.new
    end
  end

  # GET /rent_requests/1/edit
  def edit
    # only allow admins and creators of requests to edit them (not even owners)
    unless admin_signed_in? || (@rent_request.requester_id == current_user.id)
      no_access
    end
  end

  # POST /rent_requests
  # POST /rent_requests.json
  def create
    # see the comment to 'new' action
    @rent_request = @listing.rent_requests.new(rent_request_params)
    # listing_id field should be the same as id of the listing we are working with
    @rent_request.listing_id = @listing.id
    # owner is determined as the user who created the listing
    @rent_request.owner_id = @listing.user.id
    # the current user is the requester
    @rent_request.requester_id = current_user.id

    respond_to do |format|
      if @rent_request.save
        format.html { redirect_to listing_path(@listing), notice: 'Rent request was successfully created.' }
        format.json { render :show, status: :created, location: @rent_request }
      else
        format.html { render :new }
        format.json { render json: @rent_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rent_requests/1
  # PATCH/PUT /rent_requests/1.json
  def update
    respond_to do |format|
      if @rent_request.update(rent_request_params)
        format.html { redirect_to listing_path(@listing), notice: 'Rent request was successfully updated.' }
        format.json { render :show, status: :ok, location: @rent_request }
      else
        format.html { render :edit }
        format.json { render json: @rent_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rent_requests/1
  # DELETE /rent_requests/1.json
  def destroy
    @rent_request.destroy
    respond_to do |format|
      format.html { redirect_to rent_requests_url, notice: 'Rent request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def authenticate
      unless user_signed_in? || admin_signed_in?
        redirect_to new_user_session_url
      end
    end
    
    def no_access
      redirect_to root_path
      flash[:notice] = "Can't touch dis!"
    end

    def set_rent_request
      @rent_request = RentRequest.find(params[:id])
    end

    # define a listing we are working with (used in before callback)
    def set_listing
      @listing = Listing.find(params[:listing_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rent_request_params
      params.require(:rent_request).permit(:total_price)
    end
end
