class ItemsController < ApplicationController
  # before_action :authenticate_user

#   def new
#     @item = Item.new
#   end

#   def create
#     @item = Item.create(item_params)
#     if @item.save
#       redirect_to items_path
#     else
#       render 'new'
#     end
#   end

#   def edit
#   end

#   def destroy
#     @item.destroy
#     redirect_to items_path
#   end

#   private
  
#   def item_params
#     params.require(:item).permit(:item_name)
#   end
# end
