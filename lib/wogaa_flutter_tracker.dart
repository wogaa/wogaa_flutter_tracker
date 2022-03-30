library wogaa_flutter_tracker;

import 'package:snowplow/snowplow.dart';

/// WOGAA Tracker
class Tracker {
  // Singleton
  static final Tracker _instance = Tracker._internal();

  factory Tracker() {
    return _instance;
  }

  Tracker._internal();

  static void start({String env: 'staging'}) async {
    String collectorUrl = 'snowplow.dcube.cloud';

    if (env == 'production') {
      collectorUrl = 'snowplow-mobile.wogaa.sg';
    }

    Snowplow().start(collectorUrl);
    print('Started (2.0.0)');
  }

  static void trackScreenView(String screenName) {
    Snowplow().logPageView(screenName);
  }

  static void trackEvent(String category, String action, String label,
      String property, double value) {
    Snowplow().trackEvent(
        category: category, action: action, label: label, property: property);
  }
}
