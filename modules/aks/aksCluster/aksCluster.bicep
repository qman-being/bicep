// ------ Parameters ------

@description('The name for the AKS Cluster')
param aksClusterName string

@description('The location for the AKS Cluster')
param location string

@description('The tags for the AKS Cluster')
param tags object

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
resource aksCluster 'Microsoft.ContainerService/managedClusters@2023-08-01' = {
  name: aksClusterName
  location: location
  tags: tags
  properties: {
    agentPoolProfiles: [
      {
        name: 'agentpool'
        count: nodeCount
        vmSize: nodeSku
        osDiskSizeGB: nodeOsDiskSize
        osType: 'Linux'
        mode: 'System'
      }
    ]
    linuxProfile: {
      adminUsername: nodeAdminUser
      ssh: {
        publicKeys: [
          {
            keyData: nodeSshPublicKey
          } 
        ]
      }
    }
  }
}
