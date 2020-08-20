class StringUtils {

  /// isEmpty
  static bool isEmpty(String text) {
    return text == null || text.isEmpty;
  }

  static final fullKanaListPart1 = "アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲンーャュョァィゥェォッ゛゜";
  static final fullKanaListPart2 = "ヴ,ガ,ギ,グ,ゲ,ゴ,ザ,ジ,ズ,ゼ,ゾ,ダ,ヂ,ヅ,デ,ド,バ,ビ,ブ,ベ,ボ,パ,ピ,プ,ペ,ポ";
  static final halfKanaListPart1 = "ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜｦﾝｰｬｭｮｧｨｩｪｫｯﾞﾟ";
  static final halfKanaListPart2 = "ｳﾞ,ｶﾞ,ｷﾞ,ｸﾞ,ｹﾞ,ｺﾞ,ｻﾞ,ｼﾞ,ｽﾞ,ｾﾞ,ｿﾞ,ﾀﾞ,ﾁﾞ,ﾂﾞ,ﾃﾞ,ﾄﾞ,ﾊﾞ,ﾋﾞ,ﾌﾞ,ﾍﾞ,ﾎﾞ,ﾊﾟ,ﾋﾟ,ﾌﾟ,ﾍﾟ,ﾎﾟ";

  /// 全角转半角
  static String fullToHalf(String value) {
    String newValue = '';
    for (int i = 0; i < value.length; i++) {
      final code = value[i].codeUnitAt(0);
      if (code == 12288) {
        // 空格
        newValue += String.fromCharCode(32);
      } else if (code > 65280 && code < 65375) {
        // 英文、数字、记号
        newValue += String.fromCharCode(code - 65248);
      } else {
        newValue += value[i];
      }
    }
    // 全角片假名转半角片假名 part2
    final arrFullkana = fullKanaListPart2.split(',');
    final arrHalfkana = halfKanaListPart2.split(',');
    for (int i = 0; i < arrFullkana.length; i++) {
      newValue = newValue.replaceAll(arrFullkana[i], arrHalfkana[i]);
    }
    // 全角片假名转半角片假名 part1
    for (int i = 0; i < fullKanaListPart1.length; i++) {
      newValue = newValue.replaceAll(fullKanaListPart1[i], halfKanaListPart1[i]);
    }
    return newValue;
  }

  /// 半角转全角
  static String halfToFull(String value) {
    String newValue = '';
    for (int i = 0; i < value.length; i++) {
      final code = value[i].codeUnitAt(0);
      if (code == 32) {
        // 半角空格转全角
        newValue += String.fromCharCode(12288);
      } else if (code < 127) {
        // 半角英文、数字、记号转全角
        newValue += String.fromCharCode(code + 65248);
      } else {
        newValue += value[i];
      }
    }
    // 半角片假名转全角片假名 part2
    final arrFullkana = fullKanaListPart2.split(',');
    final arrHalfkana = halfKanaListPart2.split(',');
    for (int i = 0; i < arrHalfkana.length; i++) {
      newValue = newValue.replaceAll(arrHalfkana[i], arrFullkana[i]);
    }
    // 半角片假名转全角片假名 part1
    for (int i = 0; i < halfKanaListPart1.length; i++) {
      newValue = newValue.replaceAll(halfKanaListPart1[i], fullKanaListPart1[i]);
    }
    return newValue;
  }

  /// 英文数字全角转半角
  static String numberFullToHalf(String value) {
    String newValue = '';
    for (int i = 0; i < value.length; i++) {
      final code = value[i].codeUnitAt(0);
      // ０-９   Ａ-Ｚ  ａ-ｚ
      if ((code >= 65296 && code <= 65305) || (code >= 65313 && code <= 65338) || (code >= 65345 && code <= 65370)) {
        // 英文、数字
        newValue += String.fromCharCode(code - 65248);
      } else {
        newValue += value[i];
      }
    }
    return newValue;
  }

  /// 平假名转片假名
  static String hiraToKana(String value) {
    final fullValue = StringUtils.halfToFull(value);
    String newValue = '';
    for (int i = 0; i < fullValue.length; i++) {
      final code = fullValue[i].codeUnitAt(0);
      if (0x3041 <= code && code <= 0x3096) {
        // 平假名转片假名
        newValue += String.fromCharCode(code + 0x0060);
      } else {
        newValue += fullValue[i];
      }
    }
    return newValue;
  }

  /// 片假名转平假名
  static String kanaToHira(String value) {
    String newValue = '';
    for (int i = 0; i < value.length; i++) {
      final code = value[i].codeUnitAt(0);
      if (0x30A1 <= code && code <= 0x30F6) {
        newValue += String.fromCharCode(code - 0x0060);
      } else {
        newValue += value[i];
      }
    }
    return newValue;
  }

}

