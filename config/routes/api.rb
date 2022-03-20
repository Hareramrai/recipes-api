namespace :api, defaults: { format: 'json' } do
  namespace :v1 do
    resources :users, only: %I[create update] do
      scope module: :users do
        resources :user_ingredients, only: %I[index create destroy]
        resources :recipe_recommendations, only: :index
      end
    end
    resources :recipes, only: %I[index show]
    resources :ingredients, only: %I[index]

    post 'login', to: 'sessions#create', as: 'login'
  end
end
