class CartsController < ApplicationController
  def index

  end

  def show
    # @cart = current_cart
    @cart = Cart.find(1)

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
