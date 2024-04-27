import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appstore_info/appstore_info_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAppstoreInfo platform = MethodChannelAppstoreInfo();
  const MethodChannel channel = MethodChannel('appstore_info');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return true;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('presentAppStore', () async {
    expect(await platform.presentAppStore(appID: '389801252'), true);
  });
}
