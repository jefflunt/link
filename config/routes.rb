Rails.application.routes.draw do
  get '/:code',                 to: "urls#redirect"
  get '/',                      to: "urls#new"
  post '/',                     to: "urls#create"

  get "up" => "rails/health#show", as: :rails_health_check
end
