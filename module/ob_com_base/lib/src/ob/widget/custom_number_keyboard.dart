import 'dart:async';
import 'dart:math';
import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/gen/colors.gen.dart';
import 'package:ob_com_base/src/ob/widget/ob_image.dart';
import 'package:get/get.dart';

enum PadKeyInputKeyBoardType {
  inputNormalType,
  inputRandomType,
  inputDotType,
  inputFloatNumberPad,
  inputIntNumberPad,
  inputIDNumberPad
}

class CustomNumberKeyboard extends StatefulWidget {
  /// 普通输入类型
  static const CKTextInputType inputNormalType =
      CKTextInputType(name: 'CKCustomNumberKeyboard');

  /// 乱序输入类型
  static const CKTextInputType inputRandomType =
      CKTextInputType(name: 'CKCustomRandomNumberKeyboard');

  /// 普通输入浮点类型
  static const CKTextInputType inputDotType =
      CKTextInputType(name: 'CKCustomDotNumberKeyboard');

  /// Pad浮点类型
  static const CKTextInputType inputFloatNumberPad =
      CKTextInputType(name: 'CKCustomFloatNumberPad');

  /// Pad整数类型
  static const CKTextInputType inputIntNumberPad =
      CKTextInputType(name: 'CKCustomIntNumberPad');

  /// Pad身份证🆔类型
  static const CKTextInputType inputIDNumberPad =
      CKTextInputType(name: 'CKCustomIDNumberPad');

  static double getHeight(BuildContext ctx) {
    MediaQueryData mediaQuery = MediaQuery.of(ctx);
    double itemHeight = (((mediaQuery.size.width - 4 * 6) / 3) * 44 / 118);
    return itemHeight * 4 + 14 + 30 + 8 * 4 + mediaQuery.padding.bottom;
  }

  final PadKeyInputKeyBoardType inputKeyBoardType;
  final ValueChanged<String>? callback;
  final Color? backgroundColor;
  final KeyboardController? controller;
  final EdgeInsetsGeometry? padding;

  const CustomNumberKeyboard(
      {this.controller,
      this.inputKeyBoardType = PadKeyInputKeyBoardType.inputNormalType,
      this.callback,
      this.padding = const EdgeInsets.only(top: 14),
      this.backgroundColor = const Color(0xff131E26)});

  static register() {
    CoolKeyboard.addKeyboard(
      CustomNumberKeyboard.inputNormalType,
      KeyboardConfig(
        builder: (context, controller, params) {
          return CustomNumberKeyboard(
            inputKeyBoardType: PadKeyInputKeyBoardType.inputNormalType,
            controller: controller,
          );
        },
        getHeight: CustomNumberKeyboard.getHeight,
      ),
    );
    CoolKeyboard.addKeyboard(
      CustomNumberKeyboard.inputRandomType,
      KeyboardConfig(
        builder: (context, controller, params) {
          return CustomNumberKeyboard(
            inputKeyBoardType: PadKeyInputKeyBoardType.inputRandomType,
            controller: controller,
          );
        },
        getHeight: CustomNumberKeyboard.getHeight,
      ),
    );
    CoolKeyboard.addKeyboard(
      CustomNumberKeyboard.inputDotType,
      KeyboardConfig(
        builder: (context, controller, params) {
          return CustomNumberKeyboard(
            inputKeyBoardType: PadKeyInputKeyBoardType.inputDotType,
            controller: controller,
          );
        },
        getHeight: CustomNumberKeyboard.getHeight,
      ),
    );
    CoolKeyboard.addKeyboard(
      CustomNumberKeyboard.inputFloatNumberPad,
      KeyboardConfig(
        builder: (context, controller, params) {
          return CustomNumberKeyboard(
            inputKeyBoardType: PadKeyInputKeyBoardType.inputFloatNumberPad,
            controller: controller,
          );
        },
        getHeight: CustomNumberKeyboard.getHeight,
      ),
    );
    CoolKeyboard.addKeyboard(
      CustomNumberKeyboard.inputIntNumberPad,
      KeyboardConfig(
        builder: (context, controller, params) {
          return CustomNumberKeyboard(
            inputKeyBoardType: PadKeyInputKeyBoardType.inputIntNumberPad,
            controller: controller,
          );
        },
        getHeight: CustomNumberKeyboard.getHeight,
      ),
    );
    CoolKeyboard.addKeyboard(
      CustomNumberKeyboard.inputIDNumberPad,
      KeyboardConfig(
        builder: (context, controller, params) {
          return CustomNumberKeyboard(
            inputKeyBoardType: PadKeyInputKeyBoardType.inputIDNumberPad,
            controller: controller,
          );
        },
        getHeight: CustomNumberKeyboard.getHeight,
      ),
    );
  }

  @override
  _CustomNumberKeyboardState createState() => _CustomNumberKeyboardState();
}

class _CustomNumberKeyboardState extends State<CustomNumberKeyboard> {
  Timer? timer;

  var isDoneButtonDisabled = false;

  List<int> list = List.generate(10, (index) => index);

  @override
  void initState() {
    super.initState();

    if (widget.inputKeyBoardType == PadKeyInputKeyBoardType.inputRandomType) {
      list = shuffle(list);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.backgroundColor,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 23.0,
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {},
          child: _buildKeyBoard(context, type: widget.inputKeyBoardType),
        ),
      ),
    );
  }

  Widget _buildKeyBoard(
    BuildContext context, {
    required PadKeyInputKeyBoardType type,
  }) {
    switch (type) {
      case PadKeyInputKeyBoardType.inputFloatNumberPad:
      case PadKeyInputKeyBoardType.inputIntNumberPad:
      case PadKeyInputKeyBoardType.inputIDNumberPad:
        return buildNumberPad(context, type: type);
      case PadKeyInputKeyBoardType.inputDotType:
        return _buildNormalType(context, showDot: true);
      case PadKeyInputKeyBoardType.inputNormalType:
        return _buildNormalType(context, showDot: false);
      case PadKeyInputKeyBoardType.inputRandomType:
        return _buildNormalType(context, showDot: false);
      default:
        return _buildNormalType(context, showDot: false);
    }
  }

  Widget buildNumberPad(
    BuildContext context, {
    required PadKeyInputKeyBoardType type,
  }) {
    return NumberKeyboardPad(
      inputKeyBoardType: type,
      onDone: (text) => widget.controller?.sendAction(),
      onDelete: (text) => widget.controller?.deleteOne(),
      onDismiss: (text) => widget.controller?.doneAction(),
      onNumber: (text) => widget.controller?.addText(text),
      onDot: (text) => widget.controller?.addText(text),
      onX: (text) => widget.controller?.addText(text),
      isDoneButtonDisabled: isDoneButtonDisabled,
    );
  }

  Widget _buildNormalType(BuildContext context, {required bool showDot}) {
    return Container(
      padding: widget.padding,
      height: CustomNumberKeyboard.getHeight(context),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
      ),
      child: GridView.count(
          childAspectRatio: 118 / 44,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          padding: EdgeInsets.all(6),
          crossAxisCount: 3,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            buildButton('${list[1]}', callback: widget.callback),
            buildButton('${list[2]}', callback: widget.callback),
            buildButton('${list[3]}', callback: widget.callback),
            buildButton('${list[4]}', callback: widget.callback),
            buildButton('${list[5]}', callback: widget.callback),
            buildButton('${list[6]}', callback: widget.callback),
            buildButton('${list[7]}', callback: widget.callback),
            buildButton('${list[8]}', callback: widget.callback),
            buildButton('${list[9]}', callback: widget.callback),
            Offstage(
              offstage: !showDot,
              child:
                  buildButton('.', normalColor: Colors.transparent, value: "."),
            ),
            buildButton('${list[0]}', callback: widget.callback),
            buildButton(
              'delete',
              child: pkObImage(
                Assets.images.icon.keyboardDelete.path,
                width: 27,
                height: 27,
              ),
              normalColor: widget.backgroundColor ?? Colors.transparent,
              callback: (value) {
                widget.controller?.deleteOne.call();
                widget.callback?.call(value);
              },
            ),
          ]),
    );
  }

  int getRandomInt(int min, int max) {
    final _random = Random();
    return _random.nextInt((max - min).floor()) + min;
  }

  /// 打乱数组
  List<int> shuffle(List<int> arr) {
    List<int> newArr = <int>[];
    newArr.addAll(arr);
    for (var i = 1; i < newArr.length; i++) {
      var j = getRandomInt(0, i);
      var t = newArr[i];
      newArr[i] = newArr[j];
      newArr[j] = t;
    }
    return newArr;
  }

  Widget buildButton(
    String title, {
    Widget? child,
    ValueChanged<String>? callback,
    Color? normalColor,
    String? value,
  }) {
    return MaterialButton(
      onPressed: () => onPressedAction(callback, title, value),
      padding: EdgeInsets.zero,
      highlightColor: ColorName.colorMain,
      color: normalColor ?? Color(0xFF585F65),
      splashColor: ColorName.colorMain,
      focusColor: ColorName.colorMain,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      animationDuration: Duration(milliseconds: 50),
      elevation: 0,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onLongPressStart: (details) => startTimer(callback, title, value),
        onLongPressEnd: (details) => cancelTimer(),
        child: buildContent(child, title),
      ),
    );
  }

  Container buildContent(Widget? child, String title) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      width: double.infinity,
      height: double.infinity,
      child: child ??
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
    );
  }

  void cancelTimer() {
    this.timer?.cancel();
    this.timer = null;
  }

  void startTimer(ValueChanged<String>? callback, String title, String? value) {
    this.timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      onPressedAction(callback, title, value);
    });
  }

  void onPressedAction(
      ValueChanged<String>? callback, String title, String? value) {
    if (callback != null) {
      callback(title);
    } else {
      widget.controller?.addText(value ?? title);
    }
  }
}

class NumberKeyboardPad extends StatelessWidget {
  final PadKeyInputKeyBoardType inputKeyBoardType;
  final ValueChanged? onNumber;
  final ValueChanged? onDelete;
  final ValueChanged? onDone;
  final ValueChanged? onDismiss;
  final ValueChanged? onDot;
  final ValueChanged? onX;
  final bool isDoneButtonDisabled;

  NumberKeyboardPad({
    Key? key,
    required this.inputKeyBoardType,
    this.onNumber,
    this.onDelete,
    this.onDone,
    this.onDismiss,
    this.onDot,
    this.onX,
    this.isDoneButtonDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      height: CustomNumberKeyboard.getHeight(context),
      padding: EdgeInsets.all(6),
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        top: false,
        left: false,
        right: false,
        child: _keyboardContentWidget(context),
      ),
    ));
  }

  Widget _keyboardContentWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTextButton("1"),
                    SizedBox(width: 6),
                    _buildTextButton("2"),
                    SizedBox(width: 6),
                    _buildTextButton("3"),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTextButton("4"),
                    SizedBox(width: 6),
                    _buildTextButton("5"),
                    SizedBox(width: 6),
                    _buildTextButton("6"),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTextButton("7"),
                    SizedBox(width: 6),
                    _buildTextButton("8"),
                    SizedBox(width: 6),
                    _buildTextButton("9"),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                height: 48,
                child: _bottomKeyboardPad(inputKeyBoardType),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 6,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.17,
          height: (48 * 4) + (3 * 6),
          child: Container(
            child: _rightKeyboardPad(inputKeyBoardType),
          ),
        ),
      ],
    );
  }

  Widget _rightKeyboardPad(PadKeyInputKeyBoardType inputKeyBoardType) {
    return Column(
      children: [
        _buildDeleteButton("Delete"),
        SizedBox(height: 6),
        _buildDoneButton(
            'confirm'.tr.split(" ").join("\n"), isDoneButtonDisabled)
      ],
    );
  }

  Widget _bottomKeyboardPad(PadKeyInputKeyBoardType inputKeyBoardType) {
    if (inputKeyBoardType == PadKeyInputKeyBoardType.inputIntNumberPad) {
      return Row(
        children: [
          _buildTextButton("0", flex: 2),
          SizedBox(width: 6),
          _buildDismissButton("dismiss"),
        ],
      );
    }
    if (inputKeyBoardType == PadKeyInputKeyBoardType.inputIDNumberPad) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTextButton("X"),
          SizedBox(width: 6),
          _buildTextButton("0"),
          SizedBox(width: 6),
          _buildDismissButton("dismiss"),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTextButton("."),
        SizedBox(width: 6),
        _buildTextButton("0"),
        SizedBox(width: 6),
        _buildDismissButton("dismiss"),
      ],
    );
  }

  Widget _buildDismissButton(String value) {
    return Expanded(
      child: _fillColorContainer(
        MaterialButton(
          onPressed: () => onDismiss?.call(value),
          padding: EdgeInsets.zero,
          highlightColor: ColorName.colorMain,
          color: Color(0xFF585F65),
          splashColor: ColorName.colorMain,
          focusColor: ColorName.colorMain,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          animationDuration: Duration(milliseconds: 50),
          elevation: 0,
          child: Center(
            child: pkObImage(
              Assets.images.icon.keyboradDawnIcon.path,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextButton(String value, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: _fillColorContainer(
        MaterialButton(
          onPressed: () => onNumber?.call(value),
          padding: EdgeInsets.zero,
          highlightColor: ColorName.colorMain,
          color: Color(0xFF585F65),
          splashColor: ColorName.colorMain,
          focusColor: ColorName.colorMain,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          animationDuration: Duration(milliseconds: 50),
          elevation: 0,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onLongPressStart: (details) => continuousAddText(value, onNumber),
            onLongPressEnd: (details) => cancelTimer(),
            child: Center(
              child: Text(
                value,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _fillColorContainer(MaterialButton button, {Color? color}) {
    color ??= Color(0xFF585F65);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: button,
    );
  }

  Widget _fillDoneBgContainer(MaterialButton button) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: AssetImage(
            Assets.images.icon.keyboardDoneBg.path,
            package: BaseX.pkg,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: button,
    );
  }

  Widget _buildDoneButton(String value, bool isDoneButtonDisabled) {
    return Expanded(
      child: _fillDoneBgContainer(
        MaterialButton(
          onPressed: isDoneButtonDisabled ? null : () => onDone?.call(value),
          padding: EdgeInsets.zero,
          highlightColor: ColorName.colorMain,
          color: Colors.transparent,
          disabledColor: Colors.black26,
          disabledTextColor: Colors.white54,
          textColor: Colors.white,
          splashColor: ColorName.colorMain,
          focusColor: ColorName.colorMain,
          disabledElevation: 0,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          animationDuration: Duration(milliseconds: 50),
          child: Text(
            value,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton(String value) {
    return Expanded(
      child: _fillColorContainer(
        MaterialButton(
          onPressed: () => onDelete?.call(value),
          padding: EdgeInsets.zero,
          highlightColor: ColorName.colorMain,
          color: Color(0xFF585F65),
          splashColor: ColorName.colorMain,
          focusColor: ColorName.colorMain,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          animationDuration: Duration(milliseconds: 50),
          elevation: 0,
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onLongPressStart: (details) => continuousAddText(value, onDelete),
            onLongPressEnd: (details) => cancelTimer(),
            child: Center(
              child: pkObImage(
                Assets.images.icon.keyboardDelete.path,
                width: 27,
                height: 27,
              ),
            ),
          ),
        ),
      ),
    );
  }

  late Timer? timer;

  void cancelTimer() {
    this.timer?.cancel();
    this.timer = null;
  }

  void continuousAddText(String value, ValueChanged? onTapNumber) {
    this.timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      onTapNumber?.call(value);
    });
  }
}

extension on KeyboardController {
  /// 下一个
  sendAction() {
    CoolKeyboard.sendPerformAction(TextInputAction.send);
  }
}
