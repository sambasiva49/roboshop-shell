script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd ${app_user}
rm -rf /app
mkdir /app
#cd /app
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
copy user systemd file <<<<<<<\e[0m"
cp $script_path/user.service /etc/systemd/system/user.service
 npm install<<<<<<<\e[0m"

npm install
start user service<<<<<<<\e[0m"

systemctl daemon-reload
systemctl enable user
systemctl start user
 mongo repo file copy<<<<<<<\e[0m"

cp mongo.repo /etc/yum.repos.d/mongo.repo
install mongo <<<<<<<\e[0m"

yum install mongodb-org-shell -y
 connect dns server<<<<<<<\e[0m"

mongo --host mongodb.sambadevops.online </app/schema/user.js
