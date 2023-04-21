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
echo -e "\e[36m>>>>>>>>copy user systemd file <<<<<<<\e[0m"
cp $script_path/user.service /etc/systemd/system/user.service
echo -e "\e[36m>>>>>>>> npm install<<<<<<<\e[0m"

npm install
echo -e "\e[36m>>>>>>>>start user service<<<<<<<\e[0m"

system daemon-reload
systemctl enable user
systemctl resatrt user
cp mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb.sambadevops.online </app/schema/user.js
