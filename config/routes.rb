Rails.application.routes.draw do


  devise_for :customers
    get 'customers/my_like' => 'customers#index'
    get 'customers/my_menu' => 'customers#edit'
    get 'customers/my_page' => 'customers#show', as: 'customers'
    get 'customers/unsubscribe'
    #put 'withdraw/:customers' => 'customers#withdraw', as: 'withdrawcustomer'
    patch 'customers/withdraw/:id' => 'customers#withdraw', as: 'withdraw'
    resources :customers, only:[:update]

 scope module: :public do
    root to: 'homes#top'
    get 'about' => "homes#about"
    resources :items, only:[:index, :show] do
     resource :favorites, only: [:create, :destroy]
     resources :post_comments, only: [:create, :destroy]
     end
    resources :genres do
    collection do
    get 'search'
    end
  end

    delete :cart_items, to: 'cart_items#destroy_all'
    resources :cart_items, only:[:index, :update, :destroy, :destroy_all, :create]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    post 'orders' => 'orders#create'
    resources :orders, only:[:index, :new, :create, :show]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :genres, only:[:show]
  end

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
   }
  namespace :admin do
   root to: 'homes#top'
   resources :genres, only:[:index, :edit, :create, :update]
   resources :items, only:[:index, :new, :create, :show, :edit, :update]
   resources :customers, only:[:index, :edit, :show, :update]
   resources :orders, only:[:show, :update]
   resources :order_details, only:[:update]
 end
end
