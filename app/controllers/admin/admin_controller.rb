class Admin::AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :verify_user

  layout 'admin'

  def index
    
  end
  	
private
  	def verify_user
    	unless current_user.admin
      		redirect_to root_path , :notice => 'Área Restrita.'
    	end
	  end

end