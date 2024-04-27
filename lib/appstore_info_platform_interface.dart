import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'appstore_info_method_channel.dart';

abstract class AppstoreInfoPlatform extends PlatformInterface {
  /// Constructs a AppstoreInfoPlatform.
  AppstoreInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppstoreInfoPlatform _instance = MethodChannelAppstoreInfo();

  /// The default instance of [AppstoreInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelAppstoreInfo].
  static AppstoreInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AppstoreInfoPlatform] when
  /// they register themselves.
  static set instance(AppstoreInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> presentAppStore({required String appID});
}
