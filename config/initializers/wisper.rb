module Wisper
  def self.setup
    configure do |config|
      config.broadcaster(:default, Broadcasters::LoggerBroadcaster.new(Rails.logger, Broadcasters::SendBroadcaster.new))
    end
  end
end

Wisper.setup

Rails.application.config.to_prepare do
  Wisper.clear if Rails.env.development?
  Wisper.subscribe(ChecklistListener.new)
end
