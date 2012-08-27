# encoding: UTF-8
ActiveAdmin.register Task do
  menu :parent => "Admin Proyectos"
  scope :all, :default => true
  scope :due_this_week do |tasks|
    tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now)
  end
  scope :late do |tasks|
    tasks.where('due_date < ?', Time.now)
  end
  scope :mine do |tasks|
    tasks.where(:admin_user_id => current_admin_user.id)
  end
  
  
  show do
    panel "Detalle de Tarea" do
      attributes_table_for task do
        row("Status") { status_tag (task.is_done ? "Completada" : "Pendiente"), (task.is_done ? :ok : :error) }
        row("Nombre") { task.title }
        row("Proyecto") { link_to task.project.title, admin_project_path(task.project) }
        row("Asignado a") { link_to task.admin_user.email, admin_admin_user_path(task.admin_user) }
        row("Fecha límite") { task.due_date? ? l(task.due_date, :format => :long) : '-' }
      end
    end

    active_admin_comments
  end
  
  sidebar "Otras Tareas para este Usuario", :only => :show do
    table_for current_admin_user.tasks.where(:project_id => task.project) do |t|
      t.column("Status") { |task| status_tag (task.is_done ? "Completada" : "Pendiente"), (task.is_done ? :ok : :error) }
      t.column("Nombre") { |task| link_to task.title, admin_task_path(task) }
    end
  end
    
end
