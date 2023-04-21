script_path=$(dirname $0)
source ${script_path}/common.sh
exit
source common.sh
echo -e "\e[36m>>>>>>>>configuration nodejs repos<<<<<<<\e[0m" | bash

curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[36m>>>>>>>>install nodejs  <<<<<<<\e[0m"

yum install nodejs -y
echo -e "\e[36m>>>>>>>>add roboshop user <<<<<<<\e[0m"


useradd ${app_user}
echo -e "\e[36m>>>>>>>> create application directory <<<<<<<\e[0m"
rm -rf /app
mkdir /app
cd /app
echo -e "\e[36m>>>>>>>> download app content <<<<<<<\e[0m"

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
echo -e "\e[36m>>>>>>>>unzip app content <<<<<<<\e[0m"

unzip /tmp/catalogue.zip

echo -e "\e[36m>>>>>>>> install nodejs <<<<<<<\e[0m"
cd /app
npm install
echo -e "\e[36m>>>>>>>>copy catalogue systemd file <<<<<<<\e[0m"

cp ${script_path}/catalogue.service /etc/systemd/system/catalogue.service
echo -e "\e[36m>>>>>>>>start catalogue service<<<<<<<\e[0m"

system daemon-reload
systemctl enable catalogue
systemctl resatrt catalogue

echo -e "\e[36m>>>>>>>> copy mongo repo <<<<<<<\e[0m"

cp mongo.repo /etc/yum.repos.d/mongo.repo
echo -e "\e[36m>>>>>>>>install mongodb client <<<<<<<\e[0m"

yum install mongodb-org-shell -y
echo -e "\e[36m>>>>>>>>load schema <<<<<<<\e[0m"

mongo --host mongodb.sambadevops.online </app/schema/catalogue.js
