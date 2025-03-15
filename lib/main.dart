import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

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
      home: const MyHomePage(title: 'Flutter Demo Home Page', id: "640710178", imageUrl: "https://cdn-icons-png.flaticon.com/512/3135/3135715.png", phoneNumber: "0987654321", name: "Dara Sroin",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.id, required this.imageUrl, required this.name, required this.phoneNumber });

  final String title;
  final String imageUrl;
  final String name;
  final String id;
  final String phoneNumber;
  
  get onTap => null;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    bool isHovered = true;
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              // color: Colors.blue,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple], // Gradient colors
                begin: Alignment.topLeft, // Start position
                end: Alignment.bottomRight, // End position
                ),
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(20), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                    blurStyle: BlurStyle.normal
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HoverableAvatar(
                    imageUrl: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                    // onTap: () {
                    //   print('Avatar clicked!');
                    // },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                  ),
                  const SizedBox(height: 10),
                  Text(widget.id,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 84, 83, 83)
                    )
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    widget.phoneNumber,
                    style : const TextStyle(
                      fontSize: 15,
                      color: Colors.white
                    )
                  )
                ],
              ),
            )
          ]
        ),
      ), 
    );
  }
}


class HoverableAvatar extends StatefulWidget {
  final String imageUrl;
  // final VoidCallback onTap;

  const HoverableAvatar({
    super.key,
    required this.imageUrl,
    // required this.onTap,
  });

  @override
  _HoverableAvatarState createState() => _HoverableAvatarState();
}

class _HoverableAvatarState extends State<HoverableAvatar> {
  bool isHovered = false;

  void _launchURL() async {
    final Uri uri = Uri.parse("https://github.com/ddaarraa");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print('Could not launch ${widget.imageUrl}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: _launchURL,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: Colors.pink,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.imageUrl),
            radius: 40,
          ),
        ),
      ),
    );
  }
}
