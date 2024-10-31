// Parameters

@description('The location for the Virtual Network')
param location string

@description('The name for the Virtual Network')
param vNetName string

@description('The address space for the vNet')
param vNetAddressSpace string

@description('The name for the Subnet')
param subnetName string

@description('The address space for the Subnet')
param subnetAddressPrefix string

@description('The id of Network Security Group to attach')
param nsgId string

@description('The tags for the vNet')
param tags object

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2024-03-01' = {
  name: vNetName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        vNetAddressSpace
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetAddressPrefix
          networkSecurityGroup: {
            id: nsgId
          }
        }
      }
    ]
  }
}
