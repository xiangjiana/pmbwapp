| category   | subtitle | type     | title | cover |
| ---------- | -------- | -------- | ----- | ----- |
| Components | 选择器   | 数据展示 | ---   | ---   |

## 一. showAddressPicker（地址选择器）

### 1. API

| 参数    | 说明 | 类型         | 默认值 | 版本 |
| ------- | ---- | ------------ | ------ | ---- |
| context |      | BuildContext |        |      |

### 2. 用法

* 代码使用

  ~~~dart
  SecondaryButton(
            block: true,
            child: const Text('地址选择器'),
            onPressed: () async {
              final AddressResult? result = await Get.addressPicker(context: ctx);
              if (result != null) {
                BotToast.showText(
                    text:
                    result.provinceName + result.cityName + result.townName);
              }
            },
          )
  ~~~

## 二. showObDatePicker（时间选择器）

### 1. API

| 参数            | 说明         | 类型         | 默认值 | 版本 |
| --------------- | ------------ | ------------ | ------ | ---- |
| context         |              | BuildContext |        |      |
| initialDateTime | 初始时间     | DateTime     |        |      |
| minimumDate     | 最小限制时间 | DateTime     |        |      |
| maximumDate     | 最大限制时间 | DateTime     |        |      |

### 2. 用法

* 代码使用

  ~~~dart
  SecondaryButton(
            block: true,
            child: const Text('时间选择器'),
            onPressed: () async {
              final DateTime? result = await Get.datePicker(
                  context: ctx,
                initialDateTime: now,
                minimumDate: now.subtract(const Duration(days: 90)),
                maximumDate: now.add(const Duration(days: 360)),
              );
              if (result != null) {
                BotToast.showText(
                    text: result.toString());
              }
            },
          ) 
  ~~~

## 三. DateRangePicker（时间范围选择器）

### 1. API

| 参数                 | 说明         | 类型                    | 默认值 | 版本 |
| -------------------- | ------------ | ----------------------- | ------ | ---- |
| initialStartDateTime | 开始时间     |                         |        |      |
| initialEndDateTime   | 结束时间     |                         |        |      |
| minimumDate          | 最小限制时间 | DateTime                |        |      |
| maximumDate          | 最大限制时间 | DateTime                |        |      |
| onChangeListener     | 改变监听     | ValueChanged<TimeRange> |        |      |

### DateRangePickerController控制器

|       | 说明         | 类型 | 默认值 | 版本 |
| ----- | ------------ | ---- | ------ | ---- |
| reset | 重置日期方法 |      |        |      |

### 2. 用法

* 代码使用

  ~~~dart
  DateRangePicker(
              initialStartDateTime: now.subtract(const Duration(days: 30)),
              initialEndDateTime: now.add(const Duration(days: 10)),
              minimumDate: now.subtract(const Duration(days: 90)),
              maximumDate: now.add(const Duration(days: 15)),
              onChangeListener: (TimeRange timeRange) {
                print(timeRange.toString());
              },
            )
  ~~~

## 四. showPicker（自定义内容选择器,返回index）

### 1. API

| 参数     | 说明       | 类型         | 默认值 | 版本 |
| -------- | ---------- | ------------ | ------ | ---- |
| context  |            | BuildContext |        |      |
| children | 自定义内容 | List<Widget> |        |      |

### 2. 用法

* 代码使用

  ~~~dart
  SecondaryButton(
            block: true,
            child: const Text('选择器,返回index'),
            onPressed: () async {
              final int? result = await Get.picker(
                  context: ctx, children: <Widget>[
                Center(
                  child: Text(
                    '男',
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    '女',
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                ),
              ]);
              if (result != null) {
                BotToast.showText(
                    text: result.toString());
              }
            },
          )
  ~~~

