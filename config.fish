alias k='kubectl'
k completion fish | source

alias kn 'k config set-context --current --namespace'

alias ka='k apply --force -f'
alias kc='k create --dry-run=client -o yaml'
alias kcp='k run -o yaml --dry-run=client --restart=Never --image'

alias kd='k describe'
alias kg='k get --show-labels'
alias kga='kg all'
alias kgp='k get pods -o wide -w'

-- k run -n default tmp --image=nginx:alpine --restart=Never --command -- sleep infinity
alias ke='k exec -n default tmp -it -- sh'  # curl {IP}.{NAMESPACE}:{PORT}