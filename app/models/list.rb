class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  def check_for_complete
    self.tasks.where(complete: [false, nil])
  end

  def self.add_lists_time

    self.map { |list|
      incomplete_tasks = list.tasks.where(complete: [false, nil])
      total_time =  incomplete_tasks.map{|task| task.time_estimate}.sum
    }.sum

  end

  def add_tasks_time
    incomplete_tasks = self.tasks.where(complete: [false, nil])
    total_time =  incomplete_tasks.map{|task| task.time_estimate}.sum
    hours = total_time/60
    minutes = total_time%60
    return "#{hours}:#{minutes}"
  end

end
