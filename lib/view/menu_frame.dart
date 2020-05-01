import 'package:flutter/material.dart';
import 'package:gsfit/view/appointments.dart';
import 'package:gsfit/view/new_client.dart';
import 'package:gsfit/view/menu_screen.dart';
import 'adoption_screen.dart';

class MenuFrame extends StatefulWidget {
  @override
  _MenuFrameState createState() => _MenuFrameState();
}

class _MenuFrameState extends State<MenuFrame>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> scaleAnimation, smallerScaleAnimation;
  Duration duration = Duration(milliseconds: 200);
  bool menuOpen = false;
  List<Animation> scaleAnimations;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: duration);
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.7).animate(_animationController);

    smallerScaleAnimation =
        Tween<double>(begin: 1.0, end: 0.6).animate(_animationController);

    scaleAnimations = [
      Tween<double>(begin: 1.0, end: 0.7).animate(_animationController),
      Tween<double>(begin: 1.0, end: 0.6).animate(_animationController),
      Tween<double>(begin: 1.0, end: 0.5).animate(_animationController),
      Tween<double>(begin: 1.0, end: 0.4).animate(_animationController),
    ];
    screenSnapShopt = screens.values.toList();
  }



  Map<int, Widget> screens = {
    0: AdoptionScreen(
      menuCallback: () {},
    ),
    1: NewClient(
      menuCallback: () {},
    ),
    2: Appointment(
      menuCallback: () {},
    ),
  };

  List<Widget> screenSnapShopt;

  List<Widget> finalStack() {
    List<Widget> stackToReturn = [];
    stackToReturn.add(MenuScreen(
      menuCallback: (selectedIndex) {
        setState(() {
          screenSnapShopt = screens.values.toList();
          final selectedWidget = screenSnapShopt.removeAt(selectedIndex);
          screenSnapShopt.insert(0, selectedWidget);
        });
      },
    ));

    screenSnapShopt
        .asMap()
        .entries
        .map((screenEntry) => buildScreenStack(screenEntry.key))
        .toList()
        .reversed
      ..forEach((screen) {
        stackToReturn.add(screen);
      });
    return stackToReturn;
  }

  Widget buildScreenStack(int position) {
    final deviceWith = MediaQuery.of(context).size.width;
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: menuOpen ? deviceWith * 0.55 - (position * 20) : 0.0,
      right: menuOpen ? deviceWith * -0.45 + (position * 30): 0.0,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: GestureDetector(
          onTap: () {
            if (menuOpen) {
              setState(() {
                menuOpen = false;
                _animationController.reverse();
              });
            }
            else {
              setState(() {
                menuOpen = true;
                _animationController.forward();
              });
            }
          },
          child: AbsorbPointer(
            absorbing: menuOpen,
            child: Stack(
              children: <Widget>[
                Material(
                    animationDuration: duration,
                    borderRadius: BorderRadius.circular(menuOpen ? 40.0 : 0.0),
                    child: screenSnapShopt[position]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: finalStack(),
    );
  }
}
