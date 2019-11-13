# ================================================================================
# スクリプトを実行したカレントディレクトリにあるファイルについて
# 「メディアの作成日時」「撮影日時」の値、もしくは「作成日時」「更新日時」のいずれか古い方の値より
# 「YYYY-MM-DD」ディレクトリを作成し、そのディレクトリにファイルを移動する
# 
# ex. 「HOGE.jpg」→「2019-01-31\HOGE.jpg」
# ================================================================================

# スクリプトを呼び出したカレントディレクトリを指定する
[String]$targetDirectory = Get-Location

Write-Host "`n処理開始 : $targetDirectory"

# 対象ディレクトリ配下のファイルのみをフルパスで取得する
$targetFiles = Get-ChildItem $targetDirectory | Where-Object { ! $_.PSIsContainer } | % { $_.FullName }

# ファイルフルパスを元に1ファイルずつ処理する
foreach($targetFile in $targetFiles) {
  # ディレクトリパスとファイル名に分割する
  $folderPath = Split-Path $targetFile
  $fileName   = Split-Path $targetFile -Leaf
  Write-Host "$folderPath : $fileName"
  
  $targetFileObject = Get-Item $targetFile
  
  if($targetFileObject.extension.toLower() -eq ".ps1") {
    Write-Host "  PowerShell スクリプトは処理しない"
    continue
  }
  
  # シェルオブジェクトを作成する
  $shell       = New-Object -ComObject Shell.Application
  $shellFolder = $shell.namespace($folderPath)
  $shellFile   = $shellFolder.parseName($fileName)
  
  # 詳細プロパティからリネームに使用するプロパティ名と値を取得する
  $selectedPropertyNo    = ""
  $selectedPropertyName  = ""
  $selectedPropertyValue = ""
  
  # 詳細プロパティを列挙する : 適当に310項目
  for($i = 0; $i -lt 310; $i++) {
    $propertyName  = $shellFolder.getDetailsOf($Null, $i)
    if($propertyName -eq "メディアの作成日時" -or $propertyName -eq "撮影日時") {
      $propertyValue = $shellFolder.getDetailsOf($shellFile, $i)
      if($propertyValue) {
        # 指定のプロパティに値があった場合のみ取得する
        $selectedPropertyNo    = $i
        $selectedPropertyName  = $propertyName
        $selectedPropertyValue = $propertyValue
        break
      }
    }
  }
  
  $dateTimeStr = "0000-00-00"
  
  if(! $selectedPropertyNo) {
    Write-Host "  適切なプロパティがなかったので作成日時 or 更新日時のいずれかより古い方の値を取得・使用する"
    if($targetFileObject.creationTime -lt $targetFileObject.lastWriteTime) {
      Write-Host "    作成日の方が古い : [" $targetFileObject.creationTime "] < [" $targetFileObject.lastWriteTime "]"
      $dateTimeStr = $targetFileObject.creationTime.toString("yyyy-MM-dd")
    }
    else {
      Write-Host "    更新日の方が古い : [" $targetFileObject.creationTime "] > [" $targetFileObject.lastWriteTime "]"
      $dateTimeStr = $targetFileObject.lastWriteTime.toString("yyyy-MM-dd")
    }
  }
  else {
    # 取得したプロパティの値から日付を取得する
    Write-Host "  No.$selectedPropertyNo : $selectedPropertyName [$selectedPropertyValue]"
    $dateTimeStr = $selectedPropertyValue.substring(1, 4) `
                 + "-" + $selectedPropertyValue.substring(7, 2) `
                 + "-" + $selectedPropertyValue.substring(11, 2)
  }
  
  # 日付のディレクトリを作る : Out-Null にパイプすることで結果を非表示にする
  $newDirectoryPath = $targetDirectory + "\" + $dateTimeStr
  New-Item $newDirectoryPath -ItemType Directory -Force | Out-Null
  Write-Host "  ディレクトリ作成 [$dateTimeStr]"
  
  # ファイルを移動する
  Move-Item $targetFile $newDirectoryPath
  Write-Host "  移動 [$newDirectoryPath\$fileName]"
}

Write-Host "`n処理完了"
