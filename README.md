# Magisk模块-红魔8官方系统修改电竞键功能

## 免责声明
我也是一个小白，这个模块很简单，但我也不能确保我写的一定没问题，刷入前请具有一定的刷机经验和救砖知识，刷入前请备份数据并务必装好救砖模块。我只在我红魔8S Pro+的8.0.17版本上进行了测试。请自行思考是否使用本模块，刷入本模块造成的任何后果都与模块作者无关。

## 模块的功能
请确保你已经在开发者选项中将游戏空间开启方式改为桌面图标，这个模块不会自动关闭电竞键原有的功能，需要在开发者选项中手动关闭。

将电竞键功能设置为调整声音模式、手电筒、自定义Shell。在配置文件中修改按键功能，具体的配置文件在/data/adb/modules/RM8_Change_GameKey_Function/CGF_config文件中，共有4个参数，里面有详细说明。电竞键的拨动行为触发模块操作，模块不检测电竞键的位置，模块只检测电竞键的拨动行为。

模块安装默认功能为声音模式切换，向下拨动静音或振动，向上拨动响铃。配置文件中可设置无声时是振动模式还是静音模式，媒体音是否跟随静音及解除静音。模块安装默认为无声是振动模式，不改变媒体音。

模块功能2为手电筒，向下拨动打开手电，向上拨动关闭手电。注意存在已知BUG：模块在使用手电筒功能时因为我不知道的原因会形成接管闪光灯控制的效果，除模块外将无法再控制控制闪关灯，包括状态栏的手电筒磁铁、相机闪关灯等，重启手机后不再使用模块的手电筒功能即可恢复。关于配置文件中手电筒的亮度值，特别特别注意，亮度不要过高，长时间高亮度有烧毁闪光灯的可能，这里给几个参考值：状态栏手电筒磁铁为59，相机APP闪光灯补光7档亮度为106、1档亮度为13。也不要过低，过低只是会点不亮闪光灯。模块默认亮度为70 。

模块功能3为执行自定义shell脚本，模块目录下的user-owned_shell_up2down.sh为每次按键从上到下时执行，user-owned_shell_down2up.sh为每次按键从下到上时执行，编写脚本请具有一定的shell基础。

## 下载地址
在GitHub的Releases中下载。
