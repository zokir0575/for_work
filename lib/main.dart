import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_work/blocs/list_contracts_cubit.dart';
import 'package:for_work/blocs/list_information_cubit.dart';
import 'package:for_work/pages/main_page.dart';
import 'package:for_work/pages/search_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'ru', 'uz']);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        theme: ThemeData(),
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ListContractsCubit()),
            BlocProvider(create: (context) => ListInformationCubit()),
          ],
          child: ScreenUtilInit(
              designSize: const Size(375, 815),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: () => const MainPage()
          ),
        ),
        routes: {
          SearchPage.id : (context) => SearchPage(contracts: [],)
        },
      ),
    );
  }
}
