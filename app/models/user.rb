class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :roles
  has_many :orders

  Role.all.each do |role|
    define_method "#{role.name}?" do
      role_ids.include?(role.id)
    end
  end
end
