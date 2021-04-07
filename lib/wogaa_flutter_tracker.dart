library wogaa_flutter_tracker;

import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart' as sp;

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

  static void start({String env: 'staging'}) {
    if (_tracker != null) {
      // do not init the tracker again
      print('do not init tracker again');
      return;
    }

    final emitter = sp.Emitter(
        uri: 'snowplow.dcube.cloud', requestSecurity: sp.RequestSecurity.https);

    final tracker = sp.Tracker(
        emitter: emitter,
        namespace: 'FlutterName Development',
        appId: 'sg.wogaa.trackerdemoapp',
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
        logLevel: sp.LogLevel.verbose,
        devicePlatform: sp.DevicePlatforms.mobile);
    _tracker = sp.SnowplowFlutterTracker();
    _tracker.initialize(tracker);

    print('Started (0.0.2)');
  }

  static void trackScreenView(String screenName) {
    if (_tracker == null) {
      print('Tracker is not yet started.');
      return;
    }

    sp.ScreenView screenView = sp.ScreenView(name: screenName);
    _tracker.track(screenView);
  }
}
