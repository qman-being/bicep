// Parameters

@description('The name for the Virtual Network')
param vNetName string

@description('The location for the Virtual Network')
param location string

@description('The address space for the vNet')
param vNetAddressSpace string

@description('The tags for the vNet')
param tags object

var subnets = [
  {
    name: 'subnet1'
      properties: {
        addressPrefix: '10.144.0.0/24'
      }
  }
  {
    name: 'subnet2'
      properties: {
        addressPrefix: '10.144.0.0/24'
      }
  }
]

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vNetName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        vNetAddressSpace
      ]
    }
    subnets: [for (subnet, index) in subnets: {
      name: subnet.name
      properties: {
        addressPrefix: subnet.addressPrefix
      }
    }]  
  }
}
