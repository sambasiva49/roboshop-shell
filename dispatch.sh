script_path=$(dirname $0)
source ${script_path}/common.sh

yum install golang -y
useradd roboshop
mkdir /app
cd /app
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch.zip
unzip /temp/dispatch.zip
cd /app
go mod init dispatch
go get
go build
cp ${script_path}/dispatch.service /etc/systemd/system/dispatch.service
systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch