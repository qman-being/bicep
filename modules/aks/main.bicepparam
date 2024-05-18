using './main.bicep'

param resourceGroupName = '#{resourceGroupName}#'
param location = '#{location}#'
param tags = {
  Owner : '#{tag.owner}#'
  Purpose : '#{tag.purpose}#'
  CreatedBy : '#{tag.createdBy}#'
  Environment : '#{tag.environment}#'
}
param aksClusterName = '#{aksClusterName}#'
param nodeCount = #{nodeCount}#
param nodeSku = '#{nodeSku}'
param nodeOsDiskSize = #{nodeOsDiskSize}#
param nodeAdminUser = '#{nodeAdminUser}#'
param nodeSshPublicKey = '#{nodeSshPublicKey}#'
