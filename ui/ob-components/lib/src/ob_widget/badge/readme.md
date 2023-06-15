| category| subtitle| type | title | cover |
| --- | --- | --- | --- | --- |
| Components | 带小圆点的控件 | 数据展示  |Badge | -- | 

通用带标签的组件

## API

### Badge

|  参数   | 说明  |  类型   | 默认值  |  版本 |
|  ----  | ----  |  ----  | ----  |  ----  |
| child  | 子控件 | Widget  | -- | -- | 
|  showZero  | 是否显示小标点0  |  bool  | false  |  ----  |
|  dot  | ----  |  bool  | false |  ----  |
|  overflowCount  | 超过的阈值  |  num  | 99  |  ----  |
|  count  | 小标点的数量  |  num  | ----  |  ----  |
|  color  | 小标点的颜色背景  |  Color  | Color(0xffff4d4f) |  ----  |
|  countConstraints  | 计数约束  |  BoxConstraints  | BoxConstraints(minWidth: 20, maxHeight: 20, minHeight: 20)  |  ----  |
|  dotConstraints  | 点约束  |  BoxConstraints  | BoxConstraints.tightFor(width: 6, height: 6)  |  ----  |
|  style  | 文字风格  |  TextStyle  | TextStyle(fontSize: 14, color: Colors.white)  |  ----  |
