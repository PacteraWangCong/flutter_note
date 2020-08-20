/// Created by wangcong on 20/03/06

enum Flavor { DEV, STG, PRO }

class AppConfig {
  String get baseUrl => _baseUrl;
  String get mapKey => _mapKey;
  String _baseUrl = 'dev';
  String _mapKey;

  /// 创建单利
  static AppConfig _instance = AppConfig();
  static AppConfig getInstance() {
    return _instance;
  }

  AppConfig init(Flavor flavor) {
    switch (flavor) {
      case Flavor.DEV:
        // aws(dev)
        _baseUrl = 'http://192.168.103.124:7300/mock/5e981cd2a2dac71fc4875299/base';
        _mapKey = "AIzaSyD1U_9VCW18eZ46BpLNhw1Mi7L-KM33hEg";
        break;
      case Flavor.STG:
        // icp
        _baseUrl = 'http://3.113.156.245:7300/mock/5ee1df4fe4bb2b001bb6e4fa/base';
        _mapKey = "AIzaSyCjBB7zU90FEn99fU0WPnI7QEs4ekuoWNI";
        break;
      case Flavor.PRO:
        _baseUrl = 'pro';
        _mapKey = "AIzaSyCjBB7zU90FEn99fU0WPnI7QEs4ekuoWNI";
        break;
    }
    return AppConfig.getInstance();
  }
}
