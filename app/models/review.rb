class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product, :content, :presence => true
end
