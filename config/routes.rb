Rails.application.routes.draw do

  resources :categories

  resources :posts do
    resources :comments, except: :update
  end

  resources :blog, only:[:index,:show] do
    collection do
      get 'category/:url_slug' => 'blog#index', as: :category
    end
  end

  root "main#home", :as => :root

  get '/about' => "main#about"
  get '/fiction' => "main#fiction"
  get '/nonfiction' => "main#nonfiction"
  get '/freechapters' => "main#freechapters"
  get '/buy' => 'main#buy'
  # get '/forum' => 'main#forum'
  get '/contact' => 'main#contact'

  post '/send_mail' => 'contact#send_mail', :as => :send_mail

  devise_for :users
end
