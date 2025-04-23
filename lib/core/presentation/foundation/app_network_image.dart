import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pole/core/presentation/foundation/app_progress_indicator.dart';
import 'package:pole/core/presentation/theme/images.dart';

final class AppNetworkImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit? fit;

  const AppNetworkImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) => Image.network(
    url,
    width: width,
    height: height,
    fit: fit,
    loadingBuilder: (_, child, progress) => switch (progress) {
      null => child,
      _ => AppProgressIndicator(),
    },
    errorBuilder: (_, _, _) => SvgPicture.asset(
      AppImages.loadSvg('ic_placeholder').value,
      width: width / 1.5,
      height: height / 1.5,
    ),
  );
}