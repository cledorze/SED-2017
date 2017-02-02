#########################
# SUSE Expert Days 2017 #
#########################

- Depencies for k8s demo based on official Guestbook demo.

Clean Lab:
----------
kubectl delete -f frontend-service.yaml
kubectl delete -f frontend-controller.yaml.old
kubectl delete -f redis-slave-service.yaml
kubectl delete -f redis-slave-controller.yaml
kubectl delete -f redis-master-service.yaml
kubectl delete -f redis-master-controller.yaml

Create Pods:
------------
kubectl create -f redis-master-controller.yaml
kubectl create -f redis-master-service.yaml
kubectl create -f redis-slave-controller.yaml
kubectl create -f redis-slave-service.yaml
kubectl create -f frontend-controller.yaml.old
kubectl create -f frontend-service.yaml
kubectl get pods

Check:
------
admin-3:~/k8s/SED-2017 # kubectl get pods
NAME                 READY     STATUS              RESTARTS   AGE
frontend-2g1ro       0/1       ContainerCreating   0          <invalid>
frontend-e69lm       0/1       ContainerCreating   0          <invalid>
frontend-j49y8       0/1       ContainerCreating   0          <invalid>
redis-master-mgglh   0/1       ContainerCreating   0          <invalid>
redis-slave-bpcyq    0/1       ContainerCreating   0          <invalid>
redis-slave-lyeix    0/1       ContainerCreating   0          <invalid>
