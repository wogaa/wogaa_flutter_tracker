library wogaa_flutter_tracker;

import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart' as sp;
import 'package:package_info/package_info.dart';

/// WOGAA Tracker
class Tracker {
  // Singleton
  static final Tracker _instance = Tracker._internal();

  factory Tracker() {
    return _instance;
  }

  Tracker._internal();

  // Snowplow tracker
  static sp.SnowplowFlutterTracker _tracker;

  static void start({String env: 'staging'}) async {
    if (_tracker != null) {
      // do not init the tracker again
      print('do not init tracker again');
      return;
    }

    String collectorUrl = 'snowplow.dcube.cloud';
    sp.LogLevel logLevel = sp.LogLevel.verbose;

    if (env == 'production') {
      collectorUrl = 'snowplow-mobile.wogaa.sg';
      logLevel = sp.LogLevel.error;
    }

    final emitter = sp.Emitter(
        uri: collectorUrl, requestSecurity: sp.RequestSecurity.https);

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final tracker = sp.Tracker(
        emitter: emitter,
        namespace: 'Tracker ${env == 'production' ? 'Production' : 'Staging'}',
        appId: packageInfo.packageName,
        mobileContext: true,
        base64: false,
        applicationContext: true,
        sessionContext: true,
        screenContext: true,
        lifecycleEvents: true,
        foregroundTimeout: 600,
        backgroundTimeout: 300,
        installTracking: true,
        screenViewEvents: true,
        logLevel: logLevel,
        exceptionEvents: true,
        devicePlatform: sp.DevicePlatforms.mobile);
    _tracker = sp.SnowplowFlutterTracker();
    _tracker.initialize(tracker);

    print('Started (1.0.1)');
  }

  static void trackScreenView(String screenName) {
    if (_tracker == null) {
      print('Tracker is not yet started.');
      return;
    }

    sp.ScreenView screenView = sp.ScreenView(name: screenName);
    _tracker.track(screenView);
  }

  static void trackEvent(String category, String action, String label,
      String property, double value) {
    final structured = sp.Structured(
      category: category,
      action: action,
      label: label,
      property: property,
      value: value,
    );
    _tracker.track(structured);
  }
}
