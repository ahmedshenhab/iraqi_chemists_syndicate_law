// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Connection error. Check your internet.`
  String get error_connection {
    return Intl.message(
      'Connection error. Check your internet.',
      name: 'error_connection',
      desc: '',
      args: [],
    );
  }

  /// `Connection timed out with server.`
  String get error_connection_timeout {
    return Intl.message(
      'Connection timed out with server.',
      name: 'error_connection_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Request to server was cancelled.`
  String get error_cancelled {
    return Intl.message(
      'Request to server was cancelled.',
      name: 'error_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout with server.`
  String get error_receive_timeout {
    return Intl.message(
      'Receive timeout with server.',
      name: 'error_receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Connection to server failed due to internet connection.`
  String get error_unknown {
    return Intl.message(
      'Connection to server failed due to internet connection.',
      name: 'error_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout with server.`
  String get error_send_timeout {
    return Intl.message(
      'Send timeout with server.',
      name: 'error_send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Try again.`
  String get error_bad_response {
    return Intl.message(
      'Something went wrong. Try again.',
      name: 'error_bad_response',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong.`
  String get error_default {
    return Intl.message(
      'Something went wrong.',
      name: 'error_default',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error occurred.`
  String get error_unknown_occurred {
    return Intl.message(
      'Unknown error occurred.',
      name: 'error_unknown_occurred',
      desc: '',
      args: [],
    );
  }

  /// `Bad request`
  String get error_bad_request {
    return Intl.message(
      'Bad request',
      name: 'error_bad_request',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized access`
  String get error_unauthorized {
    return Intl.message(
      'Unauthorized access',
      name: 'error_unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Forbidden`
  String get error_forbidden {
    return Intl.message(
      'Forbidden',
      name: 'error_forbidden',
      desc: '',
      args: [],
    );
  }

  /// `Resource not found`
  String get error_not_found {
    return Intl.message(
      'Resource not found',
      name: 'error_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error`
  String get error_server {
    return Intl.message(
      'Internal server error',
      name: 'error_server',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
