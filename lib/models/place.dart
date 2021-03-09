import 'dart:io';

import 'package:flutter/foundation.dart';

class Location {
  final double latitude;
  final double logitude;
  final double address;

  Location({
    @required this.latitude,
    @required this.logitude,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final Location location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}