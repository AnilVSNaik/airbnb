class GuestsCleanupJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    ReservationMailer.welcome_email(user).deliver_now
  end
end
