module ActsAsPhp
  module RouteSetExtensions 
    def self.included(base)
      base.alias_method_chain :extract_request_environment, :php
    end
    
    def extract_request_environment_with_php(request)
      environment = extract_request_environment_without_php(request)
      environment.delete_if { |key, value| key == :format && value == 'php' }
    end 
  end 
end