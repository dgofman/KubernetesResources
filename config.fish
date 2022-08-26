kubectl completion fish | source
alias cls=clear
alias k='kubectl'
alias kd='k describe'
alias kaf='k apply --force -f'
alias kc='k create --dry-run=client -o yaml'
alias kcp='k run -o yaml --dry-run=client --restart=Never --image'
alias kg='k get --show-labels'
alias kgp='k get pods --show-labels'
alias kcr='k set resources --local -o yaml -f'
alias kce='k set env --local -o yaml -f'
alias ksn 'k config set-context --current --namespace'
alias kcb='k run testbb --image=busybox --restart=Never --command sleep infinity'
alias keb='k exec testbb -it -- /bin/sh'