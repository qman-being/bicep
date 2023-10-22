using './main.bicep'

param deploymentLocation = '#{deploymentLocation}'
param tags = {
  Owner : '#{tag.owner}#'
  Purpose : '#{tag.purpose}#'
  CreatedBy : '#{tag.createdBy}#'
  Environment : '#{tag.environment}'
}

param resourceGroupName = '#{resourceGroupName}#'
param vNetName = '#{vNetName}#'
param vNetAddressSpace = '#{vnetAddressSpace}#'
param subnetName = '#{subnetName}#'
param subnetAddressPrefix = '#{subnetAddressPrefix}#'
param nsgName = '#{nsgName}#'
