Rails.application.routes.draw do
  # Routes for the Vendor resource:
  # CREATE
  get "/vendors/new", :controller => "vendors", :action => "new"
  post "/create_vendor", :controller => "vendors", :action => "create"

  # READ
  get "/vendors", :controller => "vendors", :action => "index"
  get "/vendors/:id", :controller => "vendors", :action => "show"

  # UPDATE
  get "/vendors/:id/edit", :controller => "vendors", :action => "edit"
  post "/update_vendor/:id", :controller => "vendors", :action => "update"

  # DELETE
  get "/delete_vendor/:id", :controller => "vendors", :action => "destroy"
  #------------------------------

  # Routes for the Item resource:
  # CREATE
  get "/items/new", :controller => "items", :action => "new"
  post "/create_item", :controller => "items", :action => "create"

  # READ
  get "/items", :controller => "items", :action => "index"
  get "/items/:id", :controller => "items", :action => "show"

  # UPDATE
  get "/items/:id/edit", :controller => "items", :action => "edit"
  post "/update_item/:id", :controller => "items", :action => "update"

  # DELETE
  get "/delete_item/:id", :controller => "items", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
