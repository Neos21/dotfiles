# ================================================================================
# WSL2 ���ċN������ �F https://qiita.com/RIckyBan/items/87b558220d2bc5dd11cb
# ================================================================================

Restart-Service LxssManager
Stop-Service -name "hns"
Start-Service -name "hns"
Get-NetAdapter -IncludeHidden | Where-Object {$_.InterfaceDescription.StartsWith('Hyper-V Virtual Switch Extension Adapter')} | Disable-NetAdapter -Confirm:$False
Get-NetAdapter -IncludeHidden | Where-Object {$_.InterfaceDescription.StartsWith('Hyper-V Virtual Switch Extension Adapter')} | Enable-NetAdapter -Confirm:$False
