library wogaa_flutter_tracker;

import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 2;

  /* Initialize it */
  SnowplowFlutterTracker _tracker;

  void start() {
    final emitter = Emitter(
        uri: 'snowplow.dcube.cloud', requestSecurity: RequestSecurity.https);

    final tracker = Tracker(
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
        logLevel: LogLevel.verbose,
        devicePlatform: DevicePlatforms.mobile);
    _tracker = SnowplowFlutterTracker();
    _tracker.initialize(tracker);

    print('This will be logged to the console in the browser');
  }

  void trackScreenView() {
    ScreenView screenView = ScreenView(name: 'view1');
    _tracker.track(screenView);
    print('track track');
  }
}
