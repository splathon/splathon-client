# splathon-client

Splathon client application

<img src="https://raw.githubusercontent.com/splathon/splathon-client/master/assets/images/icon-splathon-app.png" width="500px">

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
$ fvm flutter run --dart-define=FLAVOR=stg --dart-define=EVENT_NUMBER=11
```

## Specs

- [Google Drive - Splathon#10 App develop](https://drive.google.com/drive/folders/1IkOe2ItR_ZYUKULYlUSvZwqRhMjebM7z)

## Design

- [Zeplin - splathon app](https://app.zeplin.io/project/5c9f792b57fbe3581e78215b)

