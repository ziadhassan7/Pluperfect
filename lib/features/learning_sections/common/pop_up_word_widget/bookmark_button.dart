import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../dictionary/presentation/cubit/dictionary_cubit.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton(this.word, this.translation, {super.key});

  final String word;
  final String translation;

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) =>
        context.read<DictionaryCubit>().refreshBookmarkState(widget.word));
  }

  @override
  Widget build(BuildContext context) {

    bool isSelected = context.watch<DictionaryCubit>().state;

    return GestureDetector(
        onTap: (){
          context.read<DictionaryCubit>().toggle(widget.word, widget.translation);
        },

        child: isSelected
            ? SvgPicture.asset('assets/bookmark_selected.svg', width: 14,)
            : SvgPicture.asset('assets/bookmark.svg', width: 14,));
  }
}
