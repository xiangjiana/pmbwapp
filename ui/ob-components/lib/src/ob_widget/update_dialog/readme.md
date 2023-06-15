| category| subtitle| type | title | cover |
| --- | --- | --- | --- | --- |
| Components | 升级对话框 | 数据展示  |UpdateDialog | -- | 

--

## API

### UpdateDialog

|  参数   | 说明  |  类型   | 默认值  |  版本 |
|  ----  | ----  |  ----  | ----  |  ----  |
|  content  | 内容的Widget  |  Widget  | ----  |  ----  |
|  version  | 版本的Widget  |  Widget  | ----  |  ----  |
|  controller  | 进度控制器  |  ProgressController?  | ----  |  ----  |
|  onStartUpdate  | 开始更新的回调  |  VoidCallback?  | ----  |  ----  |
|  onStartUpgrade  | 开始升级的回调  |  VoidCallback?  | ----  |  ----  |
|  onCloseDialog  | 关闭弹窗  |  VoidCallback?  | ----  |  ----  |

### 使用示例

```
 showDialog<void>(
            barrierColor: Colors.black.withOpacity(0.6),
            context: context,
            useSafeArea: false,
            builder: (BuildContext context) {
              return UpdateDialog(
                controller: controller,
                onCloseDialog: Navigator.of(context).pop,
                onStartUpdate: () async {
                  while (controller.value < 1) {
                    await Future<void>.delayed(const Duration(seconds: 1), () {
                      controller.value += 0.1;
                    });
                  }
                },
                onStartUpgrade: () {
                  ToastManager.showText('准备升级');
                },
                builder: (BuildContext context, double progress) {
                  final int roundProgress = (progress * 100).round();
                  if (roundProgress == 0) {
                    return const Text('立即更新');
                  } else if (roundProgress >= 100) {
                    return const Text('立即升级');
                  } else {
                    return Text('正在下载$roundProgress%');
                  }
                },
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      '本次更新',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 7),
                    Text(
                      '1、网络异常提示优化，修复已知问题;'
                      '\n'
                      '2、特效更新，即刻体验吧；'
                      '\n'
                      '3、增加更多新功能；'
                      '\n'
                      '4、解决播放视频卡顿问题，用户体验优化。',
                      style: TextStyle(
                          height: 1.71,
                          color: Colors.white60,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                version: Text('V2.3.6'),
              );
            },
          );


```