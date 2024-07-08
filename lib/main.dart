import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/modules/user.dart';
import 'package:untitled/screen/wrapper.dart';
import 'package:untitled/services/auth.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options:const FirebaseOptions(apiKey: "AIzaSyC_9S76MZYui9CmZLiqNV4SOmRQQeJcazc",
        authDomain: "untitled-133a9.firebaseapp.com",
        projectId: "untitled-133a9",
        storageBucket: "untitled-133a9.appspot.com",
        messagingSenderId: "601196560690",
        appId: "1:601196560690:web:afddb6c38331bab3c9972b"));
  }else{
    Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      catchError: (_, __) => null,
      value: AuthService().user,
      initialData: null,
      child:  MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
