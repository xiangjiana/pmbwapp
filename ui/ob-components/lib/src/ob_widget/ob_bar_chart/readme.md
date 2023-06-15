# 柱形图

# ObBarChart构造函数参数

| 参数 | 说明 | 类型 |默认值 | ---- | ---- |--- | | chartColumnDatas | 数据 |List<ChartBarData> | | maxY |
y轴最大值 |double| | minY | y轴最小值 | double| |checkShowLine|根据y轴值判断是否需要显示横线|CheckShowLine?|
|lineWidth|横线宽度|double| |lineColor|横线颜色|Color|
|bottomTitleStringBuilder|底部文字转换函数|TitleStringBuilder|
|leftTitleStringBuilder|左边文字转换函数|TitleStringBuilder| |leftTextStyle|左边文字样式|TextStyle|
|bottomTextStyle|底部文字样式|TextStyle| |leftTextWidth|左边文字宽度|double |bottomTextHeight|底部文字高度|double
|onBarTap|柱子点击事件|OnBarTap| |labelText|左上角标签内容|String| |labelTextStyle|左上角标签样式|TextStyle|

# ChartBarData构造函数参数

| 参数 | 说明 | 类型 |默认值 | ---- | ---- |--- | |value|柱子y轴值|double| |color|柱子颜色|Color|
|marginLeft|柱子左边距|double?| |marginRight|柱子右边距|double?| |width|柱子宽度|double|
