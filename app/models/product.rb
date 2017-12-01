class Product < ActiveRecord::Base
  validates :name, :cost, :guide, :notes, :presence => true
end
