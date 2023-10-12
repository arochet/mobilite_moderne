import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:mobilite_moderne/PRESENTATION/core/_components/show_component_file.dart';

@RoutePage()
class UtilsPage extends StatelessWidget {
  const UtilsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> listBoolUtils = [
      'bool parseBool (value)',
      'bool? parseNullableBool (value)',
    ];

    List<String> listBoolExtentions = [
      'int toInt ()',
      'String toIntString ()',
    ];

    List<String> listDateUtils = [
      'String formatDate (DateTime? date, [String? format])',
      'DateTime? parseDate (String? date, String format)',
      'DateTime? parseDateWithTimeIfPossible (String date)',
      'DateTime? parseNullableDateWithTime (Object? date)',
      'DateTime? parseDateWithTime (Object? date)',
      'DateTime parseDateOnly (Object? date)',
      'DateTime? parseNullableDateOnly (Object? date)',
      'DateTime? parseTimeStamp (Object? timestamp)',
      'int diffInDays (DateTime date)',
      'int diffInDaysWith (DateTime date1, DateTime date2)',
      'int diffInMonths (DateTime date1, DateTime date2)',
      'DiffInMonths diffInMonthsAndDays (DateTime date)',
      'DiffInMonths diffInMonthsAndDaysWith (DateTime date1, DateTime date2)',
      'bool isToday (DateTime date)',
      'DateTime? fromTimestamp (int? date)',
      'int? toTimestamp (DateTime? date)',
      'DateTime get todayAtMidnight',
      'DateTime get tomorrow',
      'int _diffInDays ({required DateTime x, required DateTime y})',
      'int _diffInMonths ({required DateTime date, DateTime? other})',
      'String formatDays (int sum, BuildContext context, {bool minLabels = false})',
      'DateTime min (DateTime d1, DateTime d2)',
      'DateTime max (DateTime d1, DateTime d2)',
      'DateTime todayWith (num days)',
    ];

    List<String> listDateUtilsExtentions = [
      'int toTimestamp ()',
      'DateTime clone ({int? year,int? month,int? day,int? hour,int? minute,int? second,int? millisecond,int? microsecond,})',
      'DateTime toDate ()',
      'bool isBeforeNow ()',
      'bool isAfterNow ()',
      'bool isSameDayOrBefore (DateTime other)',
      'bool isSameDayOrAfter (DateTime other)',
      'bool isSameDayAs (DateTime other)',
      'DateTime subtractMonths (int months)',
      'DateTime addMonths (int months)',
      'DateTime addDays (num days)',
      'bool isToday ()',
    ];

    List<String> listNumUtils = [
      'bool isNum (dynamic value)',
      'double parseDouble (dynamic value)',
      'double? parseNullableDouble (dynamic value, [double? defaultValue, bool acceptNull = false])',
      'int parseInt (dynamic value, [int defaultValue = 0,])',
      'int? parseNullableInt (dynamic value, [int? defaultValue,bool acceptNull = false,])',
      'int? parseNullableInt (dynamic value, [int? defaultValue,bool acceptNull = false,])',
      'num parseNum (dynamic value)',
      'num? parseNullableNum (dynamic value)',
      'String toStringAsSignedFixed (num? num, [int fractionDigits = 1])',
      'String? toFormattedString (num? num, [int? digits = 0])',
      'int? extractFractionalPart (num num)',
      'String toCustomFormatString (num? num,String format, [bool includeZero = true,])',
    ];

    List<String> listNumExtentions = [
      'int_get digits',
    ];

    List<String> listObjectExtention = [
      'String_get asString',
      'int_get asInt',
      'double_get asDouble',
      'num_get asNum',
      'bool_get asBool',
    ];

    List<String> listTextUtils = [
      'String toFirstLettersUpperCase (String? text)',
      'String? parseNullableString (dynamic value)',
      'String parseString (dynamic value)',
      'String? parseStringAndTrim (dynamic value)',
      'bool isEmpty (dynamic text)',
      'bool isNotEmpty (dynamic text)',
      'String joinPath (String path1, String path2)',
      'List<TextMatch> extractMatches (String text, String? search)',
      'bool isCharacter (int codeUnit)',
      'int compare (String search,String? text1,String? text2, [String? altText1,String? altText2,])',
      'int compareBySimilarity (String? search,String? text11,String? text12,String? text21,String? text22,)',
      'String limitLinesFromEnd (Iterable<String> text,int maxLines,)',
    ];

    List<String> listStringExtentions = [
      'String joinPath (String path)',
      'String toFirstLettersUpperCase ()',
      'T? letIfNotEmpty<T> (T operation_for (String self))',
      'bool containsAtLeastOne (Iterable<String> values)',
      'bool_get hasOnDigits',
      'bool_get isCharacter',
    ];
    return MainScaffold(
      title: 'Utils',
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            _UtilsWidget(title: 'BoolUtils', listFonction: listBoolUtils),
            _UtilsWidget(title: 'BoolExtentions', listFonction: listBoolExtentions),
            _UtilsWidget(title: 'DateUtils', listFonction: listDateUtils),
            _UtilsWidget(title: 'DateUtilsExtentions', listFonction: listDateUtilsExtentions),
            _UtilsWidget(title: 'NumUtils', listFonction: listNumUtils),
            _UtilsWidget(title: 'NumExtentions', listFonction: listNumExtentions),
            _UtilsWidget(title: 'ObjectExtention', listFonction: listObjectExtention),
            _UtilsWidget(title: 'TextUtils', listFonction: listTextUtils),
            _UtilsWidget(title: 'StringExtentions', listFonction: listStringExtentions),
          ]),
        ),
      ),
    );
  }
}

class _UtilsWidget extends StatelessWidget {
  final String title;
  final List<String> listFonction;
  const _UtilsWidget({required this.title, required this.listFonction});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text("$title", style: Theme.of(context).textTheme.titleMedium),
      ),
      Card(
          child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: listFonction.map(
              (String fonction) {
                List<String> list = fonction.split(' ');

                if (list.length > 1)
                  return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: /* Text(list[1].split('(')[0], style: Theme.of(context).textTheme.bodyMedium) */
                          RichText(
                        text: TextSpan(children: [
                          TextSpan(text: '${list[0]} '),
                          TextSpan(
                              text: list[1],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          ...list.sublist(2).map((String e) => TextSpan(text: '$e ')).toList(),
                        ]),
                      ));
                else
                  return Container();
              },
            ).toList(),
          ),
        ),
      ))
    ]);
  }
}
