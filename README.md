# splathon-client

Splathon client application

|#10|#11|#12|
|----|----|----|
|<img src="https://raw.githubusercontent.com/splathon/splathon-client/master/assets/images/girl.png" width="500px">|<img src="https://raw.githubusercontent.com/splathon/splathon-client/master/assets/images/boys.png" width="500px">|<img src="https://raw.githubusercontent.com/splathon/splathon-client/master/assets/images/boy_and_girl.png" width="500px">|

## Setup

### Install dart

```
$ brew tap dart-lang/dart
$ brew install dart
```

### Install FVM

```
$ dart pub global activate fvm
```

### Install Xcode, Android Studio

https://docs.flutter.dev/get-started/install/macos

### Generate APIs client code

```
$ openapi-generator generate -i swagger.yaml -g dart -o client
```

### Setup Firebase 

https://firebase.google.com/docs/flutter/setup

### Run Debug

```
# Mobile
$ fvm flutter run --dart-define=FLAVOR=stg --dart-define=EVENT_NUMBER=11

# Web
$ fvm flutter run -d chrome --web-renderer html --dart-define=FLAVOR=stg --dart-define=EVENT_NUMBER=11
```

## Design

- [Zeplin - splathon app](https://app.zeplin.io/project/5c9f792b57fbe3581e78215b)

