module LayoutOperations
  module GenericLayoutHelper

    def brand

      case params[:controller]
        when 'vehicles'
          title = 'Veiculos'
        when 'vehicle_types'
          title = 'Tipo de Veiculo'
        when 'works'
          title = 'Obras'
        when 'stock_items'
          title = 'Stock'
        when 'work_tasks'
          title = 'Tarefas'
        when 'tasks'
          title = 'Tarefas'
        when 'task_items'
          title = 'Items da tarefa'
        else
          title = params[:controller]
      end

      link_to title, '#', class: 'navbar-brand'
    end

  end
end