Rails.application.routes.draw do
  resources :schedules do
    resources :subjects do    
    end 
    
  end

  resources :subjects do
    resources :assignments
  end

  resources :assignments do
    resources :comments do
      member do
        post :accept_assignment
        post :reject_assignment
      end
    end    
  end


  #devise_for :users
  root "pages#home"
  get "about"=>"pages#about"
  get "comments"=>"comments#show"
  match 'addsubject', to: 'schedules#addsubject', via: [:post, :get], as: :addsubject

devise_for :users, :controllers => { registrations: 'registrations' }
end
