import '../../generated/l10n.dart';

class LocalizationService {
  LocalizationService._();
  
  static LocalizationService? _instance;
  static LocalizationService get instance {
    _instance ??= LocalizationService._();
    return _instance!;
  }
  
  S? _localizations;
  
  void updateLocalizations(S localizations) {
    _localizations = localizations;
  }
  
  
  S get strings {
    if (_localizations == null) {
      throw Exception('LocalizationService not initialized. Call updateLocalizations first.');
    }
    return _localizations!;
  }
  
  
  S? get stringsOrNull => _localizations;
  
  
  bool get isInitialized => _localizations != null;
  
  
 
}