Rails.application.routes.draw do
  
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 #routes
 root 'posts#index', as: 'home'
 
 get 'about' => 'pages#about', as: 'about'
 
 #to nest comments and posts together
 resources :posts do 
 	resources :comments

 end

end
