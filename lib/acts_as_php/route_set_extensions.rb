module ActsAsPhp
  module RouteSetExtensions 
    def self.included(base)
      base.alias_method_chain :recognize, :php
    end
    
    def recognize_with_php(request)
      return recognize_without_php(request) unless request.path[-4..-1] == '.php'
      params = recognize_path(request.path[0..-5], extract_request_environment(request))
      request.path_parameters = params.with_indifferent_access
      "#{params[:controller].camelize}Controller".constantize
    end 
  end 
end