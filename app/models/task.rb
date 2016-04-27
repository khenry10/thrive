class Task < ActiveRecord::Base
  belongs_to :list

  def tally id
    Task.find(id).cost * Task.find(id).quantity.to_i
  end

end
