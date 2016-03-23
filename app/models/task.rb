class Task < ActiveRecord::Base
  belongs_to :list

  # def total_time
  #   self.where(complete: [false, nil]).sum(:time_estimate)
  # end

end
