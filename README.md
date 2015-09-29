# README

This project demonstrates how you setup Google authentication in a Rails + Ember project, using JSON Web Tokens for authorization. 

## Setup

Add your [Google client ID](https://developers.google.com/identity/sign-in/web/devconsole-project) to /app/frontend/config/environment.js 

## Running

```
bundle install
cd /app/frontend
npm install
bower install
```

Start the backend server:
`rails s`

Start the Ember server and proxy calls to Rails (in /app/frontend):
`ember s --proxy http://localhost:3000`
