class NotificationsController < ApplicationController
  def index
  	@notifications = Notification.where(user:current_user).unviewed.latest
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

  def update
  	@notification = Notification.find(params[:id])
    respond_to do |format|
    	if @notification.update(notification_params)
    		format.html { redirect_to :back, notice: "Notificación marcada." }
        format.js {  }
    	else
    		format.html { redirect_to :back, error: "Ocurrio un error :(" }
    	end
    end
  end

  private
  	def notification_params
  		params.require(:notification).permit(:viewed)
  	end
end
