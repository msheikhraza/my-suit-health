import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStar extends StatelessWidget {
  double rating;
   RatingStar({required this.rating,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  RatingBar.builder(
      unratedColor: Colors.black38,
      itemSize: 20,
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      ignoreGestures: true,
      itemBuilder: (context, _) =>  Icon(
        Icons.star,
        color: Colors.amber.shade200,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
