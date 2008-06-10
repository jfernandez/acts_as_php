module ActsAsPhp
  module ActionController
    module UrlHelperExtensions
      def self.included(base)
        base.alias_method_chain :url_for, :php
      end

      def url_for_with_php(options = {})
        url = url_for_without_php(options)
        url << '.php'
      end
    end
  end
  
  module ActionView
    module UrlHelperExtensions
      def self.included(base)
        base.alias_method_chain :link_to, :php
      end
      
      def link_to_with_php(name, options = {}, html_options = nil)
        url = case options
          when String
            options
          when :back
            @controller.request.env["HTTP_REFERER"] || 'javascript:history.back()'
          else
            self.url_for(options)
          end
        url << ".php" unless url[-4..-1] == '.php'

        if html_options
          html_options = html_options.stringify_keys
          href = html_options['href']
          convert_options_to_javascript!(html_options, url)
          tag_options = tag_options(html_options)
        else
          tag_options = nil
        end
        
        href_attr = "href=\"#{url}\"" unless href
        "<a #{href_attr}#{tag_options}>#{name || url}</a>"
      end
    end
  end
end