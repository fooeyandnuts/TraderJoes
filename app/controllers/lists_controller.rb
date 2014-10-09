class ListsController < ApplicationController
  before_action :set_list, :only => [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
    respond_with @list
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
    @items = Item.all
  end

  def update
    if @list.update(params.require(:list).permit(:name, :item_ids => []))
      redirect_to lists_path
    else
      render 'edit'
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :number)
  end
end
