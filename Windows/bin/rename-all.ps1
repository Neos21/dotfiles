# ================================================================================
# �X�N���v�g�����s�����J�����g�f�B���N�g���ɂ���t�@�C���ɂ���
# �u���f�B�A�̍쐬�����v�������́u�B�e�����v�̒l���擾���ăt�@�C�����擪�ɕt�^ (���l�[��) ����
# 
# ex. �uHOGE.jpg�v���u2019-01-31 HOGE.jpg�v
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
  Write-Host "`n$folderPath : $fileName"
  
  if((Get-Item $targetFile).extension.toLower() -eq ".ps1") {
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
  
  if(!$selectedPropertyNo) {
    Write-Host "  �v���p�e�B�E�������̓v���p�e�B�̒l���Ȃ������E���l�[�������ł��Ȃ�"
    continue
  }
  else {
    Write-Host "  No.$selectedPropertyNo : $selectedPropertyName [$selectedPropertyValue]"
  }
  
  # ���t���t�@�C�����̐擪�ɕt�^����
  $dateTimeStr = $selectedPropertyValue.substring(1, 4) `
                 + "-" + $selectedPropertyValue.substring(7, 2) `
                 + "-" + $selectedPropertyValue.substring(11, 2)
  $newFileName = $dateTimeStr + " " + $fileName
  
  # ���l�[������
  Rename-Item $targetFile -newName $newFileName
  
  Write-Host "  ���l�[������ : [$newFileName]"
}

Write-Host "`n��������"
