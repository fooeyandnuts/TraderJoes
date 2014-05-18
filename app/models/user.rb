# require BCrypt

class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :zip, type: String
  field :password_digest, type: String

  validates :email, :name, uniqueness: :true, presence: :true

  has_many :lists

	def password
		@password
	end	

	def password=(new_password)
		@password = new_password
		self.password_digest = BCrypt::Password.create(new_password)
	end

	def authenticate(test_password)
		if BCrypt::Password.new(self.password_digest) == test_password
  		self
		else
  		false
    	end
    end

    def edit
    	
    end
    
end
