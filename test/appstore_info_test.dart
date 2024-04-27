import 'package:flutter_test/flutter_test.dart';
import 'package:appstore_info/appstore_info.dart';
import 'package:appstore_info/appstore_info_platform_interface.dart';
import 'package:appstore_info/appstore_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppstoreInfoPlatform
    with MockPlatformInterfaceMixin
    implements AppstoreInfoPlatform {
  @override
  Future<bool?> presentAppStore({required String appID}) {
    return Future.value(true);
  }
}

void main() {
  final AppstoreInfoPlatform initialPlatform = AppstoreInfoPlatform.instance;

  test('$MethodChannelAppstoreInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppstoreInfo>());
  });

  test('presentAppStore', () async {
    AppstoreInfo appstoreInfoPlugin = AppstoreInfo();
    MockAppstoreInfoPlatform fakePlatform = MockAppstoreInfoPlatform();
    AppstoreInfoPlatform.instance = fakePlatform;

    expect(await appstoreInfoPlugin.presentAppStore(appID: '389801252'), true);
  });
}
