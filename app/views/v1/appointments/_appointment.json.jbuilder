json.call(obj, :id, :note)
json.appointment_date obj.book_for
json.patient do
  json.call(obj.user, :name)
end
json.doctor do
  json.call(obj.doctor, :fullname, :city, :specialty)
  json.picture url_for(obj.doctor_picture)
end
