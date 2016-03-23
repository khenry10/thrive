class Task < ActiveRecord::Base
  belongs_to :list

  def self.complete ids
    if ids.present?
      ids.each do |id|
        complete = Task.find(id)
        complete.update(complete: true)
    end
  end

  def check_completed
    todo_tasks = []
    self.tasks.each do |task|
      if task.complete == false || task.complete == nil
        todo_tasks << task
      end
    end
    return todo_tasks
  end


end
end
