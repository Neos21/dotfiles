# ====================================================================================================
# �f�B�X�v���C�̓d�����I�t�ɂ���
# 
# - �Q�l : https://qiita.com/sharow/items/ef78f2f5a8053f6a7a41
# - Esc �L�[�����������邩�A�}�E�X�𑀍삷��Ȃǂ���΍ēx�f�B�X�v���C���I���ɂȂ�
# ====================================================================================================

$code = @'
[return: MarshalAs(UnmanagedType.Bool)]
[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
public static extern bool PostMessage(uint hWnd, uint Msg, IntPtr wParam, IntPtr lParam);

[DllImport("user32.dll", SetLastError = true)]
public static extern bool LockWorkStation();
'@;
$powerManager = Add-Type -MemberDefinition $code -Name 'PowerManager' -PassThru -Language CSharp;

# Display Off
$powerManager::PostMessage(0xffff, 0x0112, 0xf170, 2);

# Lock (Win + L ����) : https://docs.microsoft.com/ja-jp/powershell/scripting/samples/changing-computer-state?view=powershell-7.2
# $powerManager::LockWorkStation();
