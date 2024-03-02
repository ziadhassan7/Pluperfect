import 'package:flutter/material.dart';

class FutureLoaderWidget<T> extends StatelessWidget {
  const FutureLoaderWidget({super.key, required this.future, required this.builder});

  final Future<T> future;
  final Widget Function(T) builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot snapshot){

          if(snapshot.hasData){
            T data = snapshot.data!;
            return builder(data);

          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        }
    );
  }
}
