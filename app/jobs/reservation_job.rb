class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(user, listing, reservation_id)
   	ReservationMailer.reservation_email(user, listing, reservation_id).deliver_now
  end
end
