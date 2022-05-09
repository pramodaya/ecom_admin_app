import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom_admin_app/routes.dart';
import 'package:ecom_admin_app/screens/add_product/view_model/add_product_view_model.dart';
import 'package:ecom_admin_app/screens/authantication/authantication_iew_model/authantication_service.dart';
import 'package:ecom_admin_app/screens/order/view_model/order_view_model.dart';
import 'package:ecom_admin_app/theme.dart';
import 'package:ecom_admin_app/user_list/view_models/user_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthanticationService>(
          create: (_) => AuthanticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthanticationService>().authStateChanges,
          initialData: null,
        ),
        ChangeNotifierProvider(create: (_) => UsersViewModel(),),
        ChangeNotifierProvider(create: (_) => AddProductViewModel(),),
         ChangeNotifierProvider(create: (_) => OrderViewModel(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        // home: AuthanticationWrapper(),
        // We use routeName so that we dont need to remember the name
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}

// class TestHome extends StatelessWidget {
//   const TestHome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("testing"),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => FirebaseFirestore.instance
//             .collection('testing').doc()
//             .add({'timestamp': Timestamp.fromDate(DateTime.now())}),
//         child: Icon(Icons.add),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('testing').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) return const SizedBox.shrink();
//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (BuildContext context, int index) {
//               final docData = snapshot.data!.docs[index].data();
//               // final dateTime = (docData!['timestamp'] as Timestamp).toDate();
//               return ListTile(
//                 title: Text(docData.toString()),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class LoginHomePage extends StatelessWidget {
//   const LoginHomePage({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: 
//       Column(
//         children: [
//           Text('Home'),
//           RaisedButton(onPressed: (){
//             context.read<AuthanticationService>().signOut();
//           },
//           child: Text("Sign out"),)
//         ],
//       )
//     );
//   }
// }

// class SignInPage extends StatelessWidget {

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: "Email"
//               ),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(
//                 labelText: "Password"
//               ),
//             ),
//             RaisedButton(onPressed: (){
//               context.read<AuthanticationService>().signIn(
//                 context,
//                 emailController.text.trim(),
//                 passwordController.text.trim()
//               );
//             },
//             child: Text("Sign In"),)
//           ],
//         ),
//       ),
//     );
//   }
// }

