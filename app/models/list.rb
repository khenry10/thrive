class List < ActiveRecord::Base
  has_many :tasks
  belongs_to :user

  def check_for_complete
    self.tasks.where(complete: [false, nil])
  end

end
