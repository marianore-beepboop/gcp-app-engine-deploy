#!/bin/sh
# Use this script to update the App Engine app configuration or
#   any file that has been modified.
# Keep in mind that you need to have permissions to do this.
# SDK User Permissions if running locally or Service Account for production.

# Remove '-n' parameter if you want to overwrite existing files
gsutil cp -r app_files gs://<your_bucket>.appspot.com

# Deploy app with selected YAML config, project and bucket.
gcloud app deploy --appyaml app.yaml --project <your_project_name> --bucket gs://<your_bucket_name>.appspot.com
