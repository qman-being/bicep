// Global Parameters

@description('Location')
param location string

@description('The tags for this deployment')
param tags object

@description('The address space for the vNet')
param vNetAddressSpace string

@description('The name for the vNet')
param vNetName string

@description('The name for the NSG')
param nsgName string

// Resource Group Parameters

@description('Resource Group Name')
param rg_name string

// Resource Group

targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: rg_name
  location: location
}

module vNet 'vnet_and_subnet/vnet_and_subnet.bicep' = {
  dependsOn: [
    rg
  ]
  scope: resourceGroup(rg_name)
  name: 'vNetModuleDeployment'
  params: {
    location: location
    tags: tags
    vNetAddressSpace: vNetAddressSpace
    vNetName: vNetName
  }
}

module nsg 'network_security_group/network_security_group.bicep' = {
  dependsOn: [
    vNet
  ]
  scope: resourceGroup(rg_name)
  name: 'nsgModuleDeployment'
  params: {
    location: location
    nsgName: nsgName
    tags: tags
  }
}
