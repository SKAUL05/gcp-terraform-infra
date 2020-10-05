### Create Infrastructure on Google Cloud Platform using Terraform and Github Actions

#### Step by Step Guide

1. Setting up Google Cloud Project (skip if you already have a GCP Account)
-  Go to [Google Cloud](https://cloud.google.com/) and click on **Get Started for FREE**.
-  Login using your gmail account, choose your country, accept terms and conditions and click **Continue**.
-  In the next step, fill your details, like account type, Name, Address, credit card details, tax information, etc. If you have old Gmail account and all the information is already there it would take it and you might not have to fill all the details.
-  After filling all the details click on **Start my free trial**.
-  Google will setup your cloud account and in few seconds your Google Cloud Platform account will be ready to start deploying applications on it. It will look like below:
![Project Setup](/assets/gcp-project-setups-modified.jpg)

2. Creating new GCP Project and Linking to Billing Account
- Go to [Manage Resources Page](https://console.cloud.google.com/cloud-resource-manager?_ga=2.16905723.313995043.1600681234-1805943322.1596519952) and click on **New Project**
- Fill in the Project Name and keep location as it is. You can also **Edit** Project ID according to availability. Once done click on **Create** and your New GCP Project will be created.
![New Project](/assets/new-project-description-fied.jpg)
- After you have created your project. Go to Billing and click on **Link Billing Account**
![Link Billing](/assets/billing-account-fied.jpg)
- Select Billing Account from dropdown menu and click on **Set Account**
![Set Billing Account](/assets/set-billing-account-modified.jpg)


3. Creating Service Account and store credentials in Github

- Creating Service Account and provide owner access
  - Go to **Navigation Menu(Top left Corner) > IAM & Admin > Service Accounts**
  - Click on **Create Service Account**
  - Under **Service Account Details** provide service account **name** and **description** of your choice and click on **Create**
  ![Service Account Details](/assets/service-account-details-modified.jpg)
  - Under **Service Account Permissions** select **Project > Owner** Role and click on **Continue**
  ![Service Account Permissions](/assets/service-account-permissions-modified.jpg)
  - Keep **User Access Section** unchanged and click on **Done**
  - On Service Account Page click on Actions hamburger menu of Service Account you just created and Click on Create Key
  ![Service Account Create Key](/assets/service-account-create-key-modified.jpg)
  - Select **JSON** option and Click on **Create**. A JSON file will get downloaded on your local system, save it we will need it later*
  ![Service Account JSON](/assets/service-account-json-modified.jpg)

- Add Github Secrets
  - Go to repo that you forked from https://github.com/SKAUL05/gcp-terraform-infra
  - Go to Actions & Click **I understand my workflows, go ahead & enable them**
  ![Update Workflow](/assets/understand-workflows.JPG)
  - Go to **Settings > Secrets**
  - Click on **New Secret** and add Name as **PROJECT_ID** and value as Project ID of your GCP Project and click on Add Secret
  ![New Secret](/assets/secret-project.JPG)

  - Again click on New Secret and add Name as **GOOGLE_APPLICATION_CREDENTIALS** and value as *contents of json file that you downloaded and click on Add Secret


#### Now you are good to go, you can run github action and create infrastructure that can be used by client repo for deployment
 - To run Github Action, go to Actions and click on **Create GCP Infrastructure**
 ![Action Workflow](/assets/action-workflow-modified.jpg)
 - Click on **Run Workflow** dropdown button, a dialog appears, keep all items as it is and click on **Run Workflow**
 ![Run Workflow](/assets/run-workflow-modified.jpg)
 - Once you run workflow you can see your Github Action Running like in below image
 ![Github Action Running](/assets/github-infra-deploy.JPG)
 - When this Action gets completed you can headover to [client repo](https://github.com/ayu004/deploy-springboot-on-appengine) to deploy your app on App Engine.


##### You can also **destroy** infrastructure created using below command
  ```
  terraform destroy
  ```
**Note:** Destroy command doesn't work properly for App Engine applications due to certain Terraform [Limitations](https://www.terraform.io/docs/providers/google/r/app_engine_application.html)
