yum install maven -y
useradd roboshop
mkidir /app
cd /app
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
unzip /tmp/shipping.zip

mvn clean package
mv target/shipping-1.0.jar shipping.jar

cp shipping.service /etc/systemd/system/shipping.service
systemctl daemon-reload
systemctl enable shipping
systemctl start shipping
yum install mysql -y
mysql -h mysql.sambadevops.online -uroot -pRoboShop@1 < /app/schema/shipping.sql
systemctl restart shipping