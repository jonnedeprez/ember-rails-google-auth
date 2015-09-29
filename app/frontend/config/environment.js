/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'frontend',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    },

    'simple-auth': {
      authorizer: 'simple-auth-authorizer:token'
    },

    'simple-auth-token': {
      serverTokenEndpoint: '/token/create',
      serverTokenRefreshEndpoint: '/token/refresh',

      identificationField: 'email',
      passwordField: 'password',

      tokenPropertyName: 'token',
      authorizationPrefix: 'Bearer ',
      authorizationHeaderName: 'Authorization',

      refreshAccessTokens: true,
      timeFactor: 1000, // convert seconds from backend to milliseconds for simple-auth
      refreshLeeway: 60 * 10 // refresh the token 10 minutes before its expiry
    },

    torii: {
      providers: {
        'google-oauth2-bearer': {
          apiKey: 'REPLACE_WITH_YOUR_GOOGLE_CLIENT_ID',
          scope: 'email profile',
          redirectUri: 'http://localhost:4200'
        }
      }
    }
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {

  }

  return ENV;
};
