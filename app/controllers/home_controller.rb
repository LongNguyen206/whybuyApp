class HomeController < ApplicationController
  before_action :admin_restriction, only: [:admin]

  def page
    if user_signed_in?
      @listings = Listing.where.not(user_id: current_user.id).order(created_at: :asc)
    else
      @listings = Listing.all.order(created_at: :asc)
    end
  end
  
  def admin
    @listings = Listing.all.order(created_at: :asc)
  end

  private

  def admin_restriction
    unless admin_signed_in?
      redirect_to root_url
      flash[:notice] = "Yo, turn back!"
    end
  end
end