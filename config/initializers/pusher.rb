require 'pusher'

Pusher.url = "http://#{ENV.fetch['PUSHER_KEY']}:#{ENV.fetch['PUSHER_SECRET']}@api.pusherapp.com/apps/#{ENV.fetch['PUSHER_APP_ID']}"
Pusher.logger = Rails.logger
