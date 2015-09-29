`import Ember from 'ember'`

LoginRoute = Ember.Route.extend
  actions:
    googleLogin: ->
      self = @
      @get('torii').open('google-oauth2-bearer').then(
        ((auth) ->
          Ember.debug(JSON.stringify(auth))
          self.get('session').authenticate('simple-auth-authenticator:jwt',
            password: auth.authorizationToken.access_token
            provider: 'google'
          )
        ), (error)-> Ember.debug(JSON.stringify(error))
      )

`export default LoginRoute`
