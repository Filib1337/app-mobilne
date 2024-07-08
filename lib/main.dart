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
    await Firebase.initializeApp(options:const FirebaseOptions(apiKey: "usuniete dla bezpieczenstwa",
        authDomain: "usuniete dla bezpieczenstwa",
        projectId: "usuniete dla bezpieczenstwa",
        storageBucket: "usuniete dla bezpieczenstwa",
        messagingSenderId: "usuniete dla bezpieczenstwa",
        appId: "usuniete dla bezpieczenstwa"));
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
