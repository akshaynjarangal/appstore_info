import 'appstore_info_platform_interface.dart';

/// A class that provides methods to interact with the App Store.
class AppstoreInfo {
  /// Presents the App Store page for the specified app ID.
  ///
  /// Returns a [Future] that completes with a [bool] value indicating whether the operation was successful.
  /// The [appID] parameter is required and specifies the ID of the app to be displayed in the App Store.
  Future<bool?> presentAppStore({required String appID}) {
    return AppstoreInfoPlatform.instance.presentAppStore(appID: appID);
  }
}
