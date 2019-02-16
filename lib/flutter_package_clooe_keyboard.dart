library flutter_package_clooe_keyboard;

import 'package:flutter/material.dart';

///  自定义 键盘 按钮
class CustomKbBtn extends StatefulWidget {
  ///  按钮显示的文本内容
  String text;

  //  每行显示几个
  double number;
  // btn color
  Color btncolor;
  // text color
  Color textColor=Color(0xff333333);
  CustomKbBtn({Key key, this.text, this.callback, this.number,this.btncolor=Colors.white,this.textColor})
      : super(key: key);

  ///  按钮 点击事件的回调函数
  final callback;

  @override
  State<StatefulWidget> createState() {
    return ButtonState();
  }
}

class ButtonState extends State<CustomKbBtn> {
  ///回调函数执行体
  var backMethod;

  void back() {
    widget.callback('$backMethod');
  }

  @override
  Widget build(BuildContext context) {
    /// 获取当前屏幕的总宽度，从而得出单个按钮的宽度
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var _screenWidth = mediaQuery.size.width;

    return Container(
        height: 50.0,
        width: _screenWidth / widget.number,
        color:widget.btncolor,
        child: OutlineButton(
          // 直角
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          // 边框颜色
          borderSide: BorderSide(color: Color(0x10333333)),

          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.textColor,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.center,
          ),
          // 按钮点击事件
          onPressed: back,
        ));
  }
}
