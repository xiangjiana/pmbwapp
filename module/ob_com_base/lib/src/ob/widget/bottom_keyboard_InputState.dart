//继承 WidgetsBindingObserver 类
import 'package:flutter/widgets.dart';
abstract class BottomKeyboardInputState extends State with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    //初始化
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        if(MediaQuery.of(context).viewInsets.bottom==0){
          //关闭键盘
          closeKeyBoard();

        }else{
          //显示键盘
          openKeyBoard();
        }

      });
    });
  }

  @override
  void dispose() {
    //销毁
    WidgetsBinding.instance?.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
   openKeyBoard();
   closeKeyBoard();

}