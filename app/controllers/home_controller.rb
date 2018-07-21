class HomeController < ApplicationController
  before_action :admin_restriction, only: [:admin]
  def page
  end
  def admin
  end

  private

  def admin_restriction
    unless admin_signed_in?
      redirect_to root_url
      flash[:notice] = "Yo, turn back!"
    end
  end
end
