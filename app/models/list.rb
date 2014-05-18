class List
  include Mongoid::Document
  field :item, type: String
  field :number, type: String
  
  belongs_to :user

end
