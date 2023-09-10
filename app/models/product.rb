class Product < ApplicationRecord
  validates :product_type, :price, :name, presence: true
  has_one_attached :thumbnail

  enum product_type: {
    product: 0,
    event: 1
  }

  def thumbnail_url
    Faker::LoremFlickr.image  #(size: "50x60")
  end

  # def attributes(*args)
  #   h = super(args)
  #   super(
  #     root: true,
  #     methods: :thumbnail_url
  #   )
  # end
end
