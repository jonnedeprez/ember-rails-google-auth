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
          apiKey: '848311915086-dmobsuq947nje8amkbr2h71pqdde82f6.apps.googleusercontent.com',
          scope: 'email profile',
          redirectUri: 'http://localhost:4200'
        },
        'facebook-connect': {
          appId: '860378860724453',
          scope: 'email,public_profile',
          redirectUri: 'http://www.dwilio.com'
        }
      }
    },
    contentSecurityPolicy: {
      'default-src': "'none'",
      'frame-src': "s-static.ak.facebook.com static.ak.facebook.com www.facebook.com",
      'script-src': "'self' 'unsafe-eval' connect.facebook.net",
      'font-src': "'self'",
      'connect-src': "'self'",
      'img-src': "'self'",
      'style-src': "'self'",
      'media-src': "'self'"
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
