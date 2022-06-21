# Windows WSL2 に外部から直接アクセスできるようにする
# https://rcmdnk.com/blog/2021/03/01/computer-windows-network/

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell.exe "-File `"$PSCommandPath`"" -Verb RunAs; exit }

$ip = bash.exe -c "ip r |tail -n1|cut -d ' ' -f9"
if( ! $ip ){
  echo "The Script Exited, the ip address of WSL 2 cannot be found";
  exit;
}

# All the ports you want to forward separated by comma
# 外部公開したいポート番号をカンマ区切りで列挙する
$ports=@(22,3000,4200,8080);
$ports_a = $ports -join ",";

# Remove Firewall Exception Rules
iex "Remove-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' ";

# Adding Exception Rules for inbound and outbound Rules
iex "New-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' -Direction Outbound -LocalPort $ports_a -Action Allow -Protocol TCP";
iex "New-NetFireWallRule -DisplayName 'WSL 2 Firewall Unlock' -Direction Inbound -LocalPort $ports_a -Action Allow -Protocol TCP";

for( $i = 0; $i -lt $ports.length; $i++ ){
  $port = $ports[$i];
  iex "netsh interface portproxy add v4tov4 listenport=$port listenaddress=* connectport=$port connectaddress=$ip";
}

# Show proxies
iex "netsh interface portproxy show v4tov4";

# 削除したい場合は netsh interface portproxy delete v4tov4 listenport=4200 listenaddress=* のように叩く
