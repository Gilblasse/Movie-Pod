class User < ApplicationRecord
    belongs_to :profile, polymorphic: true
    has_secure_password
    has_secure_password :recovery_password, validations: false
    has_one_attached :avatar


 



end
