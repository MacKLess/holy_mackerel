class Product < ActiveRecord::Base
  has_many :reviews
  validates :name, :cost, :guide, :notes, :presence => true

  scope :alphabetical, -> { order(:name) }

end
