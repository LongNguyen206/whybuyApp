class ChargesController < ApplicationController
    def new
    end
    
    def create
      # Amount in cents
      @amount = 500
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Whybuy renter',
        :currency    => 'aud'
      )

      redirect_to my_requests_path
      @email = customer.email
      ModelMailer.new_payment(@email).deliver_now
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

    private
    
end
