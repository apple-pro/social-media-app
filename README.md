# Social Media Application
A basi social media application running on the AWS cloud, built on Spring (Backend) and iOS (Mobile App).


## Generating an Access Token (AWS Cognito - Client Grant)

For the initial, unauthorized request perform the following from your client
```json
curl -v -X POST \
--user <client_id>:<client_secret> \
--data-urlencode 'grant_type=client_credentials' \
--data-urlencode 'client_id=<client_id>' \
--data-urlencode 'scope=<CSV scopes>' \
https://<your domain>.auth.us-east-1.amazoncognito.com/oauth2/token
```
