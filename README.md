# WOGAA Flutter Tracker
![Build Status](https://bamboo.ship.gov.sg/plugins/servlet/wittified/build-status/AW-FLUTTER) [![release](https://img.shields.io/badge/release-v0.0.3-green.svg)](https://semver.org)

Flutter package library for WOGAA tracking

---

### Install

Add library as dependency in `pubspec.yaml`:
```
dependencies:
  wogaa_flutter_tracker:
    git:
      url: https://bitbucket.ship.gov.sg/scm/aw/wogaa_flutter_tracker.git
      ref: v0.0.2
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

---

### Release (For library admin maintainer)

prerequisite:
- commitizen setup in your local
- git-flow installed
- standard-version installed

To prepare for a release:
1. please commit all the changes first, (with commitizen).
2. make sure you are in the `develop` branch
3. start a git flow release with the new version number e.g. v0.0.0:

```sh
git flow release start v0.0.0
```

In this new version release branch:
1. Update the version in the `pubspec.yaml` and `package.json` files, also version badge in README.md

2. generate a new changelog by running:

```sh
standard-version --skip.bump --skip.commit --skip.tag
```

3. commit all the new changes again.

4. finish the release:

```sh
git flow release finish v0.0.0
```

5. git flow will merge new changes into `master` and `develop` branches, and generate a new `tag` (tag name is the new version number e.g v0.0.0).

6. `git push` all the changes into the repo, and `git push origin --tags` for the new version release.


