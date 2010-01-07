ActionController::Routing::Routes.draw do |map|
  map.resources :url_infos

  map.root :controller => 'url_infos'
  map.connect '/add/:href', :controller => 'url_infos', :action => 'create', :href => /http[s]{0,1}:\/\/.*/
  map.connect ':id', :controller => 'redirector', :action => 'index'
end
