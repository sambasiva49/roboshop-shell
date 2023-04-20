script_path=$(dirname $0)
source ${script_path}/common.sh


curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
rm -rf /app
mkdir /app
#cd /app
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
unzip /tmp/cart.zip
#cp ${script_path}l/cart.service /etc/systemd/system/cart.service
cd /app
npm install
cp ${script_path}/cart.service /etc/systemd/system/cart.service

systemctl daemon-reload
systemctl enable cart
systemctl satrt cart
