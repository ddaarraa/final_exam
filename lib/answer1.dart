
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'โปรไฟล์ผูใช้', email: "johndoe@example.com", imageUrl: "https://cdn-icons-png.flaticon.com/512/3135/3135715.png", phoneNumber: "0987654321", name: "John Doe",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.email, required this.imageUrl, required this.name, required this.phoneNumber });

  final String title;
  final String imageUrl;
  final String name;
  final String email;
  final String phoneNumber;
  
  get onTap => null;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            height: 200,
            child: 
              Center(child: 
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.imageUrl),
                      radius: 40,
                    ),
                    SizedBox(height: 20,),
                    Text("Username : ${widget.name}"),
                    SizedBox(height: 10,),
                    Text("Email : ${widget.email}",style: TextStyle(color: const Color.fromARGB(138, 96, 125, 139)),),
                  ]
                ),
              )
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child:
            Column(children: [
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.blue),
                  title: Text("การตั้งค่า"),
                ),
                ListTile(
                  leading: Icon(Icons.lock, color: Colors.blue),
                  title: Text("เปลี่ยนรหัสผ่าน"),
                ),
                ListTile(
                  leading: Icon(Icons.privacy_tip, color: Colors.blue),
                  title: Text("privacy"),
                )
              ],)
          ),
          SizedBox(height: 20,),
          Center(
            child: 
            Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("แก้ไขโปรไฟล์"))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red),
                    child: const Text('แก้ไขโปรไฟล์'),
                  ),
                SizedBox(height: 10,),
                ElevatedButton(
                  
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("ออกจากระบบ"))
                      );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red),
                      child: const Text('ออกจากระบบ'),
                ),
              ],
            ),
          )
        ]
      )
  

    );
  }
}