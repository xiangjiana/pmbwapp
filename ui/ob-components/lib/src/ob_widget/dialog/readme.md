| category| subtitle| type | title | cover |
| --- | --- | --- | --- | --- |
| Components | 带返回键的标题栏 | 数据展示  | ObDialog | -- | 

通用弹框

## API

### ObDialog

|  参数   | 说明  |  类型   | 默认值  |  版本 |
|  ----  | ----  |  ----  | ----  |  ----  |
|  insetPadding  | 内边框间距  |  EdgeInsets  | ----  |  ----  |
|  shape  | 形状  |  ShapeBorder  | ----  |  ----  |
|  background  | 背景颜色  |  Color  | ----  |  ----  |
|  titleWidget  | 标题控件  |  Widget  | ----  |  ----  |
|  contentWidget  | 内容控件  |  Widget  | ----  |  ----  |
|  actionsWidget  | 按钮控件  |  Widget  | ----  |  ----  |

### ObDialog.alert

|  参数   | 说明  |  类型   | 默认值  |  版本 |
|  ----  | ----  |  ----  | ----  |  ----  |
|  title  | 标题  |  String  | ----  |  ----  |
|  confirmText  | 确认按钮文字  |  String  | 确定  |  ----  |
|  cancelText  |  取消按钮文字  |  String  | 取消  |  ----  |
|  background  | 背景颜色  |  Color  | ----  |  ----  |
|  onCancelListener  | 取消的监听  |  VoidCallback  | ----  |  ----  |
|  onConfirmListener  | 确定的监听  |  VoidCallback  | ----  |  ----  |
|  content  | 内容文字  |  String  | ----  |  ----  |

### ObDialog.alertSlot

|  参数   | 说明  |  类型   | 默认值  |  版本 |
|  ----  | ----  |  ----  | ----  |  ----  |
|  title  | 标题  |  String  | ----  |  ----  |
|  confirmText  | 确认按钮文字  |  String  | 确定  |  ----  |
|  cancelText  |  取消按钮文字  |  String  | 取消  |  ----  |
|  background  | 背景颜色  |  Color  | ----  |  ----  |
|  onCancelListener  | 取消的监听  |  VoidCallback  | ----  |  ----  |
|  onConfirmListener  | 确定的监听  |  VoidCallback  | ----  |  ----  |
|  content  | 内容部分的Widget  |  Widget  | ----  |  ----  |

### 示例:

```
  
 showDialog(
      context: ctx,
      builder: (BuildContext ctx) => ObDialog.alertSlot(
        title: '提示',
        content: Padding(
          padding: EdgeInsets.only(top: 16.w, bottom: 24.w),
          child: const Text('由于此平台的活动正在进行中，'
              '您若要转入金额，还需完成1518.54元的流水，您确定要继续转入吗？'),
        ),
        confirmText: '我知道了',
        onConfirmListener: () => Navigator.of(ctx).pop(),
      ),
    );



showDialog(
     context: ctx,
     builder: (BuildContext ctx) => ObDialog.alertSlot(
       title: '提示',
       content: Padding(
         padding: EdgeInsets.only(top: 16.w, bottom: 24.w),
         child: const Text('由于此平台的活动正在进行中，'
             '您若要转入金额，还需完成1518.54元的流水，您确定要继续转入吗？'),
       ),
       confirmText: '确定',
       cancelText: '取消',
       onConfirmListener: () => Navigator.of(ctx).pop(),
       onCancelListener: () => Navigator.of(ctx).pop(),
     ),
   );



```