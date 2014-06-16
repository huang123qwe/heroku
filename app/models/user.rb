class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  
  with_options :prefix => true, :allow_nil => true do |option|
    option.delegate :name, :to => :profile
  end        
end
