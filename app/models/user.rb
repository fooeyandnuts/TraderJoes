require "bcrypt"

class User
	def self.after_commit(*args, &block)
		args.each do |arg|
			case arg[:on]
				when :destroy
					after_destroy &block
			end
		end
	end

  include Mongoid::Document
  include Mongoid::Paperclip
  field :name, type: String
  field :email, type: String
  field :zip, type: String
  field :password_digest, type: String

	has_mongoid_attached_file :image,
   :styles => {
      :thumb => "100x100#",   # Centrally cropped
      :small  => "150x150>",  # Only squish if it's larger than this
      :tiny => "50x50"}

  has_many :lists

  validates :email, :name, uniqueness: :true, presence: :true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

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
