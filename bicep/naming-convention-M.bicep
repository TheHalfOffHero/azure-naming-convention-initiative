targetScope = 'subscription'

module M '../modules/naming-convention-generic.bicep' = {
  name: 'policy-naming-convention-M'
  params: {
    pattern: 'i'
    policyName: 'policy-naming-convention-M'
    assignmentName: 'assignment-naming-convention-M'
    type: 'c'
  }
}
