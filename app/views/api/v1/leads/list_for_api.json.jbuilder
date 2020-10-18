json.array! @leads do |lead|
  json.extract! lead, :id, :first_name, :last_name, :zip_code
end