class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  def check_for_complete
    self.tasks.where(complete: [false, nil])
  end

  def aggregrate_tasks
    incomplete_tasks = self.tasks.where(complete: [false, nil])
      if self.list_type == "Check List"
        total_time =  incomplete_tasks.map{|task| task.time_estimate}.sum
        hours = total_time/60
        minutes = total_time%60
      return "#{hours} hours #{minutes} minutes "
      end
    else self.list_type == "Shopping List"
        total_cost = incomplete_tasks.map{|task| task.cost * task.quantity.to_i}.sum
      return total_cost
  end

  def add id
    tasks = Task.find(list_id: id)
    tasks_total = tasks.map{|task| task.cost * task.quantity.to_i}.sum
    return tasks_total
  end



end
