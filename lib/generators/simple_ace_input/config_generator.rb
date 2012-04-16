module SimpleAceInput
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      def copy_config_file
        template 'simple_ace_input.rb', 'config/initializers/simple_ace_input.rb'
      end
    end
  end
end