`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

AuthRoute = Ember.Route.extend(AuthenticatedRouteMixin)

`export default AuthRoute`
