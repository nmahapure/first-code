# meijer-helm-chart
helm charts for azure scoperetail deployment process

## Install/Unisntall Helm  
```helm install yantra-oms yantra-oms```

```helm uninstall yantra-oms```
     
```helm upgrade --install yantra-oms yantra-oms --wait --timeout 300s --atomic```

## First install
## Test 
## Create the acr secret    

```apiVersion: v1
data:
  .dockerconfigjson: jasdklajdlkaslkdlalksdlasljd0
kind: Secret
metadata:
  name: acr-secret-yantra
  namespace: yantra-cn-cert 
type: kubernetes.io/dockerconfigjson```

```oc create -f <filename> -n <project>```


## Create the namespace
Set up permissions to the service account

```oc adm policy add-scc-to-user privileged system:serviceaccount:yantra-cn-cert:yantra-oms```

### Create connection Azure Blob Storage

```oc create -f <filename> -n <project>```

```
apiVersion: v1
kind: Secret
metadata:
  name: azure-secret
type: Opaque
data:
  azurestorageaccountname: azhzdGVzdA==
  azurestorageaccountkey: eElGMXpKYm5ub2pGTE1Ta0JwNTBteDAyckhzTUsyc2pVN21GdDRMMTNob0I3ZHJBYUo4akQ2K0E0NDNqSm9nVjd5MkZVT2hRQ1dQbU02WWFOSHk3cWc9PQ==
```

```oc create -f <filename> -n <project>```

```
apiVersion: "v1"
kind: "PersistentVolume"
metadata:
  name: "pv0001" 
spec:
  capacity:
    storage: "5Gi" 
  accessModes:
    - "ReadWriteMany"
  azureFile: 
    secretName: azure-secret 
    shareName: example 
    readOnly: false 
```

```oc create -f <filename> -n <project>```
   
```
apiVersion: "v1"
kind: "PersistentVolumeClaim"
metadata:
  name: "claim1"
spec:
  accessModes:
    - "ReadWriteOnce"
  resources:
    requests:
      storage: "1Gi"
  volumeName: "pv0001"
```


