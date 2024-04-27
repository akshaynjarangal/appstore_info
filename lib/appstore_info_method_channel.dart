import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'appstore_info_platform_interface.dart';

/// An implementation of [AppstoreInfoPlatform] that uses method channels.
class MethodChannelAppstoreInfo extends AppstoreInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('appstore_info');

  @override
  Future<bool?> presentAppStore({required String appID}) async {
    try {
      final isPresented = await methodChannel.invokeMethod<bool>('presentAppStore',{
      'appID': appID,});
      return isPresented;
    }
    on PlatformException catch (e) {
      log('Error in presentAppStore: $e');
      return false;
    } catch (e) {
      log('Error in presentAppStore: $e');
      return false;
    }
    
  }
}
