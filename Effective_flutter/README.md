# Flutter 开发标准

## 编码规范

[参考文档](https://dart.dev/guides/language/effective-dart/documentation)

#### 类、枚举、typedef、类型参数，使用大驼峰

✔️

```Dart
class SliderMenu { ... }

class HttpRequest { ... }
  
typedef Predicate = bool Function<T>(T value);
```

❌

```Dart
class sliderMenu { ... }
  
class httpRequest { ... }
  
typedef predicate = bool Function<T>(T value);
```



#### 使用小驼峰命名常亮、变量

✔️

```Dart
const pi = 3.14;
const defaultTimeout = 1000;
final urlScheme = RegExp('^([a-z]+):');
  
class Dice {
  static final numberGenerator = Random();
}
```

❌

```Dart
const PI = 3.14;
const DefaultTimeout = 1000;
final URL_SCHEME = RegExp('^([a-z]+):');
  
class Dice {
  static final NUMBER_GENERATOR = Random();
}
```



#### 使用小写加下划线来命名库和源文件

✔️

```Dart
library peg_parser.source_scanner;
  
import 'file_system.dart';
import 'slider_menu.dart';
```

❌

```Dart
library pegparser.SourceScanner;
  
import 'file-system.dart';
import 'SliderMenu.dart';
```



#### 使用小写加下划线来命名导入前缀

✔️

```Dart
import 'dart:math' as math;
import 'package:angular_components/angular_components'
     as angular_components;
import 'package:js/js.dart' as js;
```

❌

```Dart
import 'dart:math' as Math;
import 'package:angular_components/angular_components'
    as angularComponents;
import 'package:js/js.dart' as JS;
```



#### 优先使用final字段来创建只读属性

✔️

```Dart
class Box {
  final String value;
  Box(this.value);
}
```

❌

```Dart
class Box {
  var String value;
  Box(String value) {
    this.value = value;
  }
}
```



#### 不要使用.length查看集合是否为空

✔️

```Dart
if (lunchBox.isEmpty) return 'so hungry...';
if (words.isNotEmpty) return words.join(' ');
```

❌

```Dart
if (lunchBox.length == 0) return 'so hungry...';
if (!words.isEmpty) return words.join(' ');
```



#### 头文件中导入和导出用换行区分开

✔️

```Dart
import 'src/error.dart';
import 'src/foo_bar.dart';
  
export 'src/error.dart';
```

❌

```Dart
import 'src/error.dart';
export 'src/error.dart';
import 'src/foo_bar.dart';
```



#### 使用类的构造方法超过3个以上，最后的属性也要加上`,`

这样`dartfmt` 后代码更整洁。

✔️ 

```Dart
Image.asset(
    'image.png',
    fit: BoxFit.contain,
    alignment: Alignment.bottomCenter,
)
```

❌

```Dart
Image.asset(
    'image.png',
    fit: BoxFit.contain, alignment: Alignment.bottomCenter
)
```



#### 考虑使用高阶方法转换序列

如果有一个集合，并且希望从中生成一个新的修改后的集合，那么使用.map()、.where()和Iterable上的其他方便的方法通常更短，也更具有声明性。

```Dart
var aquaticNames = animals
      .where((animal) => animal.isAquatic)
      .map((animal) => animal.name);
```



#### dartfmt

写完的代码一定要用`Reformat code with dartfmt` 格式化下，需要注意的是`dartfmt`换行标准统一成`120`，设置如下图。

![image1](https://github.com/PacteraWangCong/flutter_note/blob/master/Effective_flutter/images/image1.png)





## 注释规范

#### 使用`///`注释方法，使用`//`注释方法内的代码

```Dart
/// a simple func
greet(name) {
  // Assume we have a valid name.
  print('Hi, $name!');
}
```



#### 使用`///`文档注释来记录成员和类型

```Dart
/// The number of characters in this chunk when unsplit.
int get length
```



#### 在文件的头文件下、最上代码上一行，注释创建者或修改者

```Dart
import 'package:flutter/material.dart';

/// Created by LiLei on 16/3/21.
/// Fix by HanMeiMei on 17/3/29.

class A {
  
}
```



## 图片资源管理

咱们项目统一用`flutter-img-sync `插件管理图片资源。

#### 1.安装

Android studio=>Preferences=>Plugins=>Marketplace,搜索`flutter-img-sync `并安装

#### 2.使用

工程的pubspec.yaml添加脚本注解，这里注意`assets/images/`为图片的文件路径：

```yaml
assets:
    # assets-generator-begin
    # assets/images/*
    # assets-generator-end
```

添加后执行Android studio=>Tools=>FlutterImgSync，这是工程下就会生成r.dart文件，需要注意的是这个过程他会让你输入端口号，咱们统一设置成`8080`，避免和他人文件冲突。

## 工程结构标准

这是目前开发采用的工程结构，但它不一定适应所有项目，下面是例子，领会精神🙂。
<img src="https://github.com/minefocus/flutter_note/blob/master/Effective_flutter/images/image2.png" alt="工程一览" width="50%" height="50%" />
