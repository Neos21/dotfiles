# ================================================================================
# �X�N���v�g�����s�����J�����g�f�B���N�g���ɂ���t�@�C���ɂ���
# �u���f�B�A�̍쐬�����v�u�B�e�����v�̒l�A�������́u�쐬�����v�u�X�V�����v�̂����ꂩ�Â����̒l���
# �uYYYY-MM-DD�v�f�B���N�g�����쐬���A���̃f�B���N�g���Ƀt�@�C�����ړ�����
# 
# - ex. �uHOGE.jpg�v���u2019-01-31\HOGE.jpg�v
# ================================================================================

# �X�N���v�g���Ăяo�����J�����g�f�B���N�g�����w�肷��
[String]$targetDirectory = Get-Location

Write-Host "`n�����J�n : $targetDirectory"

# �Ώۃf�B���N�g���z���̃t�@�C���݂̂��t���p�X�Ŏ擾����
$targetFiles = Get-ChildItem $targetDirectory | Where-Object { ! $_.PSIsContainer } | % { $_.FullName }

# �t�@�C���t���p�X������1�t�@�C������������
foreach($targetFile in $targetFiles) {
  # �f�B���N�g���p�X�ƃt�@�C�����ɕ�������
  $folderPath = Split-Path $targetFile
  $fileName   = Split-Path $targetFile -Leaf
  Write-Host "$folderPath : $fileName"
  
  $targetFileObject = Get-Item $targetFile
  
  if($targetFileObject.extension.toLower() -eq ".ps1") {
    Write-Host "  PowerShell �X�N���v�g�͏������Ȃ�"
    continue
  }
  
  # �V�F���I�u�W�F�N�g���쐬����
  $shell       = New-Object -ComObject Shell.Application
  $shellFolder = $shell.namespace($folderPath)
  $shellFile   = $shellFolder.parseName($fileName)
  
  # �ڍ׃v���p�e�B���烊�l�[���Ɏg�p����v���p�e�B���ƒl���擾����
  $selectedPropertyNo    = ""
  $selectedPropertyName  = ""
  $selectedPropertyValue = ""
  
  # �ڍ׃v���p�e�B��񋓂��� : �K����310����
  for($i = 0; $i -lt 310; $i++) {
    $propertyName  = $shellFolder.getDetailsOf($Null, $i)
    if($propertyName -eq "���f�B�A�̍쐬����" -or $propertyName -eq "�B�e����") {
      $propertyValue = $shellFolder.getDetailsOf($shellFile, $i)
      if($propertyValue) {
        # �w��̃v���p�e�B�ɒl���������ꍇ�̂ݎ擾����
        $selectedPropertyNo    = $i
        $selectedPropertyName  = $propertyName
        $selectedPropertyValue = $propertyValue
        break
      }
    }
  }
  
  $dateTimeStr = "0000-00-00"
  
  if(! $selectedPropertyNo) {
    Write-Host "  �K�؂ȃv���p�e�B���Ȃ������̂ō쐬���� or �X�V�����̂����ꂩ���Â����̒l���擾�E�g�p����"
    if($targetFileObject.creationTime -lt $targetFileObject.lastWriteTime) {
      Write-Host "    �쐬���̕����Â� : [" $targetFileObject.creationTime "] < [" $targetFileObject.lastWriteTime "]"
      $dateTimeStr = $targetFileObject.creationTime.toString("yyyy-MM-dd")
    }
    else {
      Write-Host "    �X�V���̕����Â� : [" $targetFileObject.creationTime "] > [" $targetFileObject.lastWriteTime "]"
      $dateTimeStr = $targetFileObject.lastWriteTime.toString("yyyy-MM-dd")
    }
  }
  else {
    # �擾�����v���p�e�B�̒l������t���擾����
    Write-Host "  No.$selectedPropertyNo : $selectedPropertyName [$selectedPropertyValue]"
    $dateTimeStr = $selectedPropertyValue.substring(1, 4) `
                 + "-" + $selectedPropertyValue.substring(7, 2) `
                 + "-" + $selectedPropertyValue.substring(11, 2)
  }
  
  # ���t�̃f�B���N�g������� : Out-Null �Ƀp�C�v���邱�ƂŌ��ʂ��\���ɂ���
  $newDirectoryPath = $targetDirectory + "\" + $dateTimeStr
  New-Item $newDirectoryPath -ItemType Directory -Force | Out-Null
  Write-Host "  �f�B���N�g���쐬 [$dateTimeStr]"
  
  # �t�@�C�����ړ�����
  Move-Item $targetFile $newDirectoryPath
  Write-Host "  �ړ� [$newDirectoryPath\$fileName]"
}

Write-Host "`n��������"
