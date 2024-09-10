// ------ Parameters ------

// Global 
@description('Location')
param deploymentLocation string

@description('The tags for this deployment')
param tags object

// Virtual Network
@description('The address space for the vNet')
param vNetAddressSpace string

@description('The name for the vNet')
param vNetName string

@description('The name for the NSG')
param nsgName string

@description('The name for the Subnet')
param subnetName string

@description('The address space for the Subnet')
param subnetAddressPrefix string

// Resource Group
@description('Resource Group Name')
param resourceGroupName string

targetScope = 'subscription'

// ------ Resources ------

// Resource Group
resource resourceGroup 'Microsoft.Resources/resourceGroups@2024-07-01' = {
  name: resourceGroupName
  location: deploymentLocation
}

// Network Security Group
module nsgModule 'network_security_group/network_security_group.bicep' = {
  scope: resourceGroup
  name: 'nsgModuleDeployment'
  params: {
    location: deploymentLocation
    nsgName: nsgName
    tags: tags
  }
}

// Virtual Network & Subnet
module vNetSnetModule 'vnet_and_subnet/vnet_and_subnet.bicep' = {
  dependsOn: [
    nsgModule
  ]
  scope: resourceGroup
  name: 'vNetModuleDeployment'
  params: {
    location: deploymentLocation
    tags: tags
    vNetName: vNetName
    vNetAddressSpace: vNetAddressSpace
    subnetName: subnetName
    subnetAddressPrefix: subnetAddressPrefix
    nsgId: nsgModule.outputs.nsgId
  }
}
