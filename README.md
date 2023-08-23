# HTML Static Website Deployment on App Engine using Cloud Build

This guide explains how to deploy an HTML static website on Google App Engine using Cloud Build for continuous integration and continuous deployment (CI/CD). By following these steps, you can set up a trigger that automatically builds and deploys your website whenever changes are pushed to your repository.

## Steps

### 1. Enable the necessary APIs

Ensure that the following APIs are enabled in your GCP project:

- App Engine Admin API
- Cloud Build API
- Cloud Resource Manager API

You can enable these APIs through the [Google Cloud Console ↗](https://console.cloud.google.com/).

### 2. Configure your repository

In your repository, make sure you have the following files:

- `app.yaml`: The App Engine configuration file specifies the runtime and other settings for your application.
- `Dockerfile`: The Dockerfile for building a containerized version of your application.
- `cloudbuild.json`: The Cloud Build configuration file defining the build steps and deployment process.
- `nginx.conf`: The NGINX configuration file specifying server settings.
- `index.html`: The HTML file representing your static website.

### 3. Connect your repository to Cloud Build

- Go to the [Google Cloud Console ↗](https://console.cloud.google.com/).
- Navigate to Cloud Build.
- Click **Connect Repository** and follow the instructions to connect your repository (e.g., GitHub).
- Grant the necessary permissions to allow Cloud Build to access your repository.

### 4. Set up the Cloud Build trigger

- In the Cloud Build section of the Google Cloud Console, click **Triggers**.
- Click **Create Trigger**.
- Configure the trigger settings according to your requirements. For example:
  - **Name**: Provide a descriptive name for the trigger.
  - **Event**: Choose the event that triggers the build (e.g., Push to a branch).
  - **Source**: Select the repository and branch to monitor for changes.
  - **Configuration**: Specify the build configuration file as `cloudbuild.json`.
  - **Substitution variables**: Set any necessary variables for your build process.
- Click **Create** to create the trigger.

### 5. Deploy the initial version

- Open a terminal or command prompt.
- Navigate to the root directory of your repository.
- Run the following command to deploy the initial version of your website:

```
gcloud app deploy --version v1
```

- Wait for the deployment process to complete.

### 6. Configure traffic splitting

- Run the following command to split traffic between versions:

```
gcloud app services set-traffic default --splits v1=0.9,v2=0.1
```

- This example splits 90% of the traffic to the initial version (`v1`) and 10% to the new version (`v2`). Adjust the percentages as needed.

### 7. Monitor and validate

- Monitor the performance and behavior of your website to ensure it functions correctly in the App Engine environment.
- Check the logs, metrics, and any error reporting tools to identify and address any issues.

### 8. Make updates and trigger builds

- Make updates to your code locally.
- Commit and push the changes to your repository.
- Cloud Build will automatically trigger a new build and deploy the updated version of your website.

That's it! You have successfully set up a CI/CD pipeline using Cloud Build to deploy your HTML static website on Google App Engine. Now, any changes pushed to your repository will trigger automatic builds and deployments, allowing you to easily update and maintain your website.
