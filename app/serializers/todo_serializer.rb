class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :priority, :done_at
end
