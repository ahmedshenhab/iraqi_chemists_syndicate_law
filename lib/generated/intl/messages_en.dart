// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "error_bad_request": MessageLookupByLibrary.simpleMessage("Bad request"),
    "error_bad_response": MessageLookupByLibrary.simpleMessage(
      "Something went wrong. Try again.",
    ),
    "error_cancelled": MessageLookupByLibrary.simpleMessage(
      "Request to server was cancelled.",
    ),
    "error_connection": MessageLookupByLibrary.simpleMessage(
      "Connection error. Check your internet.",
    ),
    "error_connection_timeout": MessageLookupByLibrary.simpleMessage(
      "Connection timed out with server.",
    ),
    "error_default": MessageLookupByLibrary.simpleMessage(
      "Something went wrong.",
    ),
    "error_forbidden": MessageLookupByLibrary.simpleMessage("Forbidden"),
    "error_not_found": MessageLookupByLibrary.simpleMessage(
      "Resource not found",
    ),
    "error_receive_timeout": MessageLookupByLibrary.simpleMessage(
      "Receive timeout with server.",
    ),
    "error_send_timeout": MessageLookupByLibrary.simpleMessage(
      "Send timeout with server.",
    ),
    "error_server": MessageLookupByLibrary.simpleMessage(
      "Internal server error",
    ),
    "error_unauthorized": MessageLookupByLibrary.simpleMessage(
      "Unauthorized access",
    ),
    "error_unknown": MessageLookupByLibrary.simpleMessage(
      "Connection to server failed due to internet connection.",
    ),
    "error_unknown_occurred": MessageLookupByLibrary.simpleMessage(
      "Unknown error occurred.",
    ),
  };
}
