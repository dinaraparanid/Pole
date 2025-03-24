import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pole/core/presentation/foundation/platform_call.dart';

PageRoute<T> AdaptivePageRoute<T>(Widget Function(BuildContext) builder) =>
  platformCall(
    android: MaterialPageRoute(builder: builder),
    iOS: CupertinoPageRoute(builder: builder),
    macOS: CupertinoPageRoute(builder: builder),
  );