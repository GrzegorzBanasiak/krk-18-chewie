class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :role, presence: true, inclusion: { in: %w(user admin moderator)}

  def admin?
    role == 'admin'
  end

  has_many :products
  has_many :recipes

  ratyrate_rater

end
