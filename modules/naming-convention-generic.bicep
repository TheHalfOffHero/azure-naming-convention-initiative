targetScope = 'subscription'
param pattern string
param policyName string
param assignmentName string
param type string

@description('allowed environment prefixes')
param envAffixArray array = [
  '*dv'
  '*pd'
  '*sg'
  '*sg'
  '*ts'
]

@allowed([
  'Deny'
  'Audit'
  'Disabled'
])
@description('The effect determines what happens when the policy rule is evaluated to match')
param effect string = 'Deny'

@allowed([
  'Default'
  'DoNotEnforce'
])
@description('When enforcement mode is disabled, the policy effect isn\'t enforced (i.e. deny policy won\'t deny resources). Compliance assessment results are still available.')
param enforcementMode string = 'Default'

resource genericPolicy 'Microsoft.Authorization/policyDefinitions@2020-03-01' = {
  name: policyName
  properties: {
    policyType: 'Custom'
    mode: 'All'
    policyRule: {
      if: {
        anyOf: [
            {
              allOf: [
              {
                field: 'type'
                equals: type
              }
              {
                field: 'name'
                notLike: pattern
              }
            ]
          }
          {
            count: {
              value: envAffixArray
              where: {
                field: 'name'
                like: '[current()]'
              }
            }
            less: 1
          }
        ]
      }
      then: {
        effect: effect
      }
    }
  }
}

resource genericAssignment 'Microsoft.Authorization/policyAssignments@2020-03-01' = {
  name: assignmentName
  properties: {
    policyDefinitionId: genericPolicy.id
    enforcementMode: enforcementMode
  }
}
