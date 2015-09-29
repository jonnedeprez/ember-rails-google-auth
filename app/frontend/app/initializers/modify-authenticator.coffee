`import TokenAuthenticator from 'simple-auth-token/authenticators/jwt'`

ModifyAuthenticatorInitializer =
  name: 'modify-authenticator'
  initialize: ->
    TokenAuthenticator.reopen
      getAuthenticateData: (credentials) ->
        authenticateData = @_super(credentials)
        authenticateData['provider'] = credentials.provider;
        return authenticateData

`export default ModifyAuthenticatorInitializer`
