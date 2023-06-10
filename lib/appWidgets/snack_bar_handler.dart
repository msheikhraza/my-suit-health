import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SnackBarHandler {
  static error(context, title, text) {
    showTopSnackBar(
        Overlay.of(context),
        Material(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 6.34, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 5  horizontally
                      2, // Move to bottom 5 Vertically
                    ),
                  ),
                ],
                color: Colors.white),
            child: Row(
              children: [
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                      color: Color(0xffffdce4),
                    ),
                    height: 70,
                    width: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Image.asset(
                        "assets/icons/error.png",
                        height: 5,
                        width: 5,
                      ),
                    )),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      text,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Icon(
                    Icons.clear,
                    color: Colors.black,
                    size: 15,
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
        ));
  }

  static successSingle(context, title) {
    showTopSnackBar(
        Overlay.of(context),
        Material(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 6.34, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 5  horizontally
                      2, // Move to bottom 5 Vertically
                    ),
                  ),
                ],
                color: Colors.white),
            child: Row(
              children: [
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5)),
                      color: Color(0xffddf7e0),
                    ),
                    height: 70,
                    width: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Image.asset(
                        "assets/icons/success.png",
                        height: 10,
                        width: 10,
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Icon(
                    Icons.clear,
                    color: Colors.black,
                    size: 15,
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
        ));
  }
}
