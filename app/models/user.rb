# email:string
# password_digest:string
#
# password:string (virtual attribute)
# password_confirmation:string (virtual attribute)
class User < ApplicationRecord
    has_many :twitter_accounts
    has_many :tweets
    
    has_secure_password

    validates :email, presence: true , format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ , message: "Invalid email format" }
    validates :password, presence: true
end
