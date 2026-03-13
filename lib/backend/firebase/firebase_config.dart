import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDyh5XZU9j9muUNL2E2rk59k2D45lMOY4U",
            authDomain: "the-owensboro-app.firebaseapp.com",
            projectId: "the-owensboro-app",
            storageBucket: "the-owensboro-app.firebasestorage.app",
            messagingSenderId: "98602473214",
            appId: "1:98602473214:web:a717af4766233a5e2237af",
            measurementId: "G-60S5J6CHN3"));
  } else {
    await Firebase.initializeApp();
  }
}
