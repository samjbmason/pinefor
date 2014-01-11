class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lists
  has_many :gifts

  validates :full_name, presence: true

  def first_name
    full_name.split(' ')[0] if full_name
  end
end
