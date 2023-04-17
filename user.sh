curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
mikdir /app
cd /app
curl -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
unzip /tmp/user.zip
cp user.service /etc/system.d/system/user.service

npm install
system daemon-reload
systemctl enable user
systemctl resatrt user
cp mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb.sambadevops.online </app/schema/user.js
