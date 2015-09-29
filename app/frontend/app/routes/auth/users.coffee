`import Ember from 'ember'`

AuthUsersRoute = Ember.Route.extend
  model: -> @get('store').find('user')

`export default AuthUsersRoute`
