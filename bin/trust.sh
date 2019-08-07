 #!/bin/sh
if [ $# -lt 1 ]; then
echo "usage: $0 <username@host>"
echo " i.e.: $0 xizhao@gw1.mpi2.cm10"
echo
exit 1
fi
target="$1"
rsa_pub=~/.ssh/id_rsa.pub
if [ -f ${rsa_pub} ]
then
   echo  
else
    mkdir -p ~/.ssh && cd ~/.ssh && ssh-keygen -t rsa && cd -
fi

ssh "$target" 'test -d .ssh || mkdir -m 0700 .ssh ; cat >>.ssh/authorized_keys && chmod 0600 .ssh/*' < ${rsa_pub}
