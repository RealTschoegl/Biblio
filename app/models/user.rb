class User < ActiveRecord::Base

  ROLES = %w[reader author admin]
  def role?(base_role)
     role.present? && ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
  attr_accessible :first_name, :last_name, :username, :email, :password, :password_confirmation, :role
end
