
script=${realpath "$0"}
script_path=$(dirname "$script")
source "${script_path}"/common.sh

echo -e "\e[36m>>>>>>>>configuration nodejs repos<<<<<<<\e[0m"

curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[36m>>>>>>>>install nodejs  <<<<<<<\e[0m"

yum install nodejs -y
echo -e "\e[36m>>>>>>>>add roboshop user <<<<<<<\e[0m"

useradd ${app_user}
rm -rf /app
echo -e "\e[36m>>>>>>>> create application directory <<<<<<<\e[0m"

mkdir /app
#cd /app
echo -e "\e[36m>>>>>>>> download app content <<<<<<<\e[0m"

curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
echo -e "\e[36m>>>>>>>>unzip app content <<<<<<<\e[0m"

unzip /tmp/cart.zip
#cp ${script_path}l/cart.service /etc/systemd/system/cart.service
echo -e "\e[36m>>>>>>>> install nodejs <<<<<<<\e[0m"

npm install
echo -e "\e[36m>>>>>>>>copy catalogue systemd file <<<<<<<\e[0m"

cp $script_path/cart.service /etc/systemd/system/cart.service
echo -e "\e[36m>>>>>>>>start catalogue service<<<<<<<\e[0m"

systemctl daemon-reload
systemctl enable cart
systemctl start cart
