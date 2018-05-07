class ReservationsController < ApplicationController
    def new
        @listing = Listing.find(params[:id])
        @rsvp = Reservation.new

    end

    def show
        @rsvp = Reservation.all
    end


    def create
        @listing = Listing.find(params[:id])
        @rsvp = Reservation.new(reservation_params)
        respond_to do |format|

            if date_checker(@rsvp.start_date, @rsvp.end_date)  
                @rsvp.save       
                #Message produced when successfull        
                format.html { redirect_to braintree_new_path(listing_id: @listing.id, reservation_id: @rsvp.id), notice: 'Booking was successfully created' }
                format.json { render json: @rsvp, status: :created, location: @rsvp }     
            else
                #Message produced when failed
                format.html { redirect_to reservations_new_path, notice: "Booking could not be made. The dates may have been taken" }
            end

            
        end
    end

        
      private 

    def reservation_params
            params.require(:reservations).permit(:user_id, :listing_id, :guest_number, :verification, :start_date, :end_date)
    end

    def date_checker(start_date,end_date)
        @reservation = Reservation.where("listing_id = ?" , params[:id])
        if @reservation.count != 0
            @reservation.each do |r|
                if !(r.end_date <= start_date || r.start_date >= end_date)
                        flash[:notice] ="Sorry, the dates have been taken."
                    return false
                end
            end
        else
            return true
        end
    end
end