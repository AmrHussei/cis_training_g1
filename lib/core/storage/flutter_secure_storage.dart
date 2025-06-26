import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageServices extends FlutterSecureStorage {
  static const String cookieToken = "cookie";
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  String? _cookie;
  Future<void> setCookie({required String? cookie}) async {
    return await storage.write(key: cookieToken, value: cookie);
  }

  Future<void> deleteCookie() async {
    return await storage.delete(key: cookieToken);
  }

  Future<String?> getCookie() async {
    _cookie = await storage.read(key: cookieToken);
    print('getCookie: $_cookie');
    return _cookie;
  }

  set cookie(String? cookie) {
    _cookie = cookie;
  }

  String? get cookie {
    return _cookie;
  }
}
