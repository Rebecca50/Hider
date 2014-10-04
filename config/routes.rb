Rails.application.routes.draw do
 
  root "main#home", :as => :root

  get '/about' => "main#about"

  # get '/fiction' => "main#fiction"
  get '/cronix' => "main#cronix"
  get '/the_law_of_return' => "main#the_law_of_return"

  # get '/nonfiction' => "main#nonfiction"
  get '/spiders_of_allah' => "main#spiders_of_allah"

  get '/freechapters' => "main#freechapters"
  get '/buy' => 'main#buy'
  get '/forum' => 'main#forum'
  get '/blog' => 'main#blog'
  get '/contact' => 'main#contact'
  
  post '/send_mail' => 'contact#send_mail', :as => :send_mail

  mount Blogit::Engine => "/blogit"

end
