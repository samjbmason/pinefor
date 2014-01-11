class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :lists
  has_many :gifts

  def first_name
    name.split(' ')[0] if name
  end
end
