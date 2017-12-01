class Review < ActiveRecord::Base
  belongs_to :product

  validates :product, :content, :presence => true
end
