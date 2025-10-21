// Flutter Material Design imports for UI components
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorials/home_page.dart';


void main() {
  runApp(
     ProviderScope(child: MyApp()),
  );
}


final welcomeMessageProvider=Provider<String>((ref){
  return "⭐️ به دنیای Riverpod خوش آمدید! 🚀";
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // HomePage will be a ConsumerWidget since it needs to access providers
    );
  }
}



class HomePage extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomeMessage=ref.watch(welcomeMessageProvider);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod setup"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(welcomeMessage,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),textDirection: TextDirection.rtl,)
          ],
        ),
      ),
    );
  }
  
}
