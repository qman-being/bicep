// Parameters

@description('The name for the Network Security Group')
param nsgName string

@description('The location for the Network Security Group')
param location string

@description('The tags for the Network Security Group')
param tags object

resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2023-11-01' = {
  name: nsgName 
  location: location
  tags: tags
  properties: {}
}

output nsgId string = networkSecurityGroup.id
