# ================================================================================
# �X�N���v�g�����s�����J�����g�f�B���N�g���ɂ��� HEIC �t�@�C���� JPG �ɕϊ�����
# convert-to-jpg.ps1 ���g�p����
# ================================================================================

# �X�N���v�g���Ăяo�����J�����g�f�B���N�g�����w�肷��
[String]$targetDirectory = Get-Location

Write-Host "`n�����J�n : $targetDirectory"

# �Ώۃf�B���N�g���z���� HEIC �t�@�C�����擾�� convert-to-jpg.ps1 ��K�p����
Get-ChildItem $targetDirectory | Where-Object { $_.Extension.ToLower() -eq ".heic" } | convert-to-jpg.ps1

Write-Host "`n��������"
