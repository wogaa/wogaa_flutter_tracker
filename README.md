# WOGAA Flutter Tracker

![Build Status](https://bamboo.ship.gov.sg/plugins/servlet/wittified/build-status/AW-FLUTTER) [![release](https://img.shields.io/badge/release-v1.0.2-green.svg)](https://semver.org)

Flutter package library for WOGAA tracking

---

### Install

Add library as dependency in `pubspec.yaml`:

```
dependencies:
  wogaa_flutter_tracker:
    git:
      url: https://github.com/wogaa/wogaa_flutter_tracker.git
      ref: v1.0.2
```

Install it with flutter:

```sh
flutter pub get
```

---

### Usage

Now in your Dart code, you can use:

```
import 'package:wogaa_flutter_tracker/wogaa_flutter_tracker.dart';
```

Add the following codes when your application starts for the appropriate environment.

```
// to initialise the wogaa tracker
Tracker.start();

// to track screenview
Tracker.trackScreenView('ScreenName');
```

---

### Example Demo

In the `example` folder demonstrates how to implement the `wogaa_flutter_tracker` library, and to track screen views.

To run the demo, in the example folder directory:

```sh
flutter run lib/main.dart
```
