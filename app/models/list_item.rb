class ListItem
	include Mongoid::Document
	belongs_to :list
	belongs_to :item
end