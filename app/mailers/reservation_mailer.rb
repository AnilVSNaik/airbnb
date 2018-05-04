class ReservationMailer < ApplicationMailer

  	def reservation_email(user,listing,reservation_id)
	    @user = user
	    @rsvp_id = reservation_id
	    @listing = listing
	    @url  = 'localhost:3000/listings/:id/reservations/new'
	    mail(to: @user.email, subject: 'Your Booking has been confirmed')
	end

	def welcome_email(user)
		p "inside of welcome email"
		@user = user
		@url = 'localhost:3000/sign_in'
		mail(to: @user.email, subject: 'Welcome to My Awesome Site')
	end 

end
