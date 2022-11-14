import 'package:flutter/material.dart';
import 'package:flutter_application_2/constants/routes.dart';
import 'package:flutter_application_2/providers/user-provider.dart';
import 'package:flutter_application_2/services/auth-service.dart';
import 'package:flutter_application_2/views/login-view.dart';
import 'package:flutter_application_2/views/posts-view.dart';
import 'package:flutter_application_2/views/register-view.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as dev show log;
// import 'package:flutter_application_2/models/testt.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_application_2/services/api-service.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ], child: const MyApp()));
  // await dotenv.load(fileName: "/.env");

  // final testt = await ApiService().get("users");
  // print('test');
  // print(testt(Testt.testt1));
  // Classs();
  // Classs().method();
  // final classs = Classs('testtttt');
  // print(classs.string);
  // print(Testt.testt2);
  // print(testt);
  // final classss = NClass();
  // classss.aMethod();
  // print(intt(2));
  // print(await intt2(null));
  // print(await intt2(2));
  // intt3(2).listen(print,
  //   onDone: () => print, onError: print);
  // print(periodic());
  // print(list());
  // final classs = TypeClass('2qeq', 2);
  // final class2 = Testtt('2qeq', '2');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        Routes().login: (context) => const LoginView(),
        Routes().register: (context) => const RegisterView(),
        Routes().posts: (context) => const PostsView(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      //   actions: [
      //     TextButton(
      //       onPressed: () async {

      //       },
      //       child: const Text('Logout'),
      //     )
      //   ],
      // ),
      body: Center(
        child: FutureBuilder(
          future: AuthService().isAuthenticated(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.data == true) {
                  return const PostsView();
                } else {
                  return const LoginView();
                }
              default:
                return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

intt(int a) {
  return a * 2;
}

Iterable<dynamic> list() {
  return [2, null, 2];
}

Future<int> intt2(int? a) {
  return Future.delayed(const Duration(seconds: 1), () {
    if (a != null) {
      return a * 3;
    } else {
      return 0;
    }
  }); //setTImeout
}

class Testtt {
  final String value1;
  final String value2;

  Testtt(this.value1, this.value2);
}

class TypeClass<type1, type2> {
  final type1 value1;
  final type2 value2;

  TypeClass(this.value1, this.value2);
}

Stream<int> intt3(int a) {
  return Stream.fromFuture(intt2(a)); //setTImeout
}

Stream<int> intt4(int a) {
  return Stream.periodic(const Duration(seconds: 1), (a) {
    return a * 2;
  }); //setTImeout
}

periodic() async {
  await for (final a in intt4(2)) {
    print(a);
  }
}

enum Testt { testt1, testt2, testt3 }

class Classs {
  final String string;
  Classs(this.string);
  // factory Classs.method() {
  //   return Classs('testtt');
  // }
}

abstract class AbstractClass {
  aMethod() => print('abstract');
}

class NClass extends AbstractClass {}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }