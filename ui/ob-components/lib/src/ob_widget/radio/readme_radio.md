| category   | subtitle | type     | title   | cover |
| ---------- | -------- | -------- | ------- | ----- |
| Components | Radio    | 数据展示 | ObRadio | ---   |

## 一. API

```
ObRadio
```

| 参数     | 说明         | 类型                 | 默认值 | 版本 |
| -------- | ------------ | -------------------- | ------ | ---- |
| value    | 默认选中状态 | List<ChartDataColor> | false  | ---  |
| onChange | 点击回调     | ValueChanged<bool>   | ---    | ---  |

## 二. 用法

#### 1.ObRadio使用

```dart
RadioDotWidget
(
value: false
,
size: 200
,
radioColor: Colors.red,radioColorOn: Colors.green,onRadioChangeListener: (

bool sel
) {
print("onRadioChangeListener---->$sel");
},
)
```
