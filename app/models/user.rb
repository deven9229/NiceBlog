class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable

  def username
    return email.split('@')[0].capitalize
  end

  def admin?
    role == "admin"
  end

  def regular?
    role == "regular"
  end

  def guest?
    role == "guest"
  end

end
