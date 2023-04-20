source common.sh
yum install python36 gcc python3-devel -y
useradd ${app_user}
rm -rf /app
mkdir /app
cd /app
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app
unzip /tmp/payment.zip
pip3.6 install -r requirements.txt
cp /home/centos/roboshop-shell/payment.service /etc/systemd/system/payment.service

systemctl daemon-reload
systemctl enable payment
systemctl start payment