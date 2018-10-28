class Product < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 } 

  #def supplier
   # Supplier.find_by(id: supplier_id)
  #end

  belongs_to :supplier

  has_many :category_products


  #def images  
   # Image.where(product_id: id)
  #end
  has_many :images

  has_many :orders



  def is_discounted?
    if price < 4
      return true
    else
      return false
    end
  end

  def tax
    price * 0.09
  end

  def total
    return price + tax
  end

  def image_url_list
    images.map { |image| image.url }
  end
end
