class HomeController < ApplicationController
	before_filter :authenticate_user!
  def index
  	
  end

  def member_index
  	@user = current_user
  end
end
