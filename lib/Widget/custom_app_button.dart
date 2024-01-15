import 'package:flutter/cupertino.dart';

import '../Helper/Colors.dart';

class CustomButton extends StatefulWidget {
  String? textt;

  CustomButton({Key? key, this.textt}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.3,
      decoration: BoxDecoration(

          // gradient: LinearGradient(
          //   colors: [AppColors.primary,],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
          color:AppColors.primary,
          borderRadius: BorderRadius.circular(12
              )),
      child: Center(
        child: Text(
          '${widget.textt.toString()}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.whiteTemp,fontSize: 13),
        ),
      ),
    );
  }
}
