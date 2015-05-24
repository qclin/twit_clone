class User < ActiveRecord::Base
  # the option of killing it's dependent upon self-destruction
  has_many :tweets, dependent: :destroy

  has_secure_password 
  
end
