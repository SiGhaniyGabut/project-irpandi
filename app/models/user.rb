class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tickets
  has_many :posts
  has_many :galleries

  def admin?
    role == 'admin'
  end

  def regular?
    role == 'regular'
  end
end
