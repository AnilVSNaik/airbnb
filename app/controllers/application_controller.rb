require 'carrierwave/orm/activerecord'


class ApplicationController < ActionController::Base

  include Clearance::Controller
	def allowed?(action:, user:)
      	if current_user.customer?
       		flash[:notice] = "Sorry. You are not allowed to perform this action."
        	return redirect_to listings_url, notice: "Sorry. You do not have the permission to do this."
		end
	end
	def work?(action:, user:)
		if current_user.moderator?
			flash[:notice] = "Sorry. You are not allowed to perform this action"
			return redirect_to listings_url, notice: "Sorry. You do not have permission to do this"
		end
	end

  protect_from_forgery
end
