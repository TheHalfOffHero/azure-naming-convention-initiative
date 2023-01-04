targetScope = 'subscription'

module s '../modules/naming-convention-generic.bicep' = {
  name: 'policy-naming-convention-s'
  params: {
    pattern: 'q'
    policyName: 'policy-naming-convention-s'
    assignmentName: 'assignment-naming-convention-s'
    type: 'l'
  }
}
