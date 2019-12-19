class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable
  enum role: [:user, :admin]

  def set_default_role
      if self.new_record?
  		self.role ||= :user
  	end
  end

  def admin?
    role == "admin"
  end

end
