# flutter_ip
<p align="left">
  <a href="https://pub.dartlang.org/packages/flutter_audio_recorder"><img alt="pub version" src="https://img.shields.io/pub/v/flutter_ip.svg?style=flat-square"></a>
  <a href="https://github.com/Solido/awesome-flutter">
   <img alt="Awesome Flutter" src="https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square" />
</a>
</p>

English | [简体中文](./README-zh_CN.md)

Flutter plugin - Get `External IP`, `Internal IP` address for *wifi*, *cellular* and *wired*. (currently for iOS only)

<img src="https://user-images.githubusercontent.com/10917606/65822254-6085ab00-e273-11e9-9071-3b439b86fb97.gif" width="30%" height="30%" />

## Installation
add `flutter_ip` to your `pubspec.yaml`
```
  dependencies:
    flutter_ip: ^0.1.0
```

## Import
```
  import 'package:flutter_ip/flutter_ip.dart';
```

## Usage 

#### Get External IP
```
  String external = await FlutterIp.externalIP; 
  // e.g. 113.139.104.65 or ""
```

#### Get Internal IP
```
  String internal = await FlutterIp.internalIP; 
  // e.g. 192.168.0.102 or ""
```

#### Get Network Type
```
  String type = await FlutterIp.networkType; // e.g. wifi
```


##### Network Type
Type: `String`

Value: **wifi**, **wired**, **cellular**


## Example
Please check example app using Xcode.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
