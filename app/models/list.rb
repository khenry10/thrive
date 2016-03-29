class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  def check_for_complete
    self.tasks.where(complete: [false, nil])
  end


# Need to re-visit bottom two methods since this logic is being done with Active Record methods in the htnl.

  # def self.add_lists_time
  #   self.map { |list|
  #     incomplete_tasks = list.tasks.where(complete: [false, nil])
  #     total_time =  incomplete_tasks.map{|task| task.time_estimate}.sum
  #   }.sum
  #
  # end

# JGZ - Nice! Love the use of model method here
  def add_tasks_time
    incomplete_tasks = self.tasks.where(complete: [false, nil])
      if self.list_type == "Check List"
        total_time =  incomplete_tasks.map{|task| task.time_estimate}.sum
        hours = total_time/60
        minutes = total_time%60
      return "#{hours} hours #{minutes} minutes "
      end
      if self.list_type == "Shopping List"
        total_cost = incomplete_tasks.map{|task| task.cost}.sum
      return total_cost
      end
  end


end
