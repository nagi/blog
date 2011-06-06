Blog::Application.routes.draw do
  resources 'posts'
  resources 'portfolio', :only => [:index]

  root :to => "home#index"
end
