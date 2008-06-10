require 'acts_as_php/url_helper_extensions'

ActionController::Base.send(:include, ActsAsPhp::ActionController::UrlHelperExtensions)
ActionView::Helpers::UrlHelper.send(:include, ActsAsPhp::ActionView::UrlHelperExtensions)
ActionController::Routing::RouteSet.send(:include, ActsAsPhp::RouteSetExtensions)
