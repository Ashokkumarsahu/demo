Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  
  resources :albums do
  	resources :photos do
  		member do
	      post 'add_cover_photo'
	    end
  	end
  end

  resources :comments do 
    collection do
     get 'commentable_area'
    end  
  end  
  root 'albums#index'
end
