class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :subdomain, :presence => {:message => "can't be blank"}

  after_create :create_tenant

  private

  def create_tenant
  	Apartment::Tenant.create(subdomain)
  end

  
end
