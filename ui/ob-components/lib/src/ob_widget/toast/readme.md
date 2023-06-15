| category| subtitle| type | title | cover |
| --- | --- | --- | --- | --- |
| Components | toast和loading | 数据展示  |ToastManager | -- | 

--

## API

### ToastManager.showText

|  参数   | 说明  |  类型   | 默认值  |  版本 |
|  ----  | ----  |  ----  | ----  |  ----  |
|  message  | 内容  |  String  | ----  |  ----  |

### ToastManager.showLoading

|  参数   | 说明  |  类型   | 默认值  |  版本 |
|  ----  | ----  |  ----  | ----  |  ----  |
|  status  | 状态文字  |  String  | ----  |  ----  |

### ToastManager.showSuccess

|  参数   | 说明  |  类型   | 默认值  |  版本 |
|  ----  | ----  |  ----  | ----  |  ----  |
|  message  | 状态文字  |  String  | 成功  |  ----  |

### ToastManager.showError

|  参数   | 说明  |  类型   | 默认值  |  版本 |
|  ----  | ----  |  ----  | ----  |  ----  |
|  message  | 状态文字  |  String  | 失败  |  ----  |

### 使用示例

```

void main() {
  runApp(StoryBoard());
}


 MaterialApp(
      title: 'Flutter obLoading',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: <NavigatorObserver>[
               ToastObserver(),
            ]
      home: MyHomePage(title: 'Flutter obLoading'),
      builder: ToastManager.init(),
    );


/// toast  2s后toast消失
 ToastManager.showText('取消',);


/// loading
 ToastManager.showLoading(
    status: 'loading...',
  );


///方式二
  final CancelFunc cancel =
              ToastManager.showLoading(status: '加载中');


///取消
    cancel.call();   

///显示成功的弹框  2s后弹框消失
ToastManager.showSuccess(message :'成功');


///显示错误的弹框  2s后弹框消失
ToastManager.showError(message :'失败');      

```