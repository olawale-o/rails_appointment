json.(obj, :id, :note)
json.(obj.user, :name)
json.(obj.doctor, :fullname)
json.appointment_date obj.book_for