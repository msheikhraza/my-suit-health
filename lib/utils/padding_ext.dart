import 'package:flutter/material.dart';

extension EmptyPadding on num{

  SizedBox get sizeBoxHeight=> SizedBox(height: toDouble(),);
  SizedBox get sizeBoxWidth=> SizedBox(width: toDouble(),);
    
}