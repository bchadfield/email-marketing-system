EmailMarketingSystem::Application.routes.draw do
  resources :emails, :prospects, :deliveries, :industries
  
  root to: "emails#index"
end
