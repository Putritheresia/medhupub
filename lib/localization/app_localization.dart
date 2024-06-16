import '../core/app_export.dart';
import 'en_us/en_us_translation.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_us': enUs};
}