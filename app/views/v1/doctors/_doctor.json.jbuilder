json.call(obj, :id, :fullname, :specialty, :city)
json.picture url_for(obj.picture)
json.user_id obj.user.id
