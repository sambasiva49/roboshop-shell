script=${realpath "$0"}
script_path=$(dirname "$script")
source ${script_path}/common.sh

component = catalogue
function_nodejs
:'configuration nodejs

curl -sL https://rpm.nodesource.com/setup_lts.x | bash
install nodejs  <<<<<<<\e[0m"

yum install nodejs -y
add roboshop user <<<<<<<\e[0m"


useradd ${app_user}
 create application directory <<<<<<<\e[0m"
rm -rf /app
mkdir /app

 download app content <<<<<<<\e[0m"

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip

cd /app
unzip app content <<<<<<<\e[0m"

unzip /tmp/catalogue.zip

 install nodejs <<<<<<<\e[0m"

npm install
copy catalogue systemd file <<<<<<<\e[0m"

cp ${script_path}/catalogue.service /etc/systemd/system/catalogue.service
start catalogue service<<<<<<<\e[0m"

systemctl daemon-reload
systemctl enable catalogue
systemctl satrt catalogue
:'

 copy mongo repo <<<<<<<\e[0m"

cp mongo.repo /etc/yum.repos.d/mongo.repo
install mongodb client <<<<<<<\e[0m"

yum install mongodb-org-shell -y
load schema <<<<<<<\e[0m"

mongo --host mongodb.sambadevops.online </app/schema/catalogue.js

