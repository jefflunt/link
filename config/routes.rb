Rails.application.routes.draw do
  get "/:code",                 to: "urls#redirect"
  get "/confirm/:code",         to: "urls#confirm"
  get "/",                      to: "urls#new"
  post "/",                     to: "urls#create"

  post "/api/create",           to: "api_urls#create"
  get  "/api/expand/:code",     to: "api_urls#expand"

  get "up" => "rails/health#show", as: :rails_health_check
end
