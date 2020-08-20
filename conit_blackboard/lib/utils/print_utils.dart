void consolePrint(String msg) {
  /// Release模式关闭了所有的断言,可以借助断言，写出只在Debug模式下生效的代码
  assert((){
    // Do something for debug
    print(msg);
    return true;
  }());
}