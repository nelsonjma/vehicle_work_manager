module WorkTasksHelper

  def available_tasks
    Task.all.collect { |t| [t.name, t.id] }
  end

end
