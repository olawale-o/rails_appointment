json.data do
  json.message :successful
  json.doctors @doctors do |doctor|
    json.partial! 'doctor', obj: doctor
  end
end