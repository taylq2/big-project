class Buyer < User
  belongs_to :area

  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy
end
