class Item
  include Mongoid::Document
  field :item_name, type: String

  has_and_belongs_to_many :lists
end
