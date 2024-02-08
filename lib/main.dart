import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/bloc_color_theme.dart';
import 'package:pluperfect/core/styles/color_theme.dart';
import 'package:pluperfect/core/system_util.dart';
import 'package:pluperfect/features/learning_sections/critical_thinking/presentation/cubit/questions/question_cubit.dart';
import 'package:pluperfect/features/learning_sections/read/presentation/cubit/speaker/speak_cubit.dart';
import 'package:pluperfect/index/index_page.dart';
import 'core/bloc_observer.dart';
import 'features/learning_sections/common/mic/cubit/mic_cubit.dart';
import 'features/learning_sections/conversation/presentation/cubit/chat/chat_cubit.dart';
import 'features/learning_sections/conversation/presentation/cubit/mic/mic_cubit.dart';
import 'features/learning_sections/hear/presentation/cubit/hear/hear_cubit.dart';
import 'features/learning_sections/read/presentation/cubit/mic/mic_cubit.dart';
import 'features/learning_sections/read/presentation/cubit/quotes/quotes_cubit.dart';
import 'injection.dart' as inject;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  //initialization
  await inject.init();

  //Bloc Observer
  Bloc.observer = MyBlocObserver();

  //Lock screen only portrait
  SystemUtil.setScreenOnlyPortrait();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/locals', // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      child: const MyApp()
  ),);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => ThemeCubit()),),
        BlocProvider(create: ((context) => QuotesCubit()),),
        BlocProvider(create: ((context) => SpeakerCubit()),),
        BlocProvider(create: ((context) => HearCubit()),),
        BlocProvider(create: ((context) => ConversationMicCubit()),),
        BlocProvider(create: ((context) => MicCubit()),),
        BlocProvider(create: ((context) => InteractionCubit()),),
        BlocProvider(create: ((context) => ChatCubit()),),
        BlocProvider(create: ((context) => QuestionCubit()),),
      ],

      child: MaterialApp(
        title: 'Pluperfect',
        debugShowCheckedModeBanner: false,

        //Localization
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,

        //Handle Color Theme Change
        home: BlocBuilder<ThemeCubit, bool>(
          builder: (context, isDark) {

            ColorTheme.setGlobalTheme(isDarkTheme: isDark);

            return IndexPage(key: Key(BlocProvider.of<ThemeCubit>(context).state.toString()),);
          }
        ),
      ),
    );
  }
}
