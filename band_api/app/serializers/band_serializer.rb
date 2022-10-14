class BandSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end
