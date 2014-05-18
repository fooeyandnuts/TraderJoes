class List
  include Mongoid::Document
  field :list_item, type: String
  field :number, type: String
  
  belongs_to :user
  has_many :items

end
