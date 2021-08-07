# ====================================================================================================
# 背景画像・黒背景の切り替えと画面の明るさを同時に変更する
# 
# - 背景画像が設定されている場合は、黒背景に切り替える
# - 背景画像が設定されていない場合は、背景画像を設定する
# - Dell 製のモニタを使用しており、Dell Display Manager をインストールしてある場合は
#   黒背景にする時は画面の明るさを下げ、画像を設定する時は画面の明るさを上げる
# ====================================================================================================


# ユーザ指定
# ====================================================================================================

# 変更したい壁紙のパスを指定する : 黒背景に変更する場合はこの変数を空文字に変更して流用・続行する
$wallPaperPath = 'C:\Neos21\Dev\GitHub\dotfiles\Images\Yosemite4-1920-1080.jpg';

# デフォルトの画面の明るさを指定する : 黒背景に変更する場合はこの変数を 1 に変更して流用・続行する
$brightnessLevel = 50;


# ====================================================================================================


# 背景を変更する C# 関数
$code = @'
using System;
using System.Drawing;
using System.Runtime.InteropServices;
using Microsoft.Win32;

public class WallPaper {
  [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
  private static extern int SystemParametersInfo(int uAction, int uParm, string lpvParam, int fuWinIni);
  
  [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
  private static extern int SetSysColors(int cElements, int[] lpaElements, int[] lpRgbValues);
  
  public const int SetDesktopWallpaper = 0x0014;
  public const int UpdateIniFile = 0x01;
  public const int SendWinIniChange = 0x02;
  
  public const int colourDesktop = 1;
  public int[] first = {colourDesktop};
  
  // 背景画像を変更する : 空文字を指定すれば背景画像なしになる
  // レジストリの WallPaper 値をセットすることで壁紙を設定できるが、SystemParametersInfo() を呼び出さないと即座に反映されない
  public static void SetWallPaper(string wallPaperPath) {
    SystemParametersInfo(SetDesktopWallpaper, 0, wallPaperPath, UpdateIniFile | SendWinIniChange);
    
    RegistryKey regKey = Registry.CurrentUser.OpenSubKey("Control Panel\\Desktop", true);
    regKey.SetValue("WallPaper", wallPaperPath);
    // アスペクト比を維持して画面全体の大きさにあわせて拡大・画面に収まらない部分ははみ出すよう表示方法を設定する
    regKey.SetValue("WallpaperStyle", "10");
    regKey.SetValue("TileWallpaper", "0");
    regKey.Close();
  }
  
  // 背景色を設定する
  public static void SetBackgroundColour(byte r, byte g, byte b) {
    int[] elements = {colourDesktop};
    System.Drawing.Color colours = System.Drawing.Color.FromArgb(r,g,b);
    int[] colors = {System.Drawing.ColorTranslator.ToWin32(colours)};
    SetSysColors(elements.Length, elements, colors);
    
    RegistryKey regKey = Registry.CurrentUser.OpenSubKey("Control Panel\\Colors", true);
    regKey.SetValue("Background", string.Format("{0} {1} {2}", colours.R, colours.G, colours.B));
    regKey.Close();
  }
}
'@;
Add-Type -TypeDefinition $code -ReferencedAssemblies System.Drawing.dll;

# 画面の明るさを変更するのに Dell Display Manager を使うので、その存在チェックをしておく
$dellDisplayManagerPath = 'C:\Program Files (x86)\Dell\Dell Display Manager\ddm.exe';
$hasDellDisplayManager = $true;
if(-Not (Test-Path "$dellDisplayManagerPath")) {
  Write-Host 'Dell Display Manager が存在しないようなので、画面の明るさは変更しません。';
  $hasDellDisplayManager = $false;
}

# 現在の値を取得する
$currentWallPaper = (Get-Item -Path 'Registry::HKEY_CURRENT_USER\Control Panel\Desktop').GetValue('WallPaper');

$message = '';
if([string]::IsNullOrEmpty("$currentWallPaper")) {
  if($hasDellDisplayManager) {
    $message = '現在黒背景なので、画像背景を設定し、画面を明るくします。';
  } else {
    $message = '現在黒背景なので、背景画像を設定します。';
  }
} else {
  if($hasDellDisplayManager) {
    $message = '現在背景画像が設定されているので、黒背景にし、画面を暗くします。';
  } else {
    $message = '現在背景画像が設定されているので、黒背景にします。';
  }
  $wallPaperPath = '';
  $brightnessLevel = 0;
}

Write-Host "$message";
#Read-Host "${message}Enter で開始します。";

# 画面の明るさを変更する : & は Call 演算子。Start-Process とほぼ同義
if($hasDellDisplayManager) {
  & "$dellDisplayManagerPath" /SetBrightnessLevel "$brightnessLevel";
}

# 背景を固定で黒色にする
[WallPaper]::SetBackgroundColour(0, 0, 0);
# 背景画像を設定する
[WallPaper]::SetWallPaper($wallPaperPath);

Write-Host '完了・終了します。';
#Read-Host '完了・Enter で終了します。';
exit;



# - 参考文献
#   - https://gist.github.com/s7ephen/714023
#   - https://www.oborodukiyo.info/PowerShell/v20/PS-Comment
#   - http://wiki.yottun8.com/?PowerShell_%E3%83%AC%E3%82%B8%E3%82%B9%E3%83%88%E3%83%AA
#   - https://bakemoji.hatenablog.jp/entry/2014/08/24/141629
#   - https://www.powershellgallery.com/packages/Set-DesktopBackGround/1.0.0.0/Content/Set-DesktopBackGround.ps1
#   - https://stackoverflow.com/questions/9440135/powershell-script-from-shortcut-to-change-desktop
#   - https://smdn.jp/programming/tips/setdeskwallpaper/
#   - https://www.it-swarm-ja.com/ja/c%23/net%E3%81%AE%E3%82%B3%E3%83%BC%E3%83%89%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%97%E3%81%A6%E3%83%87%E3%82%B9%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E3%81%AE%E5%A3%81%E7%B4%99%E3%82%92%E5%A4%89%E6%9B%B4%E3%81%99%E3%82%8B/967219646/



<#
Rem Windows Batch で実装しようとしたが、壁紙の変更が反映されないことが多いので断念

Rem 現在の設定を確認する
for /f "tokens=3" %%a in ('reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaper ^| findstr /ri "REG_SZ"') do (
  set CURRENT_WALLPAPER_PATH=%%a
)

set WALLPAPER_PATH=C:\PATH\TO\WALL-PAPER.jpg
set BRIGHTNESS_LEVEL=50

Rem 背景を固定で黒色にする
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v Background /t REG_SZ /d "0 0 0" /f
Rem 背景画像を設定する (画像を使用しない場合は空文字を渡す)
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaper /t REG_SZ /d "%WALLPAPER_PATH%" /f
Rem 画像の配置方法を選ぶ (10 : 余白ができないように拡大配置)
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaperStyle /t REG_SZ /d 10 /f

Rem 設定を反映する : 10回ほど叩くと上手く反映されるのでループしているが、このバッチ自体を連続で実行すると上手く反映されない
for /l %%i in (1,1,10) do (
  rundll32.exe user32.dll, UpdatePerUserSystemParameters
  Rem rundll32.exe user32.dll, UpdatePerUserSystemParameters 1, True
)

Rem Dell Display Manager を使って明るさを調整する
"C:\Program Files (x86)\Dell\Dell Display Manager\ddm.exe" /SetBrightnessLevel %BRIGHTNESS_LEVEL%

Rem - 参考文献
Rem   - https://www.windows-commandline.com/change-windows-wallpaper-command-line/
Rem   - https://serverfault.com/questions/268423/changing-desktop-solid-color-via-registry
Rem   - https://jj-blues.com/cms/wantto-useloop/
Rem   - https://superuser.com/questions/995591/how-to-get-a-registry-value-and-set-into-a-variable-in-batch
#>
