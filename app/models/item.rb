class Item
  include Mongoid::Document
  field :item_name, type: String

  has_many :list_items
end
