Chewy.settings = {host: "#{ENV['SEARCHBOX_URL']}:9200"} if Rails.env.production?
Chewy.urgent_update = true