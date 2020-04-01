class User < ApplicationRecord
  # rolify 
  # after_create :assign_default_role  
  has_many :blogs, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  acts_as_voter
  acts_as_follower

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
  # class Forum < ApplicationRecord
  #   resourcify
  # end
  
end
