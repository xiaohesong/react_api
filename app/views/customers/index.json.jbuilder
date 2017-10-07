json.customers @customers do |customer|
  json.(customer, :id, :name, :roleIds, :phone, :address, :birth, :password)
end

json.total_pages @customers.total_pages
json.current_page @customers.current_page
json.next_page @customers.next_page
json.prev_page @customers.prev_page