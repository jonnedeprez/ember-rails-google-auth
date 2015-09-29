`import DS from 'ember-data'`

User = DS.Model.extend {
  email: DS.attr 'string'
  name: DS.attr 'string'

}

`export default User`
