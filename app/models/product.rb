class Product < ActiveRecord::Base
  attr_accessible :active, :code, :id_for_customer, :id_for_us, :name, :order_in_list, :category
  validates :code, :name, :category, :active, :presence => true
end
