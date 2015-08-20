module VehicleWorkReport
  extend ActiveSupport::Concern

  def build_work_report(vehicle_id, work_id)

    vehicle = Vehicle.find(vehicle_id)

    marca     = vehicle.marca
    matricula = vehicle.matricula
    work      = build_work(work_id)

    excel = Axlsx::Package.new
    excel.use_shared_strings = true
    excel.workbook.add_worksheet(name: 'report') do |sheet|

      sheet.add_row ['Marca:', marca]
      sheet.add_row ['Matricula:', matricula]
      sheet.add_row ['Nº Processo:', 'xxxx']

      sheet.add_row ['Obra:', work[:name]]
      sheet.add_row ['Data fim de obra:', work[:finished_at]]

      next if work[:tasks] == nil

      work[:tasks].each do |task|
        sheet.add_row []
        sheet.add_row ['Tarefa:', task[:name]]
        sheet.add_row ['Ut:', task[:ut]]

        sheet.add_row ['', '', 'Item', 'Qt', 'CU', 'CT', 'Responsável']

        next if task[:items] == nil

        task[:items].each do |item|
          sheet.add_row ['', '', item[:name], item[:qtd], item[:price], item[:price].to_i*item[:qtd].to_i, item[:user]]
        end
      end

    end

    send_data excel.to_stream.read, :filename => 'relatorio_veiculo_obra.xlsx', :type => 'application/vnd.openxmlformates-officedocument.spreadsheetml.sheet'
  end

  private

  def build_work(id)

    work = Work.find(id)
    work_tasks = Work.current_work_tasks(id)
                     .select('work_tasks.ut, work_tasks.finished, work_tasks.finished_at,
                              tasks.id, tasks.name')

    hash_work_tasks = Array.new

    work_tasks.each do |work_task|

      task_items = TaskItem.current_work_task_items(work_task.id)
                       .select('users.name as user_name, stock_items.name as item_name,
                                stock_items.price, task_items.qtd')

      hash_task_items = Array.new

      task_items.each do |task_item|
        hash_task_items.push({user: task_item.user_name,
                              name: task_item.item_name,
                              price: task_item.price,
                              qtd: task_item.qtd
                             })
      end

      hash_work_tasks.push({ut: work_task.ut,
                            finished: work_task.finished,
                            finished_at: work_task.finished_at,
                            name: work_task.name,
                            items: hash_task_items
                           })
    end

    return {name: work.description,
            finished_at: work.finished_at,
            tasks: hash_work_tasks
    }
  end

end