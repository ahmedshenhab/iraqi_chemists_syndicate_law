import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void x() {
  SecureStorage;
}

class SecureStorage {
  // Private constructor to prevent multiple instances
  SecureStorage._privateConstructor();

  // Singleton instance
  static final SecureStorage instance = SecureStorage._privateConstructor();

  // Create a secure storage instance
  final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions:
        _getAndroidOptions(), // Use EncryptedSharedPreferences for Android
    iOptions: _getIOSOptions(), // Use Keychain options for iOS
  );

  // Android options (EncryptedSharedPreferences enabled)
  static AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  // iOS options (Uses first_unlock for better security)
  static IOSOptions _getIOSOptions() =>
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  /// Write data securely
  Future<void> write(String key, String value) {
    return _storage.write(key: key, value: value);
  }

  /// Read data securely
  Future<String?> read(String key) {
    return _storage.read(key: key);
  }

  /// Read all stored data
  Future<Map<String, String>> readAll() {
    return _storage.readAll();
  }

  /// Delete a specific key
  Future<void> delete(String key) {
    return _storage.delete(key: key);
  }

  /// Delete all stored data
  Future<void> deleteAll() {
    return _storage.deleteAll();
  }
}
