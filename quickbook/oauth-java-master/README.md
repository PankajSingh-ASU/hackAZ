
## Java Sample for OAuth

Welcome to the Intuit Developer's Java sdk and OAuth connection.

This sample app is meant to provide a working example of oAuth management.

### OAuth Management APIs consists of the following:

Intuit OAuth Service URLs - URLs to use to access Intuit OAuth Services.
Request token URL - Request token endpoint to retrieve request token and secret
Access token URL - Access token endpoint to retrieve access token and secret
Authorize URL - To authorize access to the third party app

This is not a seed project to be taken cart blanche and deployed to your production environment. Certain concerns are not addressed at all in our samples (e.g. security, privacy, scalability). 

## Table of Contents

Prerequisites  
First Use Instructions  
Running the app  



### Prerequisites: 

•	Latest version of Java - This sample uses Java 1.7  
•	Maven   
•	Apache Tomcat or any webserver (the sample is configured to run on port 8080, if you are using a different port number, please update the code accordingly)  
•	Developer.intuit.com account  
•	An app on developer.intuit.com and the associated app token, consumer key, and consumer secret.  


## First Use Instructions:

•	Clone the GitHub repo to your workspace

Note: This sample is using the sandbox environment by default. So, you need to use the development tokens of your app to run this sample. If you want to switch to production, please make sure that you change the qbo_url in app.properties file inside OauthSample folder to quickbooks.api.intuit.com from sandbox-quickbooks.api.intuit.com. Also, make sure that you configure the sample app to use prod tokens instead of development tokens.

•	Configure the app tokens: Go to your app on developer.intuit.com and copy the OAuth Consumer Key and OAuth Consumer Token from the keys tab. Add these values to the app.properties file in our OauthSample folder.
 
•	Build the code using mvn install (either from IDE or from command prompt)

•	Deploy the generated war file to the webserver. 


## Run the App: 

Once the sample app code is on your computer, follow the steps below to run the app:

•	Launch the app -  http://localhost:8080/OauthSample


