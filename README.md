# README

Token‐based authentication API that creates a new Tweet (example) to your Twitter account via API.

* Rails version
5.1.3

* Ruby version
2.4.1

* How to run the test suite
rspec

How to use this application:

POST /register
```sh
curl -X POST https://immense-thicket-79088.herokuapp.com/register -d "email=example@mail.com&password=123123123"
```

POST /auth/login
```sh
curl -X POST https://immense-thicket-79088.herokuapp.com/auth/login -d "email=example@mail.com&password=123123123"
```

POST /tweet
```sh
curl -H "Content-Type: application/json" -H "Authorization: Bearer #{YOUR_API_TOKEN}" -X POST https://immense-thicket-79088.herokuapp.com/tweet -d '{"message":"I love tweeting"}'
```

GET /tweets
```sh
curl -H "Authorization: Bearer #{YOUR_API_TOKEN}" -X GET https://immense-thicket-79088.herokuapp.com/tweets
```
