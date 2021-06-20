import 'package:flutter/material.dart';

/// Why We Do That ?!!!!.
// for some reason normal way that you define in onPressed or any something else not Worked perfectly

/// What is happened ?!!
// it navigates to the new screen but on this screen, some functions did not work perfectly

// but in this way, everything will work perfectly (;
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
