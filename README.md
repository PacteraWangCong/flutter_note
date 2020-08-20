# Flutter 从入门到放弃

## Flutter介绍

Flutter是谷歌的移动UI框架，可以快速在iOS和Android上构建高质量的原生用户界面。 Flutter可以与现有的代码⼀起工作。在全世界，Flutter正在被越来越多的开发者和组织使用，并且Flutter是完全免费、开源的。

> ### Flutter优缺点

1. ##### Flutter优点

   - 混合开发中，最接近原生开发的框架。
   - 简单易学，Dart语言更具优势。
   - 跨多种平台，减少开发成本；支持插件，可以访问原生系统的调用。
   - 路由设计优秀，写一些复杂的页面跳转逻辑比原生简单易用。
   - Flutter支持热重载，可以大幅度提升开发人员的开发效率，也能及时发现问题并提高质量。

2. ##### Flutter缺点

   - 代码可读性低，树状代码布局不方便以后维护，对代码质量和管理要求较高。
   - flutter有很多缺陷，目前在github的[issues](https://github.com/flutter/flutter/issues)还有7000多。
   - 脱离不开原生，开发人员需要具备原生（Android、iOS）基础开发能力。
   - 适配问题，开发工具版本升级后，修改量大。
   - Flutter packages和Dart packages上第三方sdk繁杂，适配性差，不可乱用。

   

## 学习基础

学习一门技术最好的方法是跟随[官方文档](https://flutter.cn/docs/get-started/flutter-for/ios-devs)一步一步来，如果有基础想快速入门的话可以按照下面步骤来学习。

1. #### `环境搭建`，[参考文档](https://jspang.com/detailed?id=41#toc216)。
2. #### `Dart学习`，没有语言基础建议[Dart官方文档](https://dart.cn/guides)从头看到尾，有语言基础可以直接查看[Dart速查表](https://dart.cn/codelabs/dart-cheatsheet)。
3. #### `UI学习`，这部分学习flutter主要内容，Widget介绍、路由和导航、动画效果...这部分主要还是学习Flutter官方文档中的[用户页面](https://flutter.cn/docs/development/ui/widgets-intro)这部分。
4. #### `Flutter Widgets 介绍合集`，[参考视频](https://www.bilibili.com/video/av38437526)。


## 开发

1. #### [Flutter开发标准](https://github.com/PacteraWangCong/flutter_note/tree/master/Effective_flutter)。

2. #### [Bloc开发模式](https://github.com/PacteraWangCong/flutter_note/tree/master/Bloc)。

3. #### api请求model映射。

   这里我推荐使用第三方库，api请求：[dio](https://pub.flutter-io.cn/packages/dio)，model映射：[dart_json_mapper](https://pub.flutter-io.cn/packages/dart_json_mapper)。

4. #### [Flutter多Scheme对应和打包](https://github.com/minefocus/flutter_note/tree/master/Schemes_&_Build)。

5. #### [Jenkins集成](https://github.com/PacteraWangCong/flutter_note/tree/master/Jenkins)。

6. #### Flutter调用原生页面。（待追加）




## Flutter遇到的坑

1. 路由重复build。（待追加）
2. ios原生present弹出，手势穿透flutter。（待追加）
3. 关于flutter listener的问题。（待追加）
4. flutter自定义error画面。（待追加）
5. android在原生画面后台回到前台Flutter重新初始化。（待追加）



