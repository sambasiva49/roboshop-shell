source common.sh
pwd
exit
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd ${app_user}
rm -rf /app
mkdir /app
#cd /app
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
unzip /tmp/user.zip
cp /home/centos/roboshop-shell/user.service /etc/systemd/system/user.service

npm install
system daemon-reload
systemctl enable user
systemctl resatrt user
cp mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb.sambadevops.online </app/schema/user.js
