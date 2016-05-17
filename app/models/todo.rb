class Todo < ActiveRecord::Base
  scope :completed, -> { where("done_at IS NOT NULL") }
end
