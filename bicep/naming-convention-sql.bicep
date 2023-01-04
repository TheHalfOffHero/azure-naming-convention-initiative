targetScope = 'subscription'

module sql '../modules/naming-convention-generic.bicep' = {
  name: 'policy-naming-convention-sql'
  params: {
    pattern: '*sdb'
    policyName: 'policy-naming-convention-sql'
    assignmentName: 'assignment-naming-convention-sql'
    type: 'Microsoft.Sql/servers'
  }
}
