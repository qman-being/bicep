targetScope = 'subscription'

// ------ Parameters ------
@description('The name for the Resource Group')
param resourceGroupName string

@description('The location for the deployed resources')
param location string

@description('The tags for the deployed resources')
param tags object

@description('The name for the AKS Cluster')
param aksClusterName string

@description('The number of nodes for the AKS Cluster')
param nodeCount int

@description('The VM SKU of nodes for the AKS Cluster')
param nodeSku string

@description('The size of the node OS disk')
@minValue(0)
@maxValue(1023)
param nodeOsDiskSize int

@description('The username for the AKS Cluster nodes')
param nodeAdminUser string

@description('The SSH Public Key for the AKS Cluster nodes')
param nodeSshPublicKey string

// ------ Resources ------
resource resourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: resourceGroupName
  location: location
  tags: tags
}

module aksClusterModule 'aksCluster/aksCluster.bicep' = {
  scope: resourceGroup
  name: 'aksClusterDeployment'
  params: {
    aksClusterName: aksClusterName
    location: location
    nodeAdminUser: nodeAdminUser
    nodeCount: nodeCount
    nodeOsDiskSize: nodeOsDiskSize
    nodeSku: nodeSku
    nodeSshPublicKey: nodeSshPublicKey
    tags: tags
  }
}
