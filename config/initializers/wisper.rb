module Wisper
  def self.setup
    configure do |config|
      config.broadcaster(:default, Broadcasters::LoggerBroadcaster.new(Rails.logger, Broadcasters::SendBroadcaster.new))
    end
  end
end

Wisper.setup

Rails.application.config.to_prepare do
  Wisper.clear unless Rails.env.production?
  Wisper.subscribe(RecipeListener.new)
end
