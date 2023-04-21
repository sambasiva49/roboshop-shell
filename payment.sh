script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

yum install python36 gcc python3-devel -y
useradd ${app_user}
rm -rf /app
mkdir /app
cd /app
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app
unzip /tmp/payment.zip
pip3.6 install -r requirements.txt
echo -e "\e[36m>>>>>>>> copy the path<<<<<<<\e[0m"

cp ${script_path}/payment.service /etc/systemd/system/payment.service
echo -e "\e[36m>>>>>>>> services restart<<<<<<<\e[0m"

systemctl daemon-reload
systemctl enable payment
systemctl start payment