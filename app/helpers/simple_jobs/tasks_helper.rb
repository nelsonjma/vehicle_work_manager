module SimpleJobs
  module TasksHelper

    def simple_task_finished_cell(finished, finished_at, simple_task_id)
      if finished.eql? true
        content_tag(:a, finished_at.to_s[0..15])
      else
        link_to 'Terminar ?', finish_simple_jobs_task_path(id: simple_task_id), data: { confirm: 'Tem a certeza que quer terminar a tarefa?' }, remote: true, class: 'finish_post btn btn-info'
      end
    end

    def simple_task_delete_button(is_admin, read_only, simple_task_id, with_td = true)
      if is_admin && !read_only
        button = link_to 'Eliminar', simple_jobs_task_path(simple_task_id), method: :delete, data: { confirm: 'Tem a certeza?' }, remote: true, class: 'delete_post btn btn-danger'

        return with_td ? content_tag(:td, button) : button
      elsif read_only
        return with_td ? content_tag(:td, '') : ''
      else
        return ''
      end
    end

    def simple_task_edit_button(is_admin, simple_task_id, with_td = true)
      return unless is_admin

      button = link_to 'Editar', edit_simple_jobs_task_path(simple_task_id), remote: true, class: 'update_post btn btn-warning'

      (with_td ? content_tag(:td, button) : button)
    end

    def simple_task_items_button(simple_work_id, simple_task_id, finished, with_td = true)
      button = link_to 'Items', simple_jobs_task_items_path(params: { work_id: simple_work_id, task_id: simple_task_id, read_only: is_read_only?(finished) }), class: 'list_items btn btn-info'

      return with_td ? content_tag(:td, button) : button
    end

  end
end