| category   | subtitle | type     | title         | cover |
| ---------- | -------- | -------- | ------------- | ----- |
| Components | 底部弹框 | 数据展示 | ObActionSheet | ---   |

## 一. API

## ObActionSheet

| 参数                   | 说明         | 类型         | 默认值 | 版本 |
| ---------------------- | ------------ | ------------ | ------ | ---- |
| title                  | 标题         | Widget       | ---    | ---  |
| actions                | 显示item     | List<Widget> | ---    | ---  |
| showCancelButton       | 显示取消按钮 | bool         | true   | ---  |
| onCancelButtonListener | 点击取消回调 | VoidCallback | ---    | ---  |

## 二. 用法

#### 1.ObActionSheet使用

```dart
Get.bottomSheet(CustomBottomSheet
(
showCancelButton: true
,
title: const BottomActionSheetTitle()
,
onCancelButtonListener: (){
print("--->cancel");
},
actions: [
BottomActionSheetAction
(
child: Text
("拍照1
"
)
,
onPressed: (){
print("--->action1");
},
)
,
BottomActionSheetAction
(
child: Text
("从相册选取2
"
)
,
onPressed: (){
print("--->action2");
},
)
,
BottomActionSheetAction
(
child: Text
("action3
"
)
,
onPressed: (){
print("--->action3");
},
)
,
BottomActionSheetAction
(
child: Text
("action4
"
)
,
onPressed: (){
print("--->action4");
},
)
,

]
,

)
);
```
