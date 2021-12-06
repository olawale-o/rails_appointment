json.data do
  json.message :successful
  json.appointments @appointments do |appointment|
    json.partial! 'appointment', obj: appointment
  end
end