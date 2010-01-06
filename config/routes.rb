ActionController::Routing::Routes.draw do |map|
  map.resources :url_infos

  map.connect ':id', :controller => 'redirector', :action => 'index'
end
