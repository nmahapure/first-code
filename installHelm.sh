#!/bin/bash 

# host_server=$1
# host_usr=$2
# enviroment=$3

# NAMESPACE=$enviroment
# base_dir_server="~/meijer-helm-chart/$enviroment"
# project_apps_dir="yantra-oms"
# echo "create base folder if not exist"
# ssh $host_usr@$host_server " [[ ! -d $base_dir_server ]] && mkdir -p $base_dir_server "

# echo "Clean target dir server"
# ssh $host_usr@$host_server " rm $base_dir_server/* -R "

# echo "copy all files to server"
# scp -r $project_apps_dir/ $host_usr@$host_server:$base_dir_server

# echo "helm ls -A"
# ssh $host_usr@$host_server " helm ls -A -n $NAMESPACE"



# echo "Uninstall Yantra Helm Chart"
# ssh $host_usr@$host_server "cd $base_dir_server/yantra-oms && pwd && helm uninstall yantra-oms . -n $NAMESPACE"

# echo "Install Yantra Helm Chart"
# ssh $host_usr@$host_server "cd $base_dir_server/yantra-oms && pwd && helm install yantra-oms . -n $NAMESPACE"

# # echo "Uninstall Fusion-CCM"
# # ssh $host_usr@$host_server "cd $base_dir_server/yantra-fusion-ccm && pwd && helm install yantra-fusion-ccm . -n $NAMESPACE"

# # echo "Install Fusion-CCM"
# # ssh $host_usr@$host_server "cd $base_dir_server/yantra-fusion-ccm && pwd && helm install yantra-fusion-ccm . -n $NAMESPACE"

echo "Helm Uninstall"
helm uninstall yantra-oms  -n meijer-dev

echo "Helm Install"
helm install yantra-oms yantra-oms/ -n meijer-dev

