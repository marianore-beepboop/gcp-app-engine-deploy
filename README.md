# Deploying DBT Docs on GCP App Engine service
1. Create a Google Cloud Platform project if not already.
2. Go to App Engine service and create a new App. This will create a free Tier bucket for your files. You might need the `App Engine Admin` permission role.
3. a. If running locally: Install [Google Cloud CLI](https://cloud.google.com/sdk/docs/install-sdk?authuser=1#linux) for your OS. Initialize the CLI with `gcloud init` and follow the instructions to complete the gcloud configuration with your Google account.
You can check the configuration with `gcloud config list` and information about the CLI installation with `gcloud info`.
To deploy new versions of an app you have to add [roles](https://cloud.google.com/appengine/docs/standard/python3/roles#predefined_roles) to the user to be able to copy files to a bucket and build and deploy the App Engine.
4. Add the following permission roles to your account at IAM & Admin: `App Engine Deployer`, `Service Account User`.
If needed, add an environmental variable to your system with the following: `CLOUDSDK_PYTHON = route\to\your\python\executable`
5. Add your DBT files to display inside the `app_files` folder.
6. Modify the `deploy_app.sh` script to add your config parameters: Python version, bucket name (taken from App Engine/Settings/Default Cloud Storage Bucket) and project name.
7. If everything is correctly set you should now run the script with `bash deploy_app.sh` or with your desired shell executor, the files should be copied into the bucket and the App Engine should be deployed. You can now check you stats at the App Engine Dashboard and configure any other functionality if you need.
8. (Optional) Enable `Identity-Aware Proxy` API to grant access to the app to only a defined set of users.
First you will be prompted to enable `OAuth consent screen`. Set it depending if you want to expose the app to your organization members or to people outside of it.
After that go back to the IAP manager, select the App Engine resource from the list and on the right panel add a Principal with `IAP-secured Web App User` Role for every user.
