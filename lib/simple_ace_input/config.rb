require 'active_support/configurable'

module SimpleAceInput

  def self.setup(&block)
    yield @config ||= SimpleAceInput::Configuration.new
  end

  def self.config
    @config
  end


  class Configuration
    include ActiveSupport::Configurable
    config_accessor :mode
    config_accessor :theme
    config_accessor :height
    config_accessor :precompile

    def param_name
      config.param_name.respond_to?(:call) ? config.param_name.call : config.param_name
    end

    writer, line = 'def param_name=(value); config.param_name = value; end', __LINE__
    singleton_class.class_eval writer, __FILE__, line
    class_eval writer, __FILE__, line
  end

  setup do |config|
    config.mode   = 'html'
    config.theme  = 'carto_light'
    config.height = '600'
  end
end