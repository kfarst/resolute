Resolute::Application.routes.draw do 
  resources :tournament_pages do
    collection do
      get :admin, :as => :admin
      post :sort
      get :registration, :as => :registration
    end
  end

  resources :club_teams, :except => [:show] do
    collection do
      get :admin, :as => :admin
      post :sign_up, :as => :sign_up
      get :registrants, :as => :registrants
    end
  end
  match "/club_teams/(/:parent_slug(/:child_slug))" => "club_teams#show"

  devise_for :players

  resources :panels do
    collection do
      get :admin, :as => :admin
      post :updating, :as => :updating
    end
  end

  resources :tournament_entries, :except => [:update]

  resources :stats

  resources :staff_members, :except => [:show] do
    collection do
      get :admin, :as => :admin
      post :sort
    end
  end

  resources :camps, :except => [:index] do
    collection do
      get :admin, :as => :admin
    end
  end

  match "/camps-clinics(/:year(/:month))" => "camps#index",
    :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}

  resources :coach_clinic_registrations

  resources :items, :except => [:index] do
    collection do
      get :pages, :as => :pages
      get :categories, :as => :categories
    end
  end

  resources :products
  resources :contest_entries, :only => [:new, :create, :index, :destroy]
  resources :contacts, :only => [:new, :create]
  resources :pages, :controller => :items
  resources :camp_registrations

  resources :categories, :controller => :items do
    collection do
      post :sort
    end
  end

  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.
  match '/midwest-classic-youth-tournament' => 'tournament_pages#index'
  match '/club-teams' => 'club_teams#index'
  match '/admin' => 'admin#index', :as => :admin
  match '/home', :to => redirect("/")
  match '/videos' => 'items#videos', :as => :videos
  match '/contact-us' => 'contacts#new'
  match '/store' => 'products#store', :as => :store
  match '/staff' => 'staff_members#index', :as => :staff

  # Sample of regular route:
  match ':id' => 'items#show', :as => :pretty_url

  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "panels#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
