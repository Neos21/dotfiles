@Echo Off

Rem Wake On LAN Script


Rem MAC Address
Set MAC_ADDRESS=XX:XX:XX:XX:XX:XX


Rem Hyphen To Colon
Set MAC_ADDRESS=%MAC_ADDRESS:-=:%

Powershell "$dst=[byte[]]("""%MAC_ADDRESS%""".split(""":""") | ForEach-Object{[Convert]::ToInt32($_, 16)});$magicPacket=([byte[]](@(0xFF)*6)) + $dst * 16;$client=new-object System.Net.Sockets.UdpClient;$target=[System.Net.IPAddress]::Broadcast;$client.Connect($target,9);$client.Send($magicPacket,$magicPacket.Length)|out-null;$client.Close()"

Echo Send Magic Packet To %MAC_ADDRESS% .

Pause
Exit /b 0
