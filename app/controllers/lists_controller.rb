class ListsController < ApplicationController
  
# def index
#     @show_all = params[:show_all]
#     if @show_all == true
#       @items = Item.all
#    end
#   end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    end
  end

  def view
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    if @list = List.update(list_params)
      flash[:success] = "User profile has been updated"
      redirect_to lists_path
    else
      render "edit"
    end
  end

  def destroy
  end

  def show
  end

  def list_params
    params.require(:list).permit(:item, :number)
  end
end
