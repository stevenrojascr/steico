class Project < ActiveRecord::Base
  attr_accessible :title
  validates :title, :presence => true
  has_many :tasks
end
