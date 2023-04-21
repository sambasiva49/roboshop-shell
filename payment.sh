script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh
echo -e "\e[36m>>>>>>>>install python36<<<<<<<\e[0m"

yum install python36 gcc python3-devel -y
echo -e "\e[36m>>>>>>>>adding user<<<<<<<\e[0m"

useradd ${app_user}
rm -rf /app
echo -e "\e[36m>>>>>>>>create diroctry<<<<<<<\e[0m"

mkdir /app
cd /app
echo -e "\e[36m>>>>>>>>download file<<<<<<<\e[0m"

curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app
unzip /tmp/payment.zip
echo -e "\e[36m>>>>>>>>install python36<<<<<<<\e[0m"

pip3.6 install -r requirements.txt
echo -e "\e[36m>>>>>>>> copy the path<<<<<<<\e[0m"

cp ${script_path}/payment.service /etc/systemd/system/payment.service
echo -e "\e[36m>>>>>>>> services restart<<<<<<<\e[0m"

systemctl daemon-reload
systemctl enable payment
systemctl start payment