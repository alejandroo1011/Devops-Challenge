Devops Engineer Code Challenge
Code challenge for Devops Engineer in Telefonica Innovacion Digital. We’d like you to
design and develop a playable demo to create and deploy a helm chart.
Challenges
Challenge 1
Modify the Ping Helm Chart to deploy the applicaCon on the following restricCons:
• Isolate specific node groups forbidding the pods scheduling in this node groups.
• Ensure that a pod will not be scheduled on a node that already has a pod of the
same type.
• Pods are deployed across different availability zones.
• Ensure a random script is run on every helm update execuCon.
Challenge 2
We have a private registry based on Azure Container Registry where we publish all our
Helm charts. Let’s call this registry reference.azurecr.io. When we create an AKS cluster,
we also create another Azure Container Registry where we need to copy the Helm
charts we are going to install in that AKS from the reference registry. Let’s call this
registry instsance.azurerc.io and assume it resides in an Azure subscripCon with ID
c9e7611c-d508-4-f-aede-0bedfabc1560.
Provide an automaCon for the described process using the tool you feel more
comfortable with (terraform or ansible are preferred).
You can assume the caller will be authenCcated in Azure with enough permissions to
import Helm charts into the instance registry and will provide the module a configured
helm provider.
Challenge 3
Create a Github workflow to allow installing helm chart from Challenge #1 using
module from Challenge #2, into an AKS cluster (considering a preexisCng resource
group and cluster name).
How do we evaluate the test?
1. How clear your code is.
2. How clear your explanaCon is.
3. Easiness to run the code.
