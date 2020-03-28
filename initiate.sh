DIR=$(dirname $(readlink -f "$0"))
sudo_commands=(
	"apt update"
	"apt upgrade"
	"apt-get install neofetch"
)

if [ $(whoami) = root ]
then
    for command in ${sudo_commands[@]}
        do
            $command
        done
fi

# set up git
git config --global user.name "niiiklaus"
git config --global user.email "1372063766@qq.com"

# source scripts
source $DIR/scripts/*.sh

# at last
echo "commands to be executed:"
echo
for command in ${sudo_commands[@]}
do
    echo "sudo $command"
    echo
done
