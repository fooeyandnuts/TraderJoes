class ListsController < ApplicationController
  # before_action :authenticate_user
# def index
#     @show_all = params[:show_all]
#     if @show_all == true
#       @items = Item.all
#    end
#   end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
    @items = Item.all
  end

  def create
    List.create(params.require(:list).permit(:name, :item_ids => []))
    redirect_to lists_path
  end

  def edit
    @list = List.find(params[:id])
    @items = Item.all
  end

  def update
    @list = List.find(params[:id])
    if @list.update(params.require(:list).permit(:name, :item_ids => []))
      redirect_to lists_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
  
  def list_params
    params.require(:list).permit(:name, :number)
  end
end
