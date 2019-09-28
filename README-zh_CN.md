# flutter_ip

<p align="left">
  <a href="https://pub.dartlang.org/packages/flutter_ip"><img alt="pub version" src="https://img.shields.io/pub/v/flutter_ip.svg?style=flat-square"></a>
  <a href="https://github.com/Solido/awesome-flutter">
   <img alt="Awesome Flutter" src="https://img.shields.io/badge/Awesome-Flutter-blue.svg?longCache=true&style=flat-square" />
</a>
</p>

简体中文 | [English](./README.md)

Flutter 插件 - 获取 **外网IP** 及 **内网IP** - 支持的网络环境： `手机4G 或 Wi-Fi 或 有线` (目前支持iOS)

<img src="https://user-images.githubusercontent.com/10917606/65822254-6085ab00-e273-11e9-9071-3b439b86fb97.gif" width="30%" height="30%" />

## 安装
加 `flutter_ip` to 到 `pubspec.yaml`
```
  dependencies:
    flutter_ip: ^0.1.2
```

## 引入
```
  import 'package:flutter_ip/flutter_ip.dart';
```

## 使用方式 

#### 获取 外网IP
```
  String external = await FlutterIp.externalIP; 
  // e.g. 113.139.104.65 or ""
```

#### 获取 内网IP
```
  String internal = await FlutterIp.internalIP; 
  // e.g. 192.168.0.102 or ""
```

#### 获取 网络类型
```
  String type = await FlutterIp.networkType; // e.g. wifi
```


##### 网络类型 值
Type: `String`

Value: **wifi**, **wired**, **cellular**
// wifi, 有线，手机4G


## 代码例子
用Xcode run一边example文件夹里的项目 就可以用AS跑了

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
