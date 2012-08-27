# encoding: UTF-8
ActiveAdmin.register Store do
  menu :parent => "Catálogos"
  index do
    column :id
    column :code
    column :name
    column :id_for_customer
    column :id_for_us
    column :order_in_list
    column :active
    default_actions
  end
end
