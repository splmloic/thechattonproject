class ImagesController < ApplicationController
    def show
        @image = Item.find(params[:id]).image_url
    end
end
