class Seller < User
  belongs_to :area

  has_many :products, dependent: :destroy
  has_many :order_details, dependent: :destroy
end
