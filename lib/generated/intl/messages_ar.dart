// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "error_bad_request": MessageLookupByLibrary.simpleMessage("طلب غير صالح."),
    "error_bad_response": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ ما. حاول مرة أخرى.",
    ),
    "error_cancelled": MessageLookupByLibrary.simpleMessage(
      "تم إلغاء الطلب إلى الخادم.",
    ),
    "error_connection": MessageLookupByLibrary.simpleMessage(
      "خطأ في الاتصال. تحقق من اتصال الإنترنت.",
    ),
    "error_connection_timeout": MessageLookupByLibrary.simpleMessage(
      "انتهت مهلة الاتصال بالخادم.",
    ),
    "error_default": MessageLookupByLibrary.simpleMessage("حدث خطأ غير متوقع."),
    "error_forbidden": MessageLookupByLibrary.simpleMessage("تم رفض الوصول."),
    "error_not_found": MessageLookupByLibrary.simpleMessage(
      "المورد غير موجود.",
    ),
    "error_receive_timeout": MessageLookupByLibrary.simpleMessage(
      "انتهت مهلة استلام البيانات من الخادم.",
    ),
    "error_send_timeout": MessageLookupByLibrary.simpleMessage(
      "انتهت مهلة إرسال البيانات إلى الخادم.",
    ),
    "error_server": MessageLookupByLibrary.simpleMessage(
      "خطأ في الخادم الداخلي.",
    ),
    "error_unauthorized": MessageLookupByLibrary.simpleMessage(
      "دخول غير مصرح.",
    ),
    "error_unknown": MessageLookupByLibrary.simpleMessage(
      "فشل الاتصال بالخادم بسبب مشكلة في الإنترنت.",
    ),
    "error_unknown_occurred": MessageLookupByLibrary.simpleMessage(
      "حدث خطأ غير معروف.",
    ),
  };
}
