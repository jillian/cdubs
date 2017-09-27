json.array!(@patients) do |patient|
  json.first_name     patient.first_name
  json.last_name      patient.last_name
  json.gender         patient.gender
end