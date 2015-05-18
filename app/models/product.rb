class Product < ActiveRecord::Base
  attr_accessible :image, :name, :info, :price, :category_id, :create_at
  has_attached_file :image,
                    :url => "/images/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/images/products/:id/:style/:basename.:extension"
  
  validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
  has_many :details
  belongs_to :category
end
