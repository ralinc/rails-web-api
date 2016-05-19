class Todo < ActiveRecord::Base
  scope :completed, -> { where("done_at IS NOT NULL") }

  validates_presence_of :title
end
