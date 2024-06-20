import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

abstract class ThirdPartyKeyboardChecker {
  static final ThirdPartyKeyboardChecker _instance =
      ThirdPartyKeyboardCheckerImpl();

  static ThirdPartyKeyboardChecker get instance => _instance;

  Future<bool> check3rdKeyboard() {
    throw UnimplementedError('check3rdKeyboard() has not been implemented.');
  }
}

class ThirdPartyKeyboardCheckerImpl implements ThirdPartyKeyboardChecker {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('thirdparty_keyboard_checker');

  @override
  Future<bool> check3rdKeyboard() async {
    return await methodChannel.invokeMethod<bool>('check3rdKeyboard') ?? false;
  }
}
