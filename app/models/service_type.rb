class ServiceType < ApplicationHash
  field :key
  field :name
  field :url
  create(id: 1, key: "github", name: "GitHub", url: "https://github.com")
end
