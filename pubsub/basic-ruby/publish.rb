# Imports the Google Cloud client library
require "google/cloud/pubsub"

# Instantiates a client
pubsub = Google::Cloud::Pubsub.new(
  project_id: "gcp-playground-1212"
)

topic = pubsub.topic "my-topic"
msg = topic.publish "new-message"
puts msg