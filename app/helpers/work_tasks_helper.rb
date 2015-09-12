module WorkTasksHelper

  def available_tasks
    Task.all.collect { |t| [t.name, t.id] }
  end

  def is_read_only?(finished)
    return (finished.eql? true)
  end

  def work_tasks_finished_cell(finished, finished_at, work_task_id)
    if finished.equal? true
      # 2015-07-25 11:25
      content_tag(:a, finished_at.to_s[0..15])
    else
      link_to 'Terminar ?', finish_work_task_path(id: work_task_id), data: { confirm: 'Tem a certeza que quer terminar a tarefa?' }, remote: true, class: 'finish_post btn btn-info'
    end
  end

  def work_tasks_delete_button(is_admin, read_only, work_task_id, with_td = true)
    if is_admin && !read_only
      button = link_to 'Eliminar', work_task_path(work_task_id), method: :delete, data: { confirm: 'Tem a certeza?' }, remote: true, class: 'delete_post btn btn-danger'

      return with_td ? content_tag(:td, button) : button
    elsif is_admin && read_only
      return with_td ? content_tag(:td, '') : ''
    else
      return ''
    end
  end

  def work_tasks_edit_button(is_admin, work_task_id)
    content_tag(:td, (link_to 'Editar', edit_work_task_path(work_task_id), remote: true, class: 'update_post btn btn-warning')) if is_admin
  end

  def work_tasks_items_button(work_task_id, work_id, vehicle_id, finished, origin, with_td = true)
    button = link_to 'Items', task_items_path(params: { work_task_id: work_task_id, work_id: work_id, vehicle_id: vehicle_id, read_only: is_read_only?(finished), origin: origin }), class: 'list_items btn btn-info'

    return with_td ? content_tag(:td, button) : button
  end

  def work_tasks_labor_button(work_task_id, read_only, with_td = true)
    return (with_td ? content_tag(:td, '') : '') if read_only

    button = link_to 'Mão de Obra', new_labor_user_path(params: {work_task_id: work_task_id}), remote: true, class: 'update_post btn btn-primary'
    return with_td ? content_tag(:td, button) : button
  end

  def go_back_link(origin)
    if origin.eql? 'from_works'
      link_to 'Back', works_path(params: { vehicle_id: params[:vehicle_id] }), class: 'btn btn-primary'
    elsif origin.eql? 'from_vehicles'
      link_to 'Back', vehicles_path, class: 'btn btn-primary'
    end
  end

end
