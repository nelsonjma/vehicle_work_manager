module VehicleWorkReport
  extend ActiveSupport::Concern

  def build_work_report(vehicle_id, work_id)

    vehicle = Vehicle.find(vehicle_id)

    marca     = vehicle.marca
    matricula = vehicle.matricula
    corporacao = vehicle.corporacao

    work      = build_work(work_id)

    excel = Axlsx::Package.new
    excel.use_shared_strings = true

    excel.workbook.styles do |style|

      title_style = style.add_style :b => true, :sz => 12, :alignment => { :horizontal=> :left }
      divider_style = style.add_style :bg_color => '00'

      excel.workbook.add_worksheet(name: 'report') do |sheet|

        processo = "#{work[:created_at].to_s.slice!(0..10).gsub('-','')}#{corporacao}#{matricula}"

        sheet.add_row ['Marca:', marca], :style => [title_style]
        sheet.add_row ['Matricula:', matricula], :style => [title_style]
        sheet.add_row ['Nº Processo:', processo], :style => [title_style]

        sheet.add_row ['Obra:', work[:name]], :style => [title_style]
        sheet.add_row ['Data fim de obra:', work[:finished_at]], :style => [title_style]

        ##### criação das celulas referentes às obras #####
        next if work[:tasks] == nil

        ct_total = 0

        work[:tasks].each do |task|

          sheet.add_row ['', '', '', '', '', '', ''], :height => 5, :style => [divider_style, divider_style, divider_style, divider_style, divider_style, divider_style, divider_style]

          ##### dados da tarefa #####
          sheet.add_row ['Tarefa:', task[:name]], :style => [title_style]
          sheet.add_row ['Ut:', task[:ut]], :style => [title_style]

          ##### criação das celulas com os items #####
          sheet.add_row ['', '', 'Item', 'Qt', 'CU', 'CT', 'Responsável'], :style => [title_style, title_style, title_style, title_style, title_style, title_style, title_style]

          next if task[:items] == nil

          ct_total_tarefa = 0

          task[:items].each do |item|

            ct_total_tarefa += item[:price].to_i*item[:qtd].to_i

            sheet.add_row ['', '', item[:name], item[:qtd], item[:price], item[:price].to_i*item[:qtd].to_i, item[:user]]
          end

          sheet.add_row ['', 'Total Tarefa:', '', '', '', ct_total_tarefa, ''], :style => [title_style, title_style, title_style, title_style, title_style, title_style, title_style]
          ct_total += ct_total_tarefa
          #########################################
        end

        sheet.add_row ['', '', '', '', '', '', ''], :height => 5, :style => [divider_style, divider_style, divider_style, divider_style, divider_style, divider_style, divider_style]
        sheet.add_row ['', 'Total Obra:', '', '', '', ct_total, ''], :style => [title_style, title_style, title_style, title_style, title_style, title_style, title_style]
        #########################################

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
            created_at: work.created_at,
            tasks: hash_work_tasks
    }
  end

end