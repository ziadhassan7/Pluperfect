import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluperfect/core/styles/padding.dart';
import 'package:pluperfect/features/dictionary/presentation/cubit/dictionary_states.dart';
import 'package:pluperfect/features/dictionary/presentation/views/empty_dictionary_view.dart';
import 'package:pluperfect/features/dictionary/presentation/widgets/word_item.dart';
import '../../../../core/app_widgets/text_view/custom_text.dart';
import '../../../../core/localization/localization.dart';
import '../../../../core/styles/color_theme.dart';
import '../cubit/dictionary_cubit.dart';
import '../dialogs/create_new_word/new_word_dialog.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) =>
        context.read<DictionaryCubit>().refresh());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.background,

      body: SafeArea(
        child: Column(
          children: [

            ///                                                               / Title
            Container(
              alignment: AlignmentDirectional.topStart,
              padding: const CustomPadding(vertical: 18, horizontal: 30),

              child: CustomText(
                LocalTxt.dictionaryPageTitle,
                color: ColorTheme.text,
                weight: FontWeight.bold,
                size: 35,
                fontFamily: FontFamily.sansation,
              ),
            ),

            ///                                                               / Body
            BlocBuilder<DictionaryCubit, DictionaryStates>(
              builder: (context, state){

                if(state is LoadingState){
                  return const Center(child: CircularProgressIndicator());
                }

                if(state is IdleState){
                  if(state.dataList != null){
                    ///List of words
                    return Expanded(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.dataList!.length,
                          itemBuilder: (context, index){
                            return WordItem(
                              word: state.dataList![index].id,
                              translation: state.dataList![index].translation,
                            );
                          },
                        ),
                      ),
                    );

                  } else {

                    ///Empty List
                    return const EmptyDictionaryView();
                  }
                }

                return const EmptyDictionaryView();
              }
            ),
          ],
        ),
      ),

      ///                                                                       / Add Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorTheme.onBackground,
        foregroundColor: ColorTheme.text,
        child: const Icon(Icons.add_rounded),

        onPressed: () {
          NewWordDialog.show(context);
        },
      ),
    );
  }
}
