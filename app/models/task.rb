class Task < ActiveRecord::Base
  attr_accessible :admin_user_id, :due_date, :is_done, :project_id, :title
  belongs_to :project
  belongs_to :admin_user
 
  validates :title, :project_id, :admin_user_id, :presence => true
  validates :is_done, :inclusion => { :in => [true, false] }
end
