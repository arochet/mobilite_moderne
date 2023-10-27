import 'package:mobilite_moderne/PRESENTATION/core/_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'router.dart';

final _appRouter = AppRouter();

/// Widget principal de l'application
/// On définit tout le thème de l'application ici
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //COLOR
    const Color primaryLightColor = Color.fromARGB(35, 0, 255, 0);
    const Color titleColor = Colors.black;
    const Color paragraphColor = Colors.black;

    //BUTTON
    ButtonStyle defaultButtonStyle = ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, // Couleur primary
        foregroundColor: Colors.black,
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Onest',
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            side: BorderSide(color: primaryColor, width: 2.0, style: BorderStyle.solid)));

    return MaterialApp.router(
      title: 'Dist Atelier',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //COLORS
        primaryColor: primaryColor,
        dialogBackgroundColor: Color.fromARGB(255, 135, 45, 252),
        scaffoldBackgroundColor: colorpanel(900),
        canvasColor: colorpanel(800),
        fontFamily: 'Onest',

        //BUTTONS
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: defaultButtonStyle.copyWith(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(MaterialState.hovered)) {
                return primaryColor;
              }
              return Colors.white;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (states) {
              return Colors.black;
            },
          ),
        )),
        textButtonTheme: TextButtonThemeData(
          style: defaultButtonStyle.copyWith(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 14)),
            textStyle: MaterialStateProperty.all(TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: primaryColor,
              fontFamily: 'Onest',
            )),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0)))),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: defaultButtonStyle.copyWith(
              textStyle: MaterialStateProperty.all(TextStyle(fontWeight: FontWeight.bold)),
              foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 17, 141, 160)),
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 139, 233, 248)),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))))),
        ),

        //CARD THEME
        cardTheme: CardTheme(
            color: colorpanel(900),
            elevation: 0,
            margin: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: primaryColor, width: 1.0, style: BorderStyle.solid),
            )),

        //DIALOG THEME
        dialogTheme: DialogTheme(
            backgroundColor: colorpanel(800),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: primaryColor, width: 1.0, style: BorderStyle.solid)),
            actionsPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5)),

        //CHAMPS DE FORMULAIRE
        inputDecorationTheme: InputDecorationTheme(
          fillColor: colorpanel(700),
          filled: true,
          prefixIconColor: titleColor,
          labelStyle: TextStyle(color: titleColor),
          helperStyle: TextStyle(color: titleColor),
          floatingLabelStyle: TextStyle(color: titleColor),
          focusColor: primaryColor,
          hoverColor: primaryColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: primaryColor, width: 1.0, style: BorderStyle.solid),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: primaryColor, width: 1.0, style: BorderStyle.solid),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: primaryColor, width: 1.0, style: BorderStyle.solid),
          ),
          outlineBorder: BorderSide(color: primaryColor, width: 1.0, style: BorderStyle.solid),
        ),

        //TRANSITION DE PAGE
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.macOS: NonePageTransitionsBuilder(),
          TargetPlatform.windows: NonePageTransitionsBuilder(),
          TargetPlatform.linux: NonePageTransitionsBuilder(),
        }),

        //TEXTES
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: titleColor),
          headlineMedium: TextStyle(color: titleColor),
          headlineSmall: TextStyle(color: titleColor),
          titleLarge: TextStyle(fontWeight: FontWeight.bold, color: titleColor),
          titleMedium: TextStyle(fontWeight: FontWeight.bold, color: titleColor),
          titleSmall: TextStyle(fontWeight: FontWeight.bold, color: titleColor),
          bodyLarge: TextStyle(color: paragraphColor, fontSize: 16),
          bodyMedium: TextStyle(color: paragraphColor),
          bodySmall: TextStyle(color: paragraphColor),
          labelLarge: TextStyle(color: titleColor),
          labelMedium: TextStyle(color: titleColor),
          labelSmall: TextStyle(color: titleColor),
        ),

        //BOTTOM NAVIGATION BAR
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: paragraphColor,
        ),

        //DIVIDER
        dividerTheme: DividerThemeData(
          color: primaryColor,
          thickness: 1,
        ),

        //CHIP
        chipTheme: ChipThemeData(
          backgroundColor: colorpanel(700),
          disabledColor: colorpanel(700),
          selectedColor: colorpanel(700),
          secondarySelectedColor: colorpanel(700),
          padding: EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          labelStyle: TextStyle(color: titleColor),
          secondaryLabelStyle: TextStyle(color: titleColor),
          brightness: Brightness.dark,
        ),

        //TAB BAR
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: primaryLightColor,
          ),
        ),

        //EXTENSIONS
        extensions: <ThemeExtension<dynamic>>[
          //BUTTONS
          AppThemeExtention(
            buttonLarge: defaultButtonStyle.copyWith(
              textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              visualDensity: VisualDensity(
                horizontal: (VisualDensity.maximumDensity - 1.0),
                vertical: (VisualDensity.maximumDensity - 2.0),
              ),
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 1)),
              elevation: MaterialStateProperty.all(0),
            ),
            buttonDanger: defaultButtonStyle.copyWith(
              backgroundColor: MaterialStateProperty.all(Colors.red[800]),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            buttonWarning: defaultButtonStyle.copyWith(
              backgroundColor: MaterialStateProperty.all(Colors.amber[700]),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            buttonHelp: defaultButtonStyle.copyWith(
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple[500]),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            buttonLight: defaultButtonStyle.copyWith(
              backgroundColor: MaterialStateProperty.all(colorpanel(800)),
              foregroundColor: MaterialStateProperty.all(titleColor),
              elevation: MaterialStateProperty.all(0),
            ),
          ),
        ],
      ),
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

@immutable
class AppThemeExtention extends ThemeExtension<AppThemeExtention> {
  const AppThemeExtention({
    required this.buttonLarge,
    required this.buttonDanger,
    required this.buttonWarning,
    required this.buttonHelp,
    required this.buttonLight,
  });

  final ButtonStyle? buttonLarge;
  final ButtonStyle? buttonDanger;
  final ButtonStyle? buttonWarning;
  final ButtonStyle? buttonHelp;
  final ButtonStyle? buttonLight;

  @override
  AppThemeExtention copyWith({
    ButtonStyle? large,
    ButtonStyle? danger,
    ButtonStyle? warning,
    ButtonStyle? help,
    ButtonStyle? light,
  }) {
    return AppThemeExtention(
      buttonLarge: large ?? this.buttonLarge,
      buttonDanger: danger ?? this.buttonDanger,
      buttonWarning: warning ?? this.buttonWarning,
      buttonHelp: help ?? this.buttonHelp,
      buttonLight: help ?? this.buttonLight,
    );
  }

  @override
  AppThemeExtention lerp(AppThemeExtention? other, double t) {
    if (other is! AppThemeExtention) {
      return this;
    }
    return AppThemeExtention(
      buttonLarge: buttonLarge,
      buttonDanger: buttonDanger,
      buttonWarning: buttonWarning,
      buttonHelp: buttonHelp,
      buttonLight: buttonLight,
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(danger: $buttonDanger)';
}

/// Couleur de base de l'application
Color? colorpanel(int tint) {
  switch (tint) {
    case 900:
      return Colors.white;
    case 800:
      return Color(0xfff2f4f6);
    case 700:
      return Color.fromARGB(255, 229, 231, 234);
    case 100:
      return Color(0xff00214d);
    case 50:
      return Color(0xff00214d);
    default:
      return Colors.white;
  }
}

const Color primaryColor = Color.fromARGB(255, 0, 255, 0);

/// PAGE TRANSITION THEME ////
class NonePageTransitionsBuilder extends PageTransitionsBuilder {
  /// Constructs a page transition animation that slides the page up.
  const NonePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double>? secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
