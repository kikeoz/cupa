json.array!(@medicamentos) do |medicamento|
  json.extract! medicamento, :id, :med_id, :med_nombre, :med_linea
  json.url medicamento_url(medicamento, format: :json)
end
