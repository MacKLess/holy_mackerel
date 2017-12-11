class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews

  attr_accessor :password
  validates_confirmation_of :password
  validates :email, :name, presence: true, uniqueness: true

end
