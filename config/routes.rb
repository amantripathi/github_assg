Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#index'

  get "auth/github", as: "github_auth"
  match "auth/:provider/callback" => "sessions#create", via: [:get, :post]
  get "sessions/destroy"
  get "homes/repo_list", to: "homes#repo_list", as: :repo_list
  get "homes/repo_commit/:repo_name", to: "homes#repo_commit", as: :repo_commit
end
