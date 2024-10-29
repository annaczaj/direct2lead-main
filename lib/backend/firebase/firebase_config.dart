import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAkQuyKdeHcZYD5md7tFV5MIqmKBkG4cAo",
            authDomain: "direct2lead.firebaseapp.com",
            projectId: "direct2lead",
            storageBucket: "direct2lead.appspot.com",
            messagingSenderId: "135874233942",
            appId: "1:135874233942:web:9240129b95a08e68c8ddf7",
            measurementId: "G-DLNPYPRF5J"));
  } else {
    await Firebase.initializeApp();
  }
}
