| category| subtitle| type | title | cover |
| --- | --- | --- | --- | --- |
| Components | 主題 | 数据展示  | SizeExtension | -- | 

## API

### SizeExtension

|  参数   | 说明  |  类型   | 默认值  |  版本 |
|  ----  | ----  |  ----  | ----  |  ----  |
|  w  | ScreenUtil.setWidth  |  double  | ----  |  ----  |
|  h  | ScreenUtil.setHeight  |  double  | ----  |  ----  |
|  r  | ScreenUtil.radius  |  double  | ----  |  ----  |
|  sp  | ScreenUtil.setSp  |  double  | ----  |  ----  |
|  sw  | 屏幕宽度的倍数  |  double  | ----  |  ----  |
|  sh  | 屏幕高度的倍数  |  double  | ----  |  ----  |

### 使用示例:

```
 SizedBox(
      height: 44.w,
      child: const Center(child: Text('今日')),
    )

```