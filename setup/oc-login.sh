export RESOURCEGROUP=ocp-rg
export CLUSTER=testcluster
export LOCATION=australiacentral
echo "Here are your kubeadmin details"
az aro list-credentials --name $CLUSTER --resource-group $RESOURCEGROUP

echo "Here is your OpenShift console link"
az aro show --name $CLUSTER --resource-group $RESOURCEGROUP --query "consoleProfile.url" -o tsv

USER=$(az aro list-credentials --name $CLUSTER --resource-group $RESOURCEGROUP --query 'kubeadminUsername')
PSSWD=$(az aro list-credentials --name $CLUSTER --resource-group $RESOURCEGROUP --query 'kubeadminPassword')
API=$(az aro show --name $CLUSTER --resource-group $RESOURCEGROUP --query 'apiserverProfile.url')

#Strips quotation marks from around username and password and trailing / from api
oc login -u ${USER:1:-1} -p ${PSSWD:1:-1} ${API:1:-2}
