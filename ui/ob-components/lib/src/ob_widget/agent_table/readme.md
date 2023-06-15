# 代理表格

# AgentTable构造函数参数

| 参数 | 说明 | 类型 |默认值 | ---- | ---- |--- | | itemBuilder | 右边数据的生成方法 |Widget (BuildContext,int) | |
itemCount | 右边数据的数量(与左边数据数量要一致) |int| | tableWidth | 表格宽度 |double| | leftTitles | 左边数据(数量要与右边数据一致)
|List<Widgets>| | refreshController | 下拉刷新控制器 |RefreshController?| | enablePullDown | 是否可以下拉刷新
|bool| false | enablePullUp | 是否可以上拉加载更多 |bool| false | onRefresh | 下拉刷新处理函数 |Function()?| |
onLoading | 上拉加载处理函数 |Function()?| | titles | 表头 |List<Widget>?|
