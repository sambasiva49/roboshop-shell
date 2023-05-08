app_user=roboshop
script=${realpath "$0"}
script_path=$(dirname "$script")

function_nodejs(){
  echo -e "\e[36m>>>>>>>>configuration nodejs repos<<<<<<<\e[0m"

  curl -sL https://rpm.nodesource.com/setup_lts.x | bash
  echo -e "\e[36m>>>>>>>>install nodejs  <<<<<<<\e[0m"

  yum install nodejs -y
  echo -e "\e[36m>>>>>>>>add roboshop user <<<<<<<\e[0m"


  useradd ${app_user}
  echo -e "\e create application directory <<<<<<<\e[0m"
  rm -rf /app
  mkdir /app

  echo -e "\e[36m>>>>>>>> download app content <<<<<<<\e[0m"

curl -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}.zip

  cd /app
  echo -e "\e[36m>>>>>>>>unzip app content <<<<<<<\e[0m"

  unzip /tmp/${component}.zip

  echo -e "\e[36m>>>>>>>> install nodejs <<<<<<<\e[0m"

  npm install
  echo -e "\e[36m>>>>>>>>copy catalogue systemd file <<<<<<<\e[0m"

  cp ${script_path}/${component}.service /etc/systemd/system/${component}.service
  echo -e "\e[36m>>>>>>>>start catalogue service<<<<<<<\e[0m"

  systemctl daemon-reload
  systemctl enable ${component}
  systemctl satrt ${component}


}