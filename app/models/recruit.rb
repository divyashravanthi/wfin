class Recruit < ActiveRecord::Base
	belongs_to :user
  belongs_to :recruited_user, class_name: "User"
end
