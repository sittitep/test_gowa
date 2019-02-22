Rails.application.routes.draw do
  root "map#index"
  get "map/search" => "map#search"
end
