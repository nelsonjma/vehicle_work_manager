module LaborUsersHelper

  def get_work_task_labor(work_task_id)
    uts = 0
    LaborUser.current_task_labor(work_task_id).each { |labor| uts += labor.ut }
    return uts
  end

  def available_users
    User.all.collect { |t| [t.name, t.id] }
  end


end
