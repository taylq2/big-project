class Area < ApplicationRecord
  has_many :areas_products, dependent: :destroy
  has_many :products, through: :areas_products, dependent: :destroy
  has_many :buyers, dependent: :destroy
  has_many :sellers, dependent: :destroy

  def area_ids_of_product product_id
    areas_products.find_by(product_id: product_id)
  end
end
