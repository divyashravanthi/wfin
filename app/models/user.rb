class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  GENDER = %w(Male Female)
  validates :gender, :inclusion => {:in => GENDER}

  has_many :recruits
  has_many :recruited_users, through: :recruits

  rails_admin do
    configure :set_password

    edit do
      exclude_fields :password, :password_confirmation, :reset_password_sent_at, :remember_created_at,
      	:sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip

      include_fields :set_password
    end
  end

  before_create :assign_sponsor

  # Provided for Rails Admin to allow the password to be reset
  def set_password; nil; end

  def assign_sponsor
  	User.find(self.sponsor_id) << self.recruited_users
  end

  def set_password=(value)
    return nil if value.blank?
    self.password = value
    self.password_confirmation = value
  end
end
