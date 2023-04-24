
script=${realpath "$0"}
script_path=$(dirname "$script")
source "${script_path}"/common.sh
component=cart
function_nodejs

:' configuration nodejs

curl -sL https://rpm.nodesource.com/setup_lts.x | bash
install nodejs  <<<<<<<\e[0m"

yum install nodejs -y
add roboshop user <<<<<<<\e[0m"

useradd ${app_user}
rm -rf /app
 create application directory <<<<<<<\e[0m"

mkdir /app
#cd /app
 download app content <<<<<<<\e[0m"

curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip app content <<<<<<<\e[0m"

unzip /tmp/cart.zip
#cp ${script_path}l/cart.service /etc/systemd/system/cart.service
 install nodejs <<<<<<<\e[0m"

npm install
copy catalogue systemd file <<<<<<<\e[0m"

cp $script_path/cart.service /etc/systemd/system/cart.service
start catalogue service<<<<<<<\e[0m"

systemctl daemon-reload
systemctl enable cart
systemctl start cart
:'
