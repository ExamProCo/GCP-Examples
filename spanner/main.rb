# Imports the Google Cloud client library
require "google/cloud/spanner"

# Your Google Cloud Platform project ID
project_id = "gcp-playground-1212"

# Instantiates a client
spanner = Google::Cloud::Spanner.new project: project_id

# Your Cloud Spanner instance ID
instance_id = "my-instance"

# Your Cloud Spanner database ID
database_id = "todo"

# Gets a reference to a Cloud Spanner instance database
database_client = spanner.client instance_id, database_id

# Execute a simple SQL statement
results = database_client.execute_query "SELECT * FROM todos;"
results.rows.each do |row|
  puts row
end