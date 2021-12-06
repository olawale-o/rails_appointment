json.data do
  json.message :succesful
  json.appointment do
    json.partial! 'appointment', obj: @appointment
  end
end