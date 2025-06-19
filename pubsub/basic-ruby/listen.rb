# Imports the Google Cloud client library
require "google/cloud/pubsub"

# Instantiates a client
pubsub = Google::Cloud::Pubsub.new(
  project_id: "gcp-playground-1212"
)

topic = pubsub.topic "my-topic"
sub = pubsub.subscription "my-topic-sub"

subscriber = sub.listen do |received_message|
  # process message
  puts "Data: #{received_message.message.data}, published at #{received_message.message.published_at}"
  received_message.acknowledge!
end

# Handle exceptions from listener
subscriber.on_error do |exception|
  puts "Exception: #{exception.class} #{exception.message}"
end

# Gracefully shut down the subscriber on program exit, blocking until
# all received messages have been processed or 10 seconds have passed
at_exit do
    subscriber.stop!(10)
end

# Start background threads that will call the block passed to listen.
subscriber.start

# Block, letting processing threads continue in the background
sleep