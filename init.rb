ActionController::Base.send(:include, ActsAsPhp::UrlOptions) 
ActionController::Routing::RouteSet.send(:include, ActsAsPhp::RouteSetExtensions)
