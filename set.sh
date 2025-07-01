set -e

failure(){
    echo "failed at :$1 $2"
}
trap 'failure :"${LINENO}" "${BASH_COMMAND}"' ERR
echo "Hi,Good moning"
echoooooooooo "Hello"
echo "Morning"


#no flow is determined by set we have to right echo command for this so we use vakidate funcn