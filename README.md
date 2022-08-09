<!--
Publish to pub.dev
1. Edit version on pubspec.yaml
2. Add information on CHANGELOG.md
3. Check the package
   $ dart pub publish --dry-run
4. Publish to pub.dev
   $ dart pub publish

# update project libraries
$ dart pub get
# create documentation
$ dart doc .
-->

# DTG

Dart to Go! An excellent utility provided with simplicity.

## Install

In the pubspec.yaml of your flutter project, add the following dependency:
```yaml
dependencies:
  dtg: ^1.0.2
```

In your library add the following import:
```dart
import 'package:dtg/dtg.dart';
```

Then, update your project libraries:
```shell
$ dart pub get
```

## Contributions

Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [`issue`](https://github.com/andypangaribuan/DTG/issues).  
If you fixed a bug or implemented a feature, please send a [`pull request`](https://github.com/andypangaribuan/DTG/pulls).
