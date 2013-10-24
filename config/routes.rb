ThoughtLogApp::Application.routes.draw do
  get '/signup' => "users#new"
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  post '/logout' => 'session#destroy'
  get '/' => 'session#new'
  get '/users/:user_id/entries/:entry_id/ideas/:idea_id/edit' => 'ideas#edit'
  get 'users/:user_id/insights' => 'users#insight'


  get '/users/:id/dashboard' => 'users#dashboard'

  resources :users do
    resources :entries do
      resources :ideas
    end
  end


end
#== Route Map
# Generated on 23 Oct 2013 15:46
#
#                login GET    /login(.:format)                                                session#new
#                      POST   /login(.:format)                                                session#create
#               logout POST   /logout(.:format)                                               session#destroy
#                      GET    /                                                               session#new
#                      GET    /users/:user_id/entries/:entry_id/ideas/:idea_id/edit(.:format) ideas#edit
#                      GET    /users/:id/dashboard(.:format)                                  users#dashboard
#     user_entry_ideas GET    /users/:user_id/entries/:entry_id/ideas(.:format)               ideas#index
#                      POST   /users/:user_id/entries/:entry_id/ideas(.:format)               ideas#create
#  new_user_entry_idea GET    /users/:user_id/entries/:entry_id/ideas/new(.:format)           ideas#new
# edit_user_entry_idea GET    /users/:user_id/entries/:entry_id/ideas/:id/edit(.:format)      ideas#edit
#      user_entry_idea GET    /users/:user_id/entries/:entry_id/ideas/:id(.:format)           ideas#show
#                      PUT    /users/:user_id/entries/:entry_id/ideas/:id(.:format)           ideas#update
#                      DELETE /users/:user_id/entries/:entry_id/ideas/:id(.:format)           ideas#destroy
#         user_entries GET    /users/:user_id/entries(.:format)                               entries#index
#                      POST   /users/:user_id/entries(.:format)                               entries#create
#       new_user_entry GET    /users/:user_id/entries/new(.:format)                           entries#new
#      edit_user_entry GET    /users/:user_id/entries/:id/edit(.:format)                      entries#edit
#           user_entry GET    /users/:user_id/entries/:id(.:format)                           entries#show
#                      PUT    /users/:user_id/entries/:id(.:format)                           entries#update
#                      DELETE /users/:user_id/entries/:id(.:format)                           entries#destroy
#                users GET    /users(.:format)                                                users#index
#                      POST   /users(.:format)                                                users#create
#             new_user GET    /users/new(.:format)                                            users#new
#            edit_user GET    /users/:id/edit(.:format)                                       users#edit
#                 user GET    /users/:id(.:format)                                            users#show
#                      PUT    /users/:id(.:format)                                            users#update
#                      DELETE /users/:id(.:format)                                            users#destroy
