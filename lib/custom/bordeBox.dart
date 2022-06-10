
import 'package:flutter/cupertino.dart';
import 'package:realestateapp/util/constants.dart';

class BorderBox extends StatelessWidget {

  final Widget child;
  final EdgeInsets padding;
  final double height,width;

  const BorderBox({super.key,required this.padding, required this.height, required this.width, required this.child});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:BoxDecoration(
        color: COLOR_WHITE,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color:COLOR_GREY.withAlpha(400),width: 2)
      ) ,
      padding:padding ,
      child: Center(
        child: child,
      ),
    );
  }
}
