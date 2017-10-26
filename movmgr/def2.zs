加载lib/doscmd4。
加载lib/gjk4。
加载lib/gjke4。
加载lib/redireconsoi4。
加载lib2/is_video.zs。
加载lib2/is_pic.zs。
加载mplayerutil.zs。

赋予~【主】以调用‘得环境变量函数’、MOVMGR_HOME。
如果不‘~’那么赋予~【主】以调用‘得环境变量函数’、HOME。
赋予配图缓存目录【主】以‘~’/.cache/movbrow_zs。
赋予配置目录【主】以‘~’/.config/movmgr_zs。
赋予目录配置文件【主】以‘配置目录’/config-dir.zs。
如果调用‘exist’、‘目录配置文件’否则
	调用‘echo’、先调用‘type’、‘应用目录’/config-dir.zs了、‘目录配置文件’。
赋予播放器配置文件【主】以‘配置目录’/config-player.zs。
如果调用‘exist’、‘播放器配置文件’否则
	调用‘echo’、先调用‘type’、‘应用目录’/config-player.zs了、‘播放器配置文件’。
赋予ex文件【主】以‘配置目录’/ex.zs。
如果调用‘exist’、‘ex文件’那么加载‘ex文件’。

定义播放由【主】以下代码
	别名命令以参数1。显示‘命令’换行。
	别名视频以参数2。
	（赋予tmp以/tmp/mov-s-ln-。
	运行“ln -sf "‘视频’" ‘tmp’”。
	别名视频以tmp。）
	别名ffplay特以‘视频’ffplay【主】。
	赋予命令以解释如果存在ffplay特那么‘ffplay特’	否则‘命令’。
	运行‘命令’&。
上代码。

定义配图给【主】以下代码
	如果不安装mplayer那么先
		我的调、‘参数2’、“无法安装mplayer”。
		退出。
	了。

	别名视频以参数1。
	别名标题以‘视频’标题。
	赋予图以‘配图缓存目录’/‘标题’.png。
	赋予果以用mplayer截图‘视频’、‘图’、‘配图缓存目录’/tmp。
	显示‘果’换行。
	如果‘果’那么先
		我的回、‘图’‘果’。
		赋予‘视频’配图【主】以‘图’。
	了。
上代码。

定义视频信息【主】以下代码
	别名号以参数1。
	别名视频以视频‘号’。
	别名配图以‘视频’配图。
	别名截图集以‘视频’截图集【主】。
	别名演员表以‘视频’演员表【主】。
	如果不存在截图集那么赋予截图集以。
	如果不存在演员表那么赋予演员表以。
	
	如果存在参数2那么
		定义返回以“解释下代码”‘参数2’“上代码”下代码
			、‘参数栈’。
		上代码。
	否则
		定义返回以下代码
			我的回、‘参数栈’。
		上代码。

	返回‘号’、‘‘视频’标题’、‘演员表’、‘截图集’、‘‘视频’zs’、‘视频’、‘配图’。
	如果‘截图集’那么先
		赋予搜以调用‘dir.begin’、‘截图集’。
		循环先
			赋予名以调用‘dir.next’、‘搜’。
			如果不‘名’那么跳出。
			赋予路径以‘截图集’/‘名’。
			如果‘路径’等于‘配图’那么再来。
			如果不是图片‘路径’那么再来。
			返回‘路径’。
		了。
		调用‘dir.end’、‘搜’。
	了。
上代码。

定义清除视频【主】以下代码
	别名号以参数1。
	定义清除文件以下代码
		别名名以参数1。
		如果不‘名’那么退出。
		运行“rm "‘名’"”。
	上代码。
	视频信息‘号’、下代码
		如果‘参数数目’等于1那么
			清除文件‘参数1’。
		否则
			迭代解释下代码
				清除文件‘参数1’。
			上代码、‘参数栈5’。
	上代码。
上代码。

定义搜关键字【主】以下代码
	别名字以参数1。
	别名+以参数2。
	定义查以下代码
		如果调用‘串位置’、‘参数1’、‘字’大于等于0那么遁出。
	上代码。
	赋予个以赋予号以0。
	循环先
		赋予号以算术‘号’+1。
		如果‘号’大于‘视频量’那么跳出。
		别名视频以视频‘号’。
		别名标题以‘视频’标题。
		别名配图以‘视频’配图。
		别名演员表以‘视频’演员表【主】。
		范围先
			查‘视频’。
			查‘标题’。
			查‘配图’。
			如果存在演员表那么查‘演员表’。
			再来。
		了。
		赋予个以算术‘个’+1。
		我的调、‘+’、‘标题’、‘视频’、‘配图’、‘号’。
	了。
	我的调、‘+’、、、e、‘个’。
上代码。

定义配置文件信息【主】以下代码
	我的回、
	先调用‘type’、‘目录配置文件’了、
	先调用‘type’、‘播放器配置文件’了。
上代码。

定义保存到配置文件【主】以下代码
	调用‘echo’、‘参数1’、‘目录配置文件’。
	调用‘echo’、‘参数2’、‘播放器配置文件’。
上代码。
