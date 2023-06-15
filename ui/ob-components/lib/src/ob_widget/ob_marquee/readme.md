# 跑马灯

# ObMarquee构造函数参数

| 参数 | 说明 | 类型 |默认值 | ---- | ---- |--- | | texts | 数据 |List<ObMarqueeText> | | onIndexChange |
下标改变回调(在下一条滚动到一半的时候调用) |Function(int)| | indexChangePosition | 从什么位置判断进入了下一条
|IndexChangePosition|IndexChangePosition.center | onTextClick | 文本点击事件 | Function(int)|
|duration|滚动持续时间|Duration|

# ObMarqueeText构造函数参数

| 参数 | 说明 | 类型 |默认值 | ---- | ---- |--- | |content|文本内容|String| |leftPadding|左边距|double?|
|rightPadding|右边距|double?| |textStyle|文本样式|TextStyle|
