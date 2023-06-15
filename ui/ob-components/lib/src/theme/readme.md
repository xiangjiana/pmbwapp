| category| subtitle| type | title | cover |
| --- | --- | --- | --- | --- |
| Components | 主題 | 数据展示  | ObTheme | -- | 

## API

### ObTheme

|  参数   | 说明  |  类型   | 默认值  |  版本 |
|  ----  | ----  |  ----  | ----  |  ----  |
|  data  | 主題数据  |  ObThemeData  | ----  |  ----  |
|  child  | 子控件  |  Widget  | ----  |  ----  |

### TypographyTheme

|  参数   | 说明  |  类型   | 默认值  |  版本 |
|  ----  | ----  |  ----  | ----  |  ----  |
|  title  | 标题字体风格  |  TextStyle  | ----  |  ----  |
|  subtitle1  | 字幕字体风格1  |  TextStyle  | ----  |  ----  |
|  subtitle2  | 字幕字体风格2  |  TextStyle  | ----  |  ----  |
|  body1  | 主体内容字体风格1  |  TextStyle  | ----  |  ----  |
|  body2  | 主体内容字体风格2  |  TextStyle  | ----  |  ----  |
|  caption  | 说明字体风格  |  TextStyle  | ----  |  ----  |
|  overline  | 上划线字体风格  |  TextStyle  | ----  |  ----  |

### ObColorScheme

|  参数   | 说明  |  类型   | 默认值  |  版本 |
|  ----  | ----  |  ----  | ----  |  ----  |
|  primaryColor  | 主要颜色  |  Color  | ----  |  ----  |
|  secondaryColor  | 次要颜色  |  Color  | ----  |  ----  |
|  windowBackgroundColor  | 窗口背景颜色  |  Color  | ----  |  ----  |
|  primaryGradientColor  | 主控件的渐变色  |  List<Color>  | ----  |  ----  |
|  secondaryGradientColor  | 次控件的渐变色  |  List<Color>  | ----  |  ----  |
|  primaryTextColor  | 主文字颜色  |  Color  | ----  |  ----  |
|  secondaryTextColor  | 次文字颜色  |  Color  | ----  |  ----  |
|  tertiaryTextColor  | 第三颜色  |  Color  | ----  |  ----  |
|  dividerColor  | 分割线颜色  |  Color  | ----  |  ----  |
|  cardBackgroundColor  | 卡片背景颜色  |  Color  | ----  |  ----  |
|  gapColor  | 间隙颜色  |  Color  | ----  |  ----  |
|  edgeDividerColor  | 边缘分割线颜色  |  Color  | ----  |  ----  |

### 使用示例:

```
Container(
     width: 50,
     height: 50,
     decoration: ShapeDecoration(
       color: ObTheme.of(ctx)?.colorScheme.primaryColor,
       shape: const CircleBorder(),
     ),
     child: Text("你",style:
     ObTheme.of(ctx)?.typographyTheme.title,),
   ),

```