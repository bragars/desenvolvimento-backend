Rails.application.routes.draw do
  resources :users
  resources :state_times
  post "/graphql", to: "graphql#execute"
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
