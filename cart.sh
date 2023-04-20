source common.sh

curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
rm -rf /app
mkdir /app
#cd /app
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip
#cp /home/centos/roboshop-shell/cart.service /etc/systemd/system/cart.service
cd /app
npm install
cp /home/centos/roboshop-shell/cart.service /etc/systemd/system/cart.service

systemctl daemon-reload
systemctl enable cart
systemctl satrt cart
