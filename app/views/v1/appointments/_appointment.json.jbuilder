json.call(obj, :id, :note)
json.call(obj.user, :name)
json.call(obj.doctor, :fullname, :city, :specialty)
json.picture url_for(obj.doctor.picture)
json.appointment_date obj.book_for
