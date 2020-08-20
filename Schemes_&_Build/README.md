# Flutter多Scheme对应和打包

## 工程多Scheme对应

我们以往的项目都会需要多个不同环境配置，为了保证多环境代码相同配置不同所以用到一个工程多Scheme，例：`dev`（开发环境）、`stg`（客户测试环境）、`pro`（正式环境）。下面是根据这个例子展开讲解的，具体代码参考工程`schemes_build_example`。

- ### ios

  步骤一，工程PROJECT=>Info=>Configurations下，追加dev、stg、pro 三组Debug 和Release，如下图。

  ![image1](https://github.com/PacteraWangCong/flutter_note/blob/master/Schemes_%26_Build/images/image1.png)

  

  步骤二，打开xcode，Product=>Scheme=>Manage Scheme添加dev、stg、pro, 如下图。

  ![image2](https://github.com/PacteraWangCong/flutter_note/blob/master/Schemes_%26_Build/images/image2.png)

  

  步骤三，设置各自scheme来匹配 `PROJECT=>Info=>Configurations`里的设置，例子如下图。

  ![image3](https://github.com/PacteraWangCong/flutter_note/blob/master/Schemes_%26_Build/images/image3.png)

  ![image4](https://github.com/PacteraWangCong/flutter_note/blob/master/Schemes_%26_Build/images/image4.png)

  

  步骤四，设置TARGETS=>Build Settings 来匹配`PROJECT=>Info=>Configurations`，这是最主要的部分，比如配置包名、app icon、info.plist、自定义宏命令...，如下图是info.plist区分的例子。

  ![image5](https://github.com/PacteraWangCong/flutter_note/blob/master/Schemes_%26_Build/images/image5.png)

  

  最后，flutter编辑Configurations来匹配原生的多Scheme，如下图。

  ![image6](https://github.com/PacteraWangCong/flutter_note/blob/master/Schemes_%26_Build/images/image6.png)

  

- ### android（待追加）

  



## Flutter打包

- ### ios
  步骤一，终端进入到工程目录下执行命令`flutter pub get` ，下载第三方库。

  步骤二，工程目录下执行命令`flutter build ios --release` ，如果工程是多scheme情况执行 `flutter build ios --release --flavor dev --target lib/dev_main.dart`（`--flavor dev`为指定的scheme，`lib/dev_main.dart`为指定的mian函数文件相对路径）,里面的参数根据scheme配置而定。

  步骤三，使用xcode执行Archive，ios原生普通打包方式把ipa导出来。


- #### android

  apk打包：
  进入项目跟目录下执行命令flutter build apk -t lib/dev_main.dart --flavor dev，执行后生成dev环境的apk文件，如果要生成其它环境，将dev修改成对应环境即可。
  
  appbundle打包：
  进入项目跟目录下执行命令flutter build appbundle -t lib/dev_main.dart --flavor dev，执行后生成dev环境的aab文件，如果要生成其它环境，将dev修改成对应环境即可。



