# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
CartItem.delete_all
Item.delete_all
User.delete_all
Cart.delete_all

20.times do |count|
    item = Item.create(
        title: "chaton #{count + 1}",
        description: Faker::Lorem.paragraph,
        price: Faker::Commerce.price(range: 0.01..1.0),
        #For production, we call the S3 file
        image_url: "s3://thechatonproject/chaton/#{count + 1}.jpg"
    )
end

user = User.create(
    email: "seed@test.com",
    password: "azerty"
)

Cart.create(
    user: user
)
