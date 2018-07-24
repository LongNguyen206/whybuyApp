class ModelMailer < ApplicationMailer

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.model_mailer.new_booking.subject
    #
    def new_payment(email)
      @email = email
      mail to: @email, subject: "Your Payment @WHYBUY"
    end
  
    def create
      ModelMailer.new_payment(@email).deliver_now
    end
  end