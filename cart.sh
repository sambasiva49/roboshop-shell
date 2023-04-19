curl -sL https://rpm.nodesource.com/setup_lts.x | bash
yum install nodejs -y
useradd roboshop
mkdir /app
cd /app
curl -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
unzip /tmp/cart.zip
cp cart.service /etc/systemd/system/cart.service

npm install
system daemon-reload
systemctl enable cart
systemctl resatrt cart
