class List
  include Mongoid::Document
  field :name, type: String
  field :number, type: String
  
  belongs_to :user
  has_many :list_items

  def items
  	ListItem.where(list_id: id).map do |li|
  		li.item
  	end
  end

  def item_ids
  	items.map(&:id)
  end

  def item_ids=(vals)
  	my_li = ListItem.where(list_id: self.id).map(&:item_id)
  	vals.each do |s|
  		next if s.blank?
  		s_id = BSON::ObjectId.from_string(s)
  	if my_li.include?(s_id)
  		my_li.delete(s_id)
  	else
  		ListItem.create(list_id: self.id, item_id: s_id)
  	end
  end
  	my_li.each do |r|
  		ListItem.find_by(list_id: self.id, item_id: r).destroy
  	end
  end

  # def destroy
  # 	@list= List.find(params[:id])
  # 	@list.destroy
  # 	redirect_to lists_path
  # end
end

