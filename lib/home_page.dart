

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorials/counter_provider.dart';

class HomePage extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count=ref.watch(counterProvider);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod StateProvider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(count.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),textDirection: TextDirection.rtl,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(counterProvider.notifier).update((state)=>state+1);
      },child: Icon(Icons.add,size: 28,),),
    );
  }

}
