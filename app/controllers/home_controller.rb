class HomeController < ApplicationController
	# before_filter :authenticate_user!
  def index
  	
  end

  def member_index
  	@user = current_user
  end

  def profile
  	@user = current_user
  end

  def group
  	@recruits = current_user.recruited_users
  end

end
