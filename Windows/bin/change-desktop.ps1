# ====================================================================================================
# �w�i�摜�E���w�i�̐؂�ւ��Ɖ�ʂ̖��邳�𓯎��ɕύX����
# 
# - �w�i�摜���ݒ肳��Ă���ꍇ�́A���w�i�ɐ؂�ւ���
# - �w�i�摜���ݒ肳��Ă��Ȃ��ꍇ�́A�w�i�摜��ݒ肷��
# - Dell ���̃��j�^���g�p���Ă���ADell Display Manager ���C���X�g�[�����Ă���ꍇ��
#   ���w�i�ɂ��鎞�͉�ʂ̖��邳�������A�摜��ݒ肷�鎞�͉�ʂ̖��邳���グ��
# ====================================================================================================


# ���[�U�w��
# ====================================================================================================

# �ύX�������ǎ��̃p�X���w�肷�� : ���w�i�ɕύX����ꍇ�͂��̕ϐ����󕶎��ɕύX���ė��p�E���s����
$wallPaperPath = 'C:\Neos21\Dev\GitHub\dotfiles\Images\Yosemite4-1920-1080.jpg';

# �f�t�H���g�̉�ʂ̖��邳���w�肷�� : ���w�i�ɕύX����ꍇ�͂��̕ϐ��� 1 �ɕύX���ė��p�E���s����
$brightnessLevel = 50;


# ====================================================================================================


# �w�i��ύX���� C# �֐�
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
  
  // �w�i�摜��ύX���� : �󕶎����w�肷��Δw�i�摜�Ȃ��ɂȂ�
  // ���W�X�g���� WallPaper �l���Z�b�g���邱�Ƃŕǎ���ݒ�ł��邪�ASystemParametersInfo() ���Ăяo���Ȃ��Ƒ����ɔ��f����Ȃ�
  public static void SetWallPaper(string wallPaperPath) {
    SystemParametersInfo(SetDesktopWallpaper, 0, wallPaperPath, UpdateIniFile | SendWinIniChange);
    
    RegistryKey regKey = Registry.CurrentUser.OpenSubKey("Control Panel\\Desktop", true);
    regKey.SetValue("WallPaper", wallPaperPath);
    // �A�X�y�N�g����ێ����ĉ�ʑS�̂̑傫���ɂ��킹�Ċg��E��ʂɎ��܂�Ȃ������͂͂ݏo���悤�\�����@��ݒ肷��
    regKey.SetValue("WallpaperStyle", "10");
    regKey.SetValue("TileWallpaper", "0");
    regKey.Close();
  }
  
  // �w�i�F��ݒ肷��
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

# ��ʂ̖��邳��ύX����̂� Dell Display Manager ���g���̂ŁA���̑��݃`�F�b�N�����Ă���
$dellDisplayManagerPath = 'C:\Program Files (x86)\Dell\Dell Display Manager\ddm.exe';
$hasDellDisplayManager = $true;
if(-Not (Test-Path "$dellDisplayManagerPath")) {
  Write-Host 'Dell Display Manager �����݂��Ȃ��悤�Ȃ̂ŁA��ʂ̖��邳�͕ύX���܂���B';
  $hasDellDisplayManager = $false;
}

# ���݂̒l���擾����
$currentWallPaper = (Get-Item -Path 'Registry::HKEY_CURRENT_USER\Control Panel\Desktop').GetValue('WallPaper');

$message = '';
if([string]::IsNullOrEmpty("$currentWallPaper")) {
  if($hasDellDisplayManager) {
    $message = '���ݍ��w�i�Ȃ̂ŁA�摜�w�i��ݒ肵�A��ʂ𖾂邭���܂��B';
  } else {
    $message = '���ݍ��w�i�Ȃ̂ŁA�w�i�摜��ݒ肵�܂��B';
  }
} else {
  if($hasDellDisplayManager) {
    $message = '���ݔw�i�摜���ݒ肳��Ă���̂ŁA���w�i�ɂ��A��ʂ��Â����܂��B';
  } else {
    $message = '���ݔw�i�摜���ݒ肳��Ă���̂ŁA���w�i�ɂ��܂��B';
  }
  $wallPaperPath = '';
  $brightnessLevel = 0;
}

Write-Host "$message";
#Read-Host "${message}Enter �ŊJ�n���܂��B";

# ��ʂ̖��邳��ύX���� : & �� Call ���Z�q�BStart-Process �Ƃقړ��`
if($hasDellDisplayManager) {
  & "$dellDisplayManagerPath" /SetBrightnessLevel "$brightnessLevel";
}

# �w�i���Œ�ō��F�ɂ���
[WallPaper]::SetBackgroundColour(0, 0, 0);
# �w�i�摜��ݒ肷��
[WallPaper]::SetWallPaper($wallPaperPath);

Write-Host '�����E�I�����܂��B';
#Read-Host '�����EEnter �ŏI�����܂��B';
exit;



# - �Q�l����
#   - https://gist.github.com/s7ephen/714023
#   - https://www.oborodukiyo.info/PowerShell/v20/PS-Comment
#   - http://wiki.yottun8.com/?PowerShell_%E3%83%AC%E3%82%B8%E3%82%B9%E3%83%88%E3%83%AA
#   - https://bakemoji.hatenablog.jp/entry/2014/08/24/141629
#   - https://www.powershellgallery.com/packages/Set-DesktopBackGround/1.0.0.0/Content/Set-DesktopBackGround.ps1
#   - https://stackoverflow.com/questions/9440135/powershell-script-from-shortcut-to-change-desktop
#   - https://smdn.jp/programming/tips/setdeskwallpaper/
#   - https://www.it-swarm-ja.com/ja/c%23/net%E3%81%AE%E3%82%B3%E3%83%BC%E3%83%89%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%97%E3%81%A6%E3%83%87%E3%82%B9%E3%82%AF%E3%83%88%E3%83%83%E3%83%97%E3%81%AE%E5%A3%81%E7%B4%99%E3%82%92%E5%A4%89%E6%9B%B4%E3%81%99%E3%82%8B/967219646/



<#
Rem Windows Batch �Ŏ������悤�Ƃ������A�ǎ��̕ύX�����f����Ȃ����Ƃ������̂Œf�O

Rem ���݂̐ݒ���m�F����
for /f "tokens=3" %%a in ('reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaper ^| findstr /ri "REG_SZ"') do (
  set CURRENT_WALLPAPER_PATH=%%a
)

set WALLPAPER_PATH=C:\PATH\TO\WALL-PAPER.jpg
set BRIGHTNESS_LEVEL=50

Rem �w�i���Œ�ō��F�ɂ���
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v Background /t REG_SZ /d "0 0 0" /f
Rem �w�i�摜��ݒ肷�� (�摜���g�p���Ȃ��ꍇ�͋󕶎���n��)
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaper /t REG_SZ /d "%WALLPAPER_PATH%" /f
Rem �摜�̔z�u���@��I�� (10 : �]�����ł��Ȃ��悤�Ɋg��z�u)
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallPaperStyle /t REG_SZ /d 10 /f

Rem �ݒ�𔽉f���� : 10��قǒ@���Ə�肭���f�����̂Ń��[�v���Ă��邪�A���̃o�b�`���̂�A���Ŏ��s����Ə�肭���f����Ȃ�
for /l %%i in (1,1,10) do (
  rundll32.exe user32.dll, UpdatePerUserSystemParameters
  Rem rundll32.exe user32.dll, UpdatePerUserSystemParameters 1, True
)

Rem Dell Display Manager ���g���Ė��邳�𒲐�����
"C:\Program Files (x86)\Dell\Dell Display Manager\ddm.exe" /SetBrightnessLevel %BRIGHTNESS_LEVEL%

Rem - �Q�l����
Rem   - https://www.windows-commandline.com/change-windows-wallpaper-command-line/
Rem   - https://serverfault.com/questions/268423/changing-desktop-solid-color-via-registry
Rem   - https://jj-blues.com/cms/wantto-useloop/
Rem   - https://superuser.com/questions/995591/how-to-get-a-registry-value-and-set-into-a-variable-in-batch
#>
