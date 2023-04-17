curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
mikdir /app
cd /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip
unzip /tmp/catalogue.zip
cp catalogue.service /etc/system.d/system/catalogue.service

npm install
system daemon-reload
systemctl enable catalogue
systemctl resatrt catalogue
cp mongo.repo /etc/yum.repos.d/mongo.repo
yum install mongodb-org-shell -y
mongo --host mongodb.sambadevops.online </app/schema/catalogue.js
