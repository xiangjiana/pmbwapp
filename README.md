# app

包网新模版工程

## 项目配置
```dart
dart pub global activate melos
fvm use 3.7.9 --force
fvm flutter pub get
melos bs
```

## 目前相关脚本

### flavor 生成

```dart
melos run APP_Flavor
```

### 选择工程 BuildRunner 代码生成

```dart
melos run Code_Gen
```

选择对应数字 对应工程会执行代码生成

### 全局 BuildRunner 代码生成

```dart
melos run App_Code_Gen
```

注：module/** 旧模块代码是屏蔽代码生成的，如果是module目录下的工程，需要自动到对应目录执行CLI命令

## 工程目录

- app/ app
- ui/** ui 组件相关代码
- module/** 旧模块代码
- api/** 网络库代码

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
