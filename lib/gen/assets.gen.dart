/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/alaim.png
  AssetGenImage get alaim => const AssetGenImage('assets/images/alaim.png');

  /// File path: assets/images/code_phone.png
  AssetGenImage get codePhone =>
      const AssetGenImage('assets/images/code_phone.png');

  /// File path: assets/images/department.png
  AssetGenImage get department =>
      const AssetGenImage('assets/images/department.png');

  /// File path: assets/images/favorite.png
  AssetGenImage get favorite =>
      const AssetGenImage('assets/images/favorite.png');

  /// File path: assets/images/green.png
  AssetGenImage get green => const AssetGenImage('assets/images/green.png');

  /// File path: assets/images/home.png
  AssetGenImage get home => const AssetGenImage('assets/images/home.png');

  /// File path: assets/images/icon_Unlock.png
  AssetGenImage get iconUnlock =>
      const AssetGenImage('assets/images/icon_Unlock.png');

  /// File path: assets/images/icon_User.png
  AssetGenImage get iconUser =>
      const AssetGenImage('assets/images/icon_User.png');

  /// File path: assets/images/icon_add.png
  AssetGenImage get iconAdd =>
      const AssetGenImage('assets/images/icon_add.png');

  /// File path: assets/images/icon_phone.png
  AssetGenImage get iconPhone =>
      const AssetGenImage('assets/images/icon_phone.png');

  /// File path: assets/images/icon_report.png
  AssetGenImage get iconReport =>
      const AssetGenImage('assets/images/icon_report.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo_app.png
  AssetGenImage get logoApp =>
      const AssetGenImage('assets/images/logo_app.png');

  /// File path: assets/images/logot.png
  AssetGenImage get logot => const AssetGenImage('assets/images/logot.png');

  /// File path: assets/images/notification.png
  AssetGenImage get notification =>
      const AssetGenImage('assets/images/notification.png');

  /// File path: assets/images/order.png
  AssetGenImage get order => const AssetGenImage('assets/images/order.png');

  /// File path: assets/images/product.png
  AssetGenImage get product => const AssetGenImage('assets/images/product.png');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/sala.png
  AssetGenImage get sala => const AssetGenImage('assets/images/sala.png');

  /// File path: assets/images/search_icon.png
  AssetGenImage get searchIcon =>
      const AssetGenImage('assets/images/search_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        alaim,
        codePhone,
        department,
        favorite,
        green,
        home,
        iconUnlock,
        iconUser,
        iconAdd,
        iconPhone,
        iconReport,
        logo,
        logoApp,
        logot,
        notification,
        order,
        product,
        profile,
        sala,
        searchIcon
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
