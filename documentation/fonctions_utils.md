## BOOL UTILS
```
bool parseBool(value)
bool? parseNullableBool(value)
```

## BOOL EXTENTIONS
```
int toInt()
String toIntString()
```

## DATE UTILS
```
String formatDate(DateTime? date, [String? format])
DateTime? parseDate(String? date, String format)
DateTime? parseDateWithTimeIfPossible(String date)
DateTime? parseNullableDateWithTime(Object? date)
DateTime? parseDateWithTime(Object? date)
DateTime parseDateOnly(Object? date)
DateTime? parseNullableDateOnly(Object? date)
DateTime? parseTimeStamp(Object? timestamp)
int diffInDays(DateTime date)
int diffInDaysWith(DateTime date1, DateTime date2)
int diffInMonths(DateTime date1, DateTime date2)
DiffInMonths diffInMonthsAndDays(DateTime date)
DiffInMonths diffInMonthsAndDaysWith(DateTime date1, DateTime date2)
bool isToday(DateTime date)
DateTime? fromTimestamp(int? date)
int? toTimestamp(DateTime? date)
DateTime get todayAtMidnight
DateTime get tomorrow
int _diffInDays({required DateTime x, required DateTime y})
int _diffInMonths({required DateTime date, DateTime? other})
String formatDays(int sum, BuildContext context, {bool minLabels = false})
DateTime min(DateTime d1, DateTime d2)
DateTime max(DateTime d1, DateTime d2)
DateTime todayWith(num days)
```

## DATE UTILS EXTENTIONS
```
int toTimestamp()
DateTime clone({int? year,int? month,int? day,int? hour,int? minute,int? second,int? millisecond,int? microsecond,})
DateTime toDate()
bool isBeforeNow()
bool isAfterNow()
bool isSameDayOrBefore(DateTime other)
bool isSameDayOrAfter(DateTime other)
bool isSameDayAs(DateTime other)
DateTime subtractMonths(int months)
DateTime addMonths(int months)
DateTime addDays(num days)
bool isToday()
```

## NUM UTILS
```
bool isNum(dynamic value)
double parseDouble(dynamic value)
double? parseNullableDouble(dynamic value, [double? defaultValue, bool acceptNull = false])
int parseInt(dynamic value, [int defaultValue = 0,])
int? parseNullableInt(dynamic value, [int? defaultValue,bool acceptNull = false,])
int? parseNullableInt(dynamic value, [int? defaultValue,bool acceptNull = false,])
num parseNum(dynamic value)
num? parseNullableNum(dynamic value)
String toStringAsSignedFixed(num? num, [int fractionDigits = 1])
String? toFormattedString(num? num, [int? digits = 0])
int? extractFractionalPart(num num)
String toCustomFormatString(num? num,String format, [bool includeZero = true,])
```

## NUM EXTENTIONS
```
int get digits
```

## OBJECT EXTENTIONS
```
String get asString
int get asInt
double get asDouble
num get asNum
bool get asBool
```

## TEXT UTILS
```
String toFirstLettersUpperCase(String? text)
String? parseNullableString(dynamic value)
String parseString(dynamic value)
String? parseStringAndTrim(dynamic value)
bool isEmpty(dynamic text)
bool isNotEmpty(dynamic text)
String joinPath(String path1, String path2)
List<TextMatch> extractMatches(String text, String? search)
bool isCharacter(int codeUnit)
'int compare(String search,String? text1,String? text2, [String? altText1,String? altText2,])',
int compareBySimilarity(String? search,String? text11,String? text12,String? text2String? ext22,)
String limitLinesFromEnd(Iterable<String> text,int maxLines,)
````

## STRING EXTENTIONS
```
String joinPath(String path)
String toFirstLettersUpperCase()
T? letIfNotEmpty<T>(T operationFor(String self))
bool containsAtLeastOne(Iterable<String> values)
bool get hasOnDigits
bool get isCharacter
```