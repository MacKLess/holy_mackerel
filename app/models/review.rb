class Review < ActiveRecord::Base
  belongs_to :product

  validates :product, :rating, :content, :presence => true
end
