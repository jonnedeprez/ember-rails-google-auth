`import Em from 'ember'`
`import config from './config/environment'`

Router = Em.Router.extend
  location: config.locationType

Router.map ->

  @route 'login'

  @route 'auth', ->
    @route 'users'

  @route 'bad_url', path: '/*badurl'

`export default Router`
