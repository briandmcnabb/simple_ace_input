require 'rails'

module SimpleAceInput
  class Engine < ::Rails::Engine

    initializer :assets, group: :all do |app|
      app.config.assets.precompile +=
        [
          'simple_ace_input.js',
          Proc.new{ |path| File.basename(path, '.js' ) =~ /^(keybinding-|mode-|theme-|worker-)\w+$/ }
        ]
    end
  end
end