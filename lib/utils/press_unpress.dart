import 'package:flutter/material.dart';

class PressUnpress extends StatefulWidget {
  final double height;
  final double width;
  final Widget child;
  final String press;
  final Function onTap;
  final bool isImgFill;
  final EdgeInsetsGeometry? margin;


  PressUnpress({required this.height,
    required this.width,
    required this.child,
    required this.press,
    required this.onTap,
    required this.isImgFill,
    this.margin});

  @override
  State<PressUnpress> createState() => _PressUnpressState();
}

class _PressUnpressState extends State<PressUnpress> {

  bool isPress = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapCancel: (){
        setState(() {
          isPress = false;
        });
      },
      onTapDown: ( d){
        setState(() {
          isPress = true;
        });
      },
      onTapUp: (ui){
        Future.delayed(Duration(milliseconds: 100),(){
          setState(() {
            isPress = false;
          });
        });
      },
      onTap: (){widget.onTap();},
      child: Opacity(
        opacity: isPress ? 0.5 : 1.0,
        child: Container(
          height: widget.height,
          width: widget.width,
          margin: widget.margin,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/${widget.press}"),
                  fit: widget.isImgFill ? BoxFit.fill : BoxFit.scaleDown)
          ),
          child: widget.child,
        ),
      ),
    );
  }
}