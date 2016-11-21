## Setup terraform envvars
# Usage:
#	. ./setup_terraform.sh

export TF_VAR_workers=8
export TF_VAR_do_token=$(cat ./secrets/DO_TOKEN)
export TF_VAR_pub_key="~/.ssh/id_rsa_do.pub"
export TF_VAR_pvt_key="~/.ssh/id_rsa_do"

if [[ `uname` == 'Darwin' ]]; then
	export TF_VAR_ssh_fingerprint=$(ssh-keygen -E MD5 -lf ~/.ssh/id_rsa_do.pub | awk '{print $2}' | sed 's/MD5://g')
else
	export TF_VAR_ssh_fingerprint=$(ssh-keygen -lf ~/.ssh/id_rsa_do.pub | awk '{print $2}')
fi
