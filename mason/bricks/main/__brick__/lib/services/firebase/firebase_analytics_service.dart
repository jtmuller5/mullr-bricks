// ignore_for_file: constant_identifier_names

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
class FirebaseAnalyticsService {
  FirebaseAnalytics analytics = FirebaseAnalytics();
}

enum AnalyticsEvent {
  start_questionnaire,
  finish_questionnaire,
  choose_care_navigator,
  book_care_navigator,
  book_care_navigator_later,
}

extension AnalyticsEventExtension on AnalyticsEvent {
  String get name => describeEnum(this);
}
