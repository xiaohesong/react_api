json.array! @roles do |role|
  json.(role, :name, :permission, :id)
end
