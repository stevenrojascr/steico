# encoding: UTF-8
ActiveAdmin.register Project do
  menu :parent => "Admin Proyectos"
  index do
    column :title do |project|
      link_to project.title, admin_project_path(project)
    end

    default_actions
  end

  # Filter only by title
  filter :title  
  
  show :title => :title do
    panel "Tareas" do
      table_for project.tasks do |t|
        t.column("Status") { |task| status_tag (task.is_done ? "Completada" : "Penidente"), (task.is_done ? :ok : :error) }
        t.column("Nombre") { |task| link_to task.title, admin_task_path(task) }
        t.column("Asignado a") { |task| task.admin_user.email }
        t.column("Fecha límite") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
      end
    end
  end

end
