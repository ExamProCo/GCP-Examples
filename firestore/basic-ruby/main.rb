require "google/cloud/firestore"

firestore = Google::Cloud::Firestore.new(
  project_id: "gcp-playground-1212",
  database_id: "todos"  # Specify your database name here
)

collection_ref = firestore.col("tasks")
collection_ref.get do |document|
  puts "Document ID: #{document.document_id}"
  puts "Data: #{document.data}"
  puts "---"
end