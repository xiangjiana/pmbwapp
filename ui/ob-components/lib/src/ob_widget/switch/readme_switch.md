| category   | subtitle   | type     | title    | cover |
| ---------- | ---------- | -------- | -------- | ----- |
| Components | switch按钮 | 数据展示 | ObSwitch | ---   |

## 一. API

#### ObSwitch

| 参数      | 说明     | 类型               | 默认值 | 版本 |
| --------- | -------- | ------------------ | ------ | ---- |
| value     | 默认状态 | bool               | ---    | ---  |
| onChanged | 点击回调 | ValueChanged<bool> | ---    | ---  |

## 二. 用法

#### 1.ObSwitch使用

```dart
SwitchWidget
(
value: true
,
onSwitchChanged: (

bool value
) {
print("onSwitchChanged--->$value");
},
)
```
