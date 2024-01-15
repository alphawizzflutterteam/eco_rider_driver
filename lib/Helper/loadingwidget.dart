import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Colors.dart';

Widget LoadingWidget(BuildContext context){

  return SpinKitThreeInOut(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index.isEven ?AppColors.whiteTemp : AppColors.primary,
        ),
      );
    },
    // color: Colors.white,
    size: 20.0,
  );
}

Widget LoadingWidget2(BuildContext context){

  return SpinKitPulsingGrid(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index.isEven ?AppColors.whiteTemp : AppColors.primary,
        ),
      );
    },
    // color: Colors.white,
    size: 60.0,
  );
}