import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Helper/Colors.dart';
import '../complete booking/completeBooking.dart';
import '../homepage/homePage.dart';
import '../profile/userProfile.dart';

class Dashboard extends StatefulWidget {
  int? dIndex;
  Dashboard({super.key, this.dIndex});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Widget? _child;
  int selectedIndex = 0;
  int currentIndex = 99;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  void initState() {
    int? index=0;

    if (index ==0) {

      setState(() {
        selectedIndex =0;
      });
      _child =  selectedIndex== 0
          ? HomeScr():
      Container();
    } else {
      _child = Container();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return


      WillPopScope(
        onWillPop: () async {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Confirm Exit"),
                  content: Text("Are you sure you want to exit?"),
                  actions: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: AppColors.primary),
                      child: Text("YES"),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: AppColors.primary),
                      child: Text("NO"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              });
          return true;
        },
        child: SafeArea(
          child: Scaffold(
            key: _key,
            body: _child,
            bottomNavigationBar: FluidNavBar(
              icons: [
                FluidNavBarIcon(
                    icon: Icons.home,
                    // unselectedForegroundColor: Colors.grey,
                    selectedForegroundColor: Colors.white,
                    //  svgPath: "assets/home.svg",
                    backgroundColor: AppColors.primary,
                    unselectedForegroundColor: Colors.white,
                    //  selectedIndex == 1 ? colors.primary : colors.white10,
                    extras: {"label": "Home"}),
                FluidNavBarIcon(
                  // unselectedForegroundColor: Colors.grey,
                    selectedForegroundColor: Colors.white,
                    icon: Icons.screen_lock_landscape,
                    backgroundColor: AppColors.primary,
                    unselectedForegroundColor: Colors.white,
                    //  selectedIndex == 1 ? colors.primary : colors.white10,
                    extras: {"label": "Driver Details"}),
                FluidNavBarIcon(
                    icon: Icons.person,
                    // unselectedForegroundColor: Colors.grey,
                    selectedForegroundColor: Colors.white,
                    unselectedForegroundColor: Colors.white,
                    backgroundColor:
                    AppColors.primary,

                    extras: {"label": "My Profile"}),

              ],
              onChange: _handleNavigationChange,
              style: FluidNavBarStyle(
                barBackgroundColor: AppColors.primary,
              ),
              scaleFactor: 1.2,
              defaultIndex: selectedIndex,
              animationFactor: 0.5,
              itemBuilder: (icon, item) => Semantics(
                label: icon.extras!["label"],
                container: true,
                enabled: true,
                child: Stack(
                  children: [
                    item,
                    Container(
                        width: MediaQuery.of(context).size.width * 0.25 - 25,
                        margin: EdgeInsets.only(top: 40),
                        child: Center(
                            child: Text(
                              icon.extras!["label"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            )))
                  ],
                ),
              ),
            ),
          )),
      );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      selectedIndex = index;
      switch (index) {
        case 0:
          _child =HomeScr();
          break;
        case 1:
          _child =CompleateDelivScr();
          break;
        case 2:
          _child = UserProfile();
          break;

      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.bounceOut,
        switchOutCurve: Curves.bounceIn,
        duration: Duration(milliseconds: 600),
        child: _child,
      );
    });
  }
}


