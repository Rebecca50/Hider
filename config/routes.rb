Rails.application.routes.draw do
 
  root "main#home"

  get '/about' => "main#about"
  get '/fiction' => "main#fiction"
  get '/nonfiction' => "main#nonfiction"
  get '/freechapters' => "main#freechapters"
  get '/buy' => 'main#buy'
  get '/forum' => 'main#forum'
  get '/blog' => 'main#blog'
  get '/contact' => 'main#contact'
  
end
