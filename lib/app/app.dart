import 'package:flutter/material.dart';
import 'package:hello_world/features/authentication/screens/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My adidas app',
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ).copyWith(
          bodyLarge: const TextStyle().copyWith(
            textBaseline: TextBaseline.alphabetic,
          ),
          bodyMedium: const TextStyle().copyWith(
            textBaseline: TextBaseline.alphabetic,
          ),
          bodySmall: const TextStyle().copyWith(
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
        useMaterial3: true,
        fontFamily: 'AdihausDIN',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontFamily: 'AdihausDIN',
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      builder: (context, child) {
        return DefaultTextStyle.merge(
          style: const TextStyle(
            fontFamily: 'AdihausDIN',
          ),
          child: _Uppercase(child: child ?? const SizedBox())
        );
      },
      home: const  LoginScreen()
    );
  }
}

class _Uppercase extends StatelessWidget {
  final Widget child;
  const _Uppercase({required this.child});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context),
      child: _UppercaseText(child: child),
    );
  }
}

class _UppercaseText extends StatelessWidget {
  final Widget child;
  const _UppercaseText({required this.child});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return TextThemeOverride(child: child);
      },
    );
  }
}

class TextThemeOverride extends StatelessWidget {
  final Widget child;
  const TextThemeOverride({required this.child});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(context).style.copyWith(
            textBaseline: TextBaseline.alphabetic,
          ),
      child: _UppercaseTextWrapper(child: child),
    );
  }
}

class _UppercaseTextWrapper extends StatelessWidget {
  final Widget child;
  const _UppercaseTextWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return _TextUppercaseInherited(child: child);
  }
}

class _TextUppercaseInherited extends InheritedWidget {
  const _TextUppercaseInherited({required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}