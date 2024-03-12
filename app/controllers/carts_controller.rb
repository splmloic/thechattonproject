class CartsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def show
    @cart = current_user.cart
    @cart_items = @cart.items
    total = 0 #itilize total
    @cart_items.each do |item| #calcul of the sum of the cart
      puts item.price.to_f.inspect
      total = total + item.price
    end
    @total = total

  end

  def new

  end

  def create

  end

  def edit

  end

  def update
    puts "#*50"
    puts "je suis dans cart update"
    puts params
    puts "#*50"
    @item = Item.find(params[:id])
    @cart = current_user.cart
    @cart_items = @cart.cart_items
    if @cart_items
      @cart_items = CartItem.create(cart:@cart,item:@item)
      flash[:notice] = "L'article a été ajouté au panier avec succès."
    else
      flash[:alert] = "Nous avons rencontré une erreur, veuillez réessayer ou contacter notre équipe si l'erreur persiste."
    end

  end

  def destroy
    puts "#*50"
    puts "je suis dans cart destroy"
    puts params
    puts "#*50"
    @item = Item.find(params[:id])
    puts @item
    @cart = current_user.cart
    puts @cart
    @cart_item = @cart.cart_items.find_by(item_id: @item.id)
    puts @cart_item.inspect
    @cart_item.destroy
    redirect_to cart_path
  end

end
