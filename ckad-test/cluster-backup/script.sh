ROOT=.

while read -r namespace
do
    echo "scanning namespace '${namespace}'"
    mkdir -p "${HOME}/cluster-backup/${namespace}"
    while read -r resource
    do
        echo "  scanning resource '${resource}'"
        mkdir -p "${HOME}/cluster-backup/${namespace}/${resource}"
        while read -r item
        do
            echo "    exporting item '${item}'"
            kubectl get "$resource" -n "$namespace" "$item" -o yaml > "${HOME}/cluster-backup/${namespace}/${resource}/$item.yaml"
        done < <(kubectl get "$resource" -n "$namespace" 2>&1 | tail -n +2 | awk '{print $1}')
    done < <(kubectl api-resources --namespaced=true 2>/dev/null | tail -n +2 | awk '{print $1}')
done < <(kubectl get namespaces | tail -n +2 | awk '{print $1}')

wait