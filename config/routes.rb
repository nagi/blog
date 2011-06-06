Blog::Application.routes.draw do
  resources 'posts'
  match 'blog', :to => "blog#index"
  match 'portfolio', :to => "portfolio#index"
  match 'contact', :to => "contact#index"
  match 'home', :to => "home#index"

  root :to => "home#index"
end
