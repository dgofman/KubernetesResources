# See: https://minikube.sigs.k8s.io/docs/handbook/network_policy/
# minikube stop
# minikube start -p cluster1-worker1

while read -r namespace
do
    while read -r ns
    do
        echo "delete namespace item '${ns}'"
        kubectl.exe delete ns --namespace=${ns} --all &
    done < <(kubectl.exe get namespaces --no-headers -n "$namespace" 2>&1 | tail -n +2 | awk '{print $1}')
done < <(kubectl.exe get namespaces --no-headers | tail -n +2 |  awk '{print $1}')
wait

echo 'WAIT...'
sleep 20

# Clean one more time
while read -r namespace
do
    while read -r ns
    do
        echo "delete namespace item '${ns}'"
        kubectl.exe delete ns --namespace=${ns} --all &
    done < <(kubectl.exe get namespaces --no-headers -n "$namespace" 2>&1 | tail -n +2 | awk '{print $1}')
done < <(kubectl.exe get namespaces --no-headers | tail -n +2 |  awk '{print $1}')
wait

echo 'WAIT...'
sleep 20

kubectl.exe get -A configmaps,serviceaccounts,services,deployments,replicasets,pods,endpointslices,endpoints,events

echo 'Creating 1 ...'

kubectl.exe apply -R -f .

echo 'WAIT...'
sleep 10

echo 'Creating 2 ...'

kubectl.exe apply -R -f .

sudo mkdir -p /src/bin/app
sudo mkdir -p /Volumes/Data

sudo rm -rf /opt/course

sudo cp ../opt/course /opt

sudo chown -R $(id -u):$(id -g) /opt/course /src/bin/app /Volumes/Data



# Backup https://www.geeksforgeeks.org/backing-up-a-docker-container/
# docker commit -p c6069c3215c3 cluster1-worker1
# docker save -o ../ckad-test.tar cluster1-worker1