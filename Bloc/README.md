# Bloc开发模式

## Bloc学习

响应式编程，可以使代码更简洁、更好维护、更方面单的元测试，因此Flutter的响应式编程Bloc就诞生了，目前网上关于Bloc资料很多，都写的很详细，按照我推荐的文档看。

[参考资料1](https://www.jianshu.com/p/4d5e712594b4)

[参考资料2](https://www.jianshu.com/p/e7e1bced6890)



## Bloc扩展使用

这部分是根据目前已完成的项目总结的扩展使用，有必要说一下的是使用Bloc实现画面每次显示和消失的做法。

### 问题介绍

有很多项目的设计会在画面每次显示和消失的时候做特殊处理，在ios中可以使用`viewDidAppear`和`viewDidDisappear`中来处理逻辑，但在Flutter里没提供类似ios这样的是使用方法。

### 解决方法

解决方案是`navigatorObservers`使用`rxdart`对`route`的变化进行监听，并结合`Bloc`来模拟画面显示和消失的事件。

具体代码参考 `bloc_example工程`。



## Bloc使用注意事项

### 1.一个Bloc的作用范围

Flutter的UI是树状结构，Bloc的作用范围也和树状结构一样，从下到上，如下图`AppBloc`在最外层，下面子节点的widget都可调到`AppBloc`,但`AppBloc`的widget（MyApp）调不到`MainTabBloc`，还有同级之间也不可互相调用，例：`HomeBloc`、`AccountListBloc`、`MenuBloc`不可以互相调用，但他们都可以调用`AppBloc`和`MainTabBloc`。利用好这个特性可以用Bloc做很多共同处理。

![结构图.png](https://github.com/PacteraWangCong/flutter_note/blob/master/Bloc/images/page1.png)



### 2.逻辑都放到Bloc里

使用Bloc模式开发的情况下，页面的Widget的build方法里就不能有逻辑相关处理，把逻辑相关代码都放到Bloc里，页面Widget只负责用StreamBuilder拿到数据，并通过数据显示UI，所以每个页面都应该有自己的Bloc。



### 3.Bloc的初始化时机

Flutter使用路由来push页面，如下面代码。

```Dart
// push 下一画面
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => BlocProvider(
                child: PageA(),
                bloc: PageABloc(),
              )),
    );
```

乍一看没什么问题，但Flutter这里有个隐藏的bug，拿上面的例子说，操作PageA画面可能会导致上级路由里的builder重新走一遍，这就会导致PageABloc重新初始化（目前发现的特殊操作有，push一个webview、在当前页面弹出系统键盘），重新初始化会导致PageABloc里用来保存页面的数据也都初始化。

解决方法：把Bloc的初始化写在builder外面，如果现在面代码。

```Dart
// push 下一画面
    final _pageABloc = PageABloc()
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => BlocProvider(
                child: PageA(),
                bloc: _pageABloc,
              )),
    );
```



