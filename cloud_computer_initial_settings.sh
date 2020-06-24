set +nx
set -n
# basic
apt-get install neofetch
git config --global user.name "niiiklaus"
git config --global user.email "1372063766@qq.com"
alias c="clear"
alias s="neofetch"
alias l="ls -Al"
alias ss="source ~/sandbox/temp_files/cloud_computer_initial_settings.sh"
alias g="git pull"

# Jupyter notebook Settings
cp ~/sandbox/temp_files/jupyter_notebook_config.py ~/.jupyter
alias jn="nohup jupyter notebook &"
alias myip="curl -4sSkL https://myip.ipip.net"
echo "$(myip)"
