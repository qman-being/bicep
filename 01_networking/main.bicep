// Global Parameters

@description('Location')
param location string = 'South Africa North'

// Resource Group Parameters

@description('Resource Group Name')
param rg_name string = 'rg-vnet-prod-san-01'

// vNet Parameters

@description('vNet Name')
param vnet_name string = 'vnet-prod-san-01'

// Resource Group

targetScope = 'subscription'

resource vnet_rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: rg_name
  location: location
}

param vnet_name string = 'vnet-prod-san-01'

resource mainVnet 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: 
}
