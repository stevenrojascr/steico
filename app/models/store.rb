class Store < ActiveRecord::Base
  attr_accessible :active, :id_for_customer, :id_for_us, :order_in_list, :name, :code
  validates :code, :name, :active, :presence => true
end
