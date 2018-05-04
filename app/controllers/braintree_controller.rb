class BraintreeController < ApplicationController
	
	def new
		@listing_id = params[:listing_id]
	    @client_token = Braintree::ClientToken.generate
	    p params
	    @reservation = Reservation.find(params[:reservation_id])
	end

	def checkout
	  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
	  	listing = Listing.find(params[:listing_id])
	  	reservation = Reservation.find(params[:checkout_form][:reservation_id])
	  result = Braintree::Transaction.sale(
	   :amount => listing.price,
	   :payment_method_nonce => nonce_from_the_client,
	   :options => {
	      :submit_for_settlement => true
	    }
	   )
	  byebug
	  @user = current_user
	  if result.success?
	  	ReservationMailer.reservation_email(current_user, @listing, @rsvp_id).deliver_now
	  	reservation.status = true  
	    redirect_to :root, :flash => { :success => "Transaction successful!" }


	  else
	  	reservation.destroy 
	    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
	    # reservation.destroy
	  end
	end
end
