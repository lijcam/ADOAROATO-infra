#Create some useful some env vars
export RESOURCEGROUP=ocp-rg
export CLUSTER=testcluster

az aro delete --resource-group $RESOURCEGROUP --name $CLUSTER
