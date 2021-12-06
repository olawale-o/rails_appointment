json.data do
  json.message :Succesful
  json.doctor do
    json.partial! 'doctor', obj: @doctor
  end
end
