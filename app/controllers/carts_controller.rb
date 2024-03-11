class CartsController < ApplicationController
  def index

  end

  def show
    @items = Item.all
    @item = Item.find(params[:id])
    @total = item.price * quantity

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
