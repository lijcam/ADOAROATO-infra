# Introduction 
TODO: Give a short introduction of your project. Let this section explain the objectives or the motivation behind this project. 

# Getting Started
To get an Openshift cluster running in Azure you will need a pull secret which can be obtained from the following link:

https://console.redhat.com/openshift/install/pull-secret

If you haven't done so already, clone this git repo to a convenient location, then copy the pull secret to setup/pull-secret.txt

Ensure you are logged into Azure via the cli (az login) then run cluster-create.sh to create the openshift cluster. Once completed run argo-create.sh to install the argocd operator and web-app. 

Script Summary
setup/cluster-create.sh - Creates an Openshift cluster in Azure

setup/argo-create.sh - Sets up the argocd operator in the argocd namespace. Registers the web-app to be managed by argocd and syncs the application into the web-app namespace. 

setup/utilities/ocp-login.sh - Prints the kubeadmin username and password, the webconsole url, and logs in as kubeadmin

setup/utilities/delete-cluster.sh - Deletes openshift off Azure, this is your nuclear option for a hard reset

setup/utiliites/delete-argo.sh - Deletes argocd and the web-app from your cluster, undoing everything done by argo-create.sh. Useful for resetting the demo once done

# Build and Test
TODO: Describe and show how to build your code and run the tests. 

# Contribute
TODO: Explain how other users and developers can contribute to make your code better. 

If you want to learn more about creating good readme files then refer the following [guidelines](https://docs.microsoft.com/en-us/azure/devops/repos/git/create-a-readme?view=azure-devops). You can also seek inspiration from the below readme files:
- [ASP.NET Core](https://github.com/aspnet/Home)
- [Visual Studio Code](https://github.com/Microsoft/vscode)
- [Chakra Core](https://github.com/Microsoft/ChakraCore)
