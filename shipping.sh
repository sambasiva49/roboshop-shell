script=$(realpath "$0")
script_path=$(dirname "$script")
source ${script_path}/common.sh

yum install maven -y
useradd ${app_user}
rm -rf /app
mkdir /app
#cd /app
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip

mvn clean package
mv target/shipping-1.0.jar shipping.jar
echo -e "\e[36m>>>>>>>>copy user systemd file <<<<<<<\e[0m"


cp ${script_path}/shipping.service /etc/systemd/system/shipping.service
echo -e "\e[36m>>>>>>>> start the services<<<<<<<\e[0m"

systemctl daemon-reload
systemctl enable shipping
systemctl start shipping
yum install mysql -y
mysql -h mysql.sambadevops.online -uroot -pRoboShop@1 < /app/schema/shipping.sql
systemctl restart shipping