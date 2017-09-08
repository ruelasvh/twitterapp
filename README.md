# README

Token‐based authentication API that creates a new Tweet to your Twitter account via API.

* Rails version
5.1.3

* Ruby version
2.4.1

* How to run the test suite
rspec

How to use this application:

POST /register
curl -X POST http://www.mydomain.com/register -d "email=example@mail.com&password=123123123"

POST /auth/login
curl -X POST http://www.mydomain.com/auth/login -d "email=example@mail.com&password=123123123"

POST /tweet
curl -H "Content-Type: application/json" -H "Authorization: Bearer #{YOUR_API_TOKEN}" -X POST http://www.mydomain.com/tweet -d '{"message":"I love tweeting"}'

GET /tweets
curl -H "Authorization: Bearer #{YOUR_API_TOKEN}" -X GET http://www.mydomain.com/tweets
