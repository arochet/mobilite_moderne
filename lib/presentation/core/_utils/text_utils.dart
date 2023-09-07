import 'dart:math' as math;
import 'package:mobilite_moderne/PRESENTATION/core/_utils/future_utils.dart';

import 'num_utils.dart';

class TextUtils {
  const TextUtils._();

  static const String empty = '';
  static Future<String> emptyFuture = empty.toFuture();

  /// Add an uppercase to the first letters of a sentence
  /// Eg: Hello world -> Hello World
  static String toFirstLettersUpperCase(String? text) {
    if (TextUtils.isEmpty(text)) {
      return '';
    }

    List<String> split = text!.split(' ');
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i != split.length; i++) {
      String part = split[i];

      if (part.isNotEmpty) {
        buffer.write(part[0].toUpperCase());
        buffer.write(part.substring(1).toLowerCase());

        if (i < split.length - 1) {
          buffer.write(' ');
        }
      }
    }

    return buffer.toString();
  }

  static String? parseNullableString(dynamic value) {
    if (value == null) {
      return null;
    } else if (value is String) {
      return value;
    } else {
      return value.toString();
    }
  }

  static String parseString(dynamic value) {
    if (value == null) {
      throw Exception('The value ($value) can not be null');
    } else if (value is String) {
      return value;
    } else {
      return value.toString();
    }
  }

  static String? parseStringAndTrim(dynamic value) {
    return parseNullableString(value)?.trim();
  }

  static bool isEmpty(dynamic text) {
    if (text == null || text is! String) {
      return true;
    } else {
      return text.isEmpty;
    }
  }

  static bool isNotEmpty(dynamic text) {
    if (text == null || text is! String) {
      return false;
    } else {
      return text.isNotEmpty;
    }
  }

  static String joinPath(String path1, String path2) {
    if (path1.endsWith('/')) {
      return '$path1$path2';
    } else {
      return '$path1/$path2';
    }
  }

  static List<TextMatch> extractMatches(String text, String? search) {
    if (TextUtils.isEmpty(search)) {
      return <TextMatch>[];
    }

    List<TextMatch> matches = <TextMatch>[];
    int lastMatch = 0;

    RegExp('$search', caseSensitive: false).allMatches(text).forEach((match) {
      if (match.start > 0 && lastMatch != match.start - 1) {
        matches.add(TextMatch(lastMatch, match.start, false, text));
      }

      matches.add(TextMatch(match.start, match.end, true, text));
      lastMatch = match.end;
    });

    if (lastMatch != text.length) {
      matches.add(TextMatch(lastMatch, text.length, false, text));
    }

    return matches;
  }

  static bool isCharacter(int codeUnit) {
    return (codeUnit >= 65 && codeUnit <= 90) || (codeUnit >= 97 && codeUnit <= 122);
  }

  /// Items are order by search similarity, then ascending
  static int compare(
    String search,
    String? text1,
    String? text2, [
    String? altText1,
    String? altText2,
  ]) {
    if (isEmpty(text1) && isEmpty(text2)) {
      if (altText1 != null && altText2 != null) {
        return altText1.compareTo(altText2);
      }
      return 0;
    } else if (isEmpty(text1)) {
      return 1;
    } else if (isEmpty(text2)) {
      return -1;
    }

    if (isNotEmpty(search)) {
      bool startWith1 = text1!.toUpperCase().startsWith(search.toUpperCase());
      bool startWith2 = text2!.toUpperCase().startsWith(search.toUpperCase());

      if (startWith1 && !startWith2) {
        return -1;
      } else if (startWith2 && !startWith1) {
        return 1;
      }
    }

    bool text1StartWithText = text1!.startsWith(RegExp(r'[a-zA-Z]'));
    bool text2StartWithText = text2!.startsWith(RegExp(r'[a-zA-Z]'));

    if (text1StartWithText && !text2StartWithText) {
      return -1;
    } else if (text2StartWithText && !text1StartWithText) {
      return 1;
    } else {
      return text1.compareTo(text2);
    }
  }

  /// Items starting by the first term, then by the second
  static int compareBySimilarity(
    String? search,
    String? text11,
    String? text12,
    String? text21,
    String? text22,
  ) {
    if (isEmpty(text11) && isEmpty(text12)) {
      num? firstNum = NumUtils.parseNullableNum(text21);
      num? secondNum = NumUtils.parseNullableNum(text22);

      if (firstNum != null && secondNum != null) {
        return firstNum.compareTo(NumUtils.parseNullableNum(text22)!);
      } else {
        return text21!.compareTo(text22!);
      }
    } else if (isEmpty(text11)) {
      return 1;
    } else if (isEmpty(text12)) {
      return -1;
    }

    if (isNotEmpty(search)) {
      bool startWith1 = text11!.trim().toUpperCase().startsWith(
            search!.toUpperCase(),
          );
      bool startWith2 = text12!.trim().toUpperCase().startsWith(
            search.toUpperCase(),
          );

      if (startWith1 && !startWith2) {
        return -1;
      } else if (startWith2 && !startWith1) {
        return 1;
      }
    }

    num? num21 = NumUtils.parseNullableNum(text21?.trim());
    num? num22 = NumUtils.parseNullableNum(text22?.trim());

    if (num21 != null && num22 != null) {
      return num21.compareTo(num22);
    } else {
      return text21!.trim().compareTo(text22!.trim());
    }
  }

  static String limitLinesFromEnd(
    Iterable<String> text,
    int maxLines,
  ) {
    StringBuffer buffer = StringBuffer();
    int linesCount = 0;
    List<int> nbLinePerFile = [];
    for (int itemPos = 0; itemPos <= text.length - 1; itemPos++) {
      String item = text.elementAt(itemPos).trim();
      int logLinesCount = '\n'.allMatches(item).length + 1;

      if (linesCount + logLinesCount < maxLines) {
        nbLinePerFile.add(-1); //means all the file
        linesCount += logLinesCount;
      } else {
        int limit = maxLines - linesCount;
        nbLinePerFile.add(limit);
      }
    }
    for (int itemPos = text.length - 1; itemPos >= 0; itemPos--) {
      String item = text.elementAt(itemPos).trim();
      if (nbLinePerFile[itemPos] == -1) {
        buffer.writeln(item);
      } else {
        int limit = nbLinePerFile[itemPos];
        for (int pos = item.length - 1; pos >= 0; pos--) {
          if (item[pos] == '\n') {
            if (limit <= 1) {
              buffer.writeln(item.substring(math.min(item.length, pos + 1), item.length));
              break;
            }

            limit--;
          }
        }
      }
    }
    return buffer.toString();
  }

  static String? notEmpty2(String? str1, String? str2) {
    if (TextUtils.isNotEmpty(str1?.trim())) {
      return str1;
    } else if (TextUtils.isNotEmpty(str2?.trim())) {
      return str2;
    } else {
      return '';
    }
  }
}

class TextMatch {
  final int start;
  final int end;
  final bool match;
  final String text;

  TextMatch(this.start, this.end, this.match, String text) : text = text.substring(start, end);

  @override
  String toString() {
    return 'Match{start: $start, end: $end, match: $match, text: $text}';
  }
}

extension TextUtilsExtensions on String {
  String joinPath(String path) {
    return TextUtils.joinPath(this, path);
  }

  String toFirstLettersUpperCase() {
    return TextUtils.toFirstLettersUpperCase(this);
  }

  T? letIfNotEmpty<T>(T operationFor(String self)) {
    if (isNotEmpty) {
      return operationFor(this);
    } else {
      return null;
    }
  }

  bool containsAtLeastOne(Iterable<String> values) {
    return values.contains(this);
  }

  bool get hasOnDigits => contains(RegExp('[0-9]+'));

  bool get isCharacter => length == 1 && TextUtils.isCharacter(codeUnitAt(0));
}

extension StringBufferExtension on StringBuffer {
  void writeAndAppendIfNotEmpty(String text, String appendIfNotEmpty) {
    if (isNotEmpty) {
      write(appendIfNotEmpty);
    }
    write(text);
  }
}
