function desired_committer() {
    local n=$(echo $1 | sed 's/ <.*//');
    local e=$(echo $1 | sed -e 's/.*<//' -e 's/>$//');
    git config user.email "$e"; git config user.name "$n";
}


function fix_remote_url() {
    local prefix=${1:-sr};
    git remote set-url origin $(git remote get-url origin | sed "s/github/${prefix}github/");
}

function devurandom () { 
    cat /dev/urandom | tr -dc A-Za-z0-9_ | head -c ${1:-16} && echo;
}

alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias clearssh="for i in $(ps -aux | grep ssh | awk '{ print $2 }'); do kill -9 $i; done;"

function nmap_lan() {
    sudo nmap -sn 192.168.1.0/24;
}
