# Social Media Application Backend
A really simple Spring backend app to demonstrate that we can create a social media application with barely any code with just spring and a generic relational database


# For Reference (My Auth Server Problem)
Delete this once you figure out a way to generate a verifiable JWT token

https://stackoverflow.com/questions/37941780/what-is-the-rest-or-cli-api-for-logging-in-to-amazon-cognito-user-pools
https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-authentication-flow.html

```sh
curl -v -X POST --data @aws-auth-data.json \
-H 'X-Amz-Target: AWSCognitoIdentityProviderService.InitiateAuth' \
-H 'Content-Type: application/x-amz-json-1.1' \
https://<cognito>.auth.us-east-1.amazoncognito.com/
```

```json
{
   "AuthParameters" : {
      "USERNAME" : "user@domain.com",
      "PASSWORD" : "mysecret"
   },
   "AuthFlow" : "USER_PASSWORD_AUTH",
   "ClientId" : "xxxxxx"
}
```
