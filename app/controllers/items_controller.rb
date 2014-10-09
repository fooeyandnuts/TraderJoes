class ItemsController < ApplicationController
  before_action :set_item, :only => [:index, :show, :edit, :update, :destroy]

  respond_to :json, :html

  def index
    @items = Item.all
    respond_with @items
  end

  def show
    respond_with @item
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      respond_to do |format|
        format.html {
          redirect_to items_path }
        format.json { render json: @item, status: :created }
      end
    else
      respond_to do |format|
        format.html { render 'new'}
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      respond_to do |format|
        format.html { redirect_to items_path }
        format.json { render nothing: true, status: :no_content }
      end
    else
      respond_to do |format|
        format.html { render 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_path }
      format.json { render json: { head: :ok } }
    end
  end

  protected

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name)
  end
end
