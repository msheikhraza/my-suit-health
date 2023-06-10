

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:razasheikhtest/app_constants/app_colors.dart';
import 'package:razasheikhtest/modules/products/view/all_products.dart';
import 'package:razasheikhtest/utils/app_images.dart';

class BottomNavigationHomeView extends StatefulWidget {
  const BottomNavigationHomeView({super.key});

  @override
  State<BottomNavigationHomeView> createState() =>
      _BottomNavigationHomeViewState();
}

class _BottomNavigationHomeViewState extends State<BottomNavigationHomeView> {
  int currentNav = 0;

  static final List<Widget> _pages = <Widget>[
    const AllProducts(),
    const Center(child: Text("Work In Progress")),
    const Center(child: Text("Work In Progress")),
    const Center(child: Text("Work In Progress")),
  ];

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Health Suit'),
            content: const Text('Aye You Sure, You Want to exit?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor),
                //return false when click on "NO"
                child: const Text('No'),
              ),
              ElevatedButton(
               onPressed: (){
                 exit(0);
               },
                style: ElevatedButton.styleFrom(
                  backgroundColor:  AppColors.primaryColor,
                ),
                //return true when click on "Yes"
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        body: Center(
          child: _pages.elementAt(currentNav), //New
        ),
        bottomNavigationBar: SizedBox(
          height: 70,
          child: Card(
            elevation: 5.0,
              margin: const EdgeInsets.symmetric(horizontal: 0),

              shape: const RoundedRectangleBorder(   borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0), ),),
            child: BottomNavigationBar(
              selectedFontSize: 8,
              unselectedFontSize: 7,
              backgroundColor: Colors.transparent,
              selectedItemColor:
                 AppColors.primaryColor,
              unselectedItemColor:
                  Colors.grey,
              showUnselectedLabels: true,
              showSelectedLabels: false,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentNav,
              elevation: 0.0,
              items: [
                BottomNavigationBarItem(
                    label: "",
                    icon: Image.asset(
                      AppImages.homeIcon,
                      height: 21,
                      width: 21,
                      fit: BoxFit.contain,
                      color: currentNav == 0
                          ? AppColors.primaryColor
                          : Colors.grey,
                    )),

                BottomNavigationBarItem(
                    label: "",
                    icon: Image.asset(
                      AppImages.cartIcon,
                      height: 21,
                      width: 21,
                      fit: BoxFit.contain,
                      color: currentNav == 1
                          ? AppColors.primaryColor
                          : Colors.grey,
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: Image.asset(
                      AppImages.likeIcon,
                      height: 21,
                      width: 21,
                      fit: BoxFit.contain,
                      color: currentNav == 2
                          ? AppColors.primaryColor
                          : Colors.grey,
                    )),
                BottomNavigationBarItem(
                    label: "",
                    icon: Image.asset(
                      AppImages.userIcon,
                      height: 21,
                      width: 21,
                      fit: BoxFit.contain,
                      color: currentNav == 3
                          ? AppColors.primaryColor
                          : Colors.grey,
                    )),
              ],
              onTap: (index) {
                setState(() {
                  currentNav = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
