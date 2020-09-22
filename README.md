### Create Infrastructure on Google Cloud Platform using Terraform and Github Actions

### Guide to deploy to Google App Engine using Github Actions

1. Setting up Google Cloud Project (skip if you already have a GCP Project)
-  Go to [Google Cloud](https://cloud.google.com/) and click on **Get Started for FREE**.
-  Login using your gmail account, choose your country, accept terms and conditions and click **Continue**.
-  In the next step, fill your details, like account type, Name, Address, credit card details, tax information, etc. If you have old Gmail account and all the information is already there it would take it and you might not have to fill all the details.
-  After filling all the details click on **Start my free trial**.
-  Google will setup your cloud account and in few seconds your Google Cloud Platform account will be ready to start deploying applications on it. It will look like below:
![Project Setup](/assets/gcp-project-setup-modified.jpg)

2. Creating Service Account and store credentials in Github

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
  - Go to repo that you forked from https://github.com/SKAUL05/cc-python-gae
  - Go to Actions & Click **I understand my workflows, go ahead & enable them**
  ![Update Workflow](/assets/understand-workflows.JPG)
  - Go to **Settings > Secrets**
  - Click on **New Secret** and add Name as **PROJECT_ID** and value as Project ID of your GCP Project and click on Add Secret
  ![New Secret](/assets/secret-project.JPG)

  - Again click on New Secret and add Name as **ACCOUNT_KEY** and value as *contents of json file that you downloaded and click on Add Secret


#### Now you are good to go, whenever you push anything to your repo's master branch it will get deployed to Google App Engine of your GCP Project using Github Actions.
 - Whenever you push to master branch you can see your Github Action Running like in below image
 - When this Action gets completed you can headover to App Engine URL : **https://< GCP_PROJECT_ID >.uc.r.appspot.com/** where **GCP_PROJECT_ID** is **Project ID** of your Google Cloud Platform project.

