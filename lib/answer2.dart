

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  
  get onTap => null;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? weight = 0;
  String? _selectedItem ;
  double? _specialPackaging;
  double? _warranty;
  double _deliveryMode = 0 ;

  double totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Price Calculator"),
      ),
      body: 
        // TextField(
        //   onChanged: (value) => widget.name = value,
        //   controller: TextEditingController(text: widget.name),
        //   decoration: const InputDecoration(labelText: 'Name'),
        // ),
        
        Column (children: [
          SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'น้ําหนักสินค้า',
                // prefixIcon: Icon(Icons.person),
                // hintText: "Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1.0)))),
            validator: (value) {
              if (value == null || value.isEmpty) {}
              return null;
            },
            onChanged: (value) {
              // print(value);
              setState(() {
                weight = double.tryParse(value);
                
              });
            },
          ),
          SizedBox(height: 20,),
          DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "เลือกระยะทาง"),
                value: _selectedItem,
                items: ["ในเมือง", "ต่างจังหวัด", "ต่างประเทศ)"]
                    .map((item) => DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        ))
                    .toList(),
                onChanged: (value) =>{
                    value == null ? 'Please select an option' : null,
                    _selectedItem = value }
            ),
          SizedBox(height: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Additional Service",
              // textAlign: TextAlign.start,
              ),
              Column(
                children: [
                  RadioListTile(
                    title: const Text("Special Packaging (+20Baht)"),
                    value: 20,
                    toggleable: true,
                    groupValue: _specialPackaging,
                    onChanged: (value) {
                      setState(() {
                        
                        _specialPackaging = value?.toDouble();
                        
                        print(_specialPackaging);
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("Warranty (+50Baht)"),
                    value: 50,
                    toggleable: true,
                    groupValue: _warranty,
                    onChanged: (value) {
                      setState(() {
                        
                        _warranty = value?.toDouble();
                        
                        print(_warranty);
                      });
                  },
                ),
              ]
                
              )
              
            ],
          ),
          SizedBox(height: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Delivery Type",
              // textAlign: TextAlign.start,
              ),
              Column(
                children: [
                  RadioListTile(
                    title: const Text("Normal"),
                    value: 0,
                    // toggleable: true,
                    groupValue: _deliveryMode,
                    onChanged: (value) {
                      setState(() {
                        
                        _deliveryMode = value!.toDouble();
                        
                        print(_deliveryMode);
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text("Priority"),
                    value: 30,
                    // toggleable: true,
                    groupValue: _deliveryMode,
                    onChanged: (value) {
                      setState(() {
                        
                        _deliveryMode = value!.toDouble();
                        
                        print(_deliveryMode);
                      });
                  },
                ),
                RadioListTile(
                    title: const Text("Priviliege "),
                    value: 50,
                    // toggleable: true,
                    groupValue: _deliveryMode,
                    onChanged: (value) {
                      setState(() {
                        
                        _deliveryMode = value!.toDouble();
                        
                        print(_deliveryMode);
                      });
                  },
                ),
                ]
                
              )
              
            ],
          ),
          SizedBox(height: 20,),
          Center(
            child: 
            Column(
              children: [
                ElevatedButton(
                  
                  onPressed: () async {
                    setState(() {
                      totalPrice = calculator(weight!, _selectedItem!, _specialPackaging, _warranty, _deliveryMode);
                      print("total ${totalPrice}");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red),
                      child: const Text('ออกจากระบบ'),
                ),
                Text("Total Price : ${totalPrice}")
              ],
            ),
          )
        ],
      )

    );
  }

  double calculator(double? weight, String? destination , double? specialPack, double? warranty, double deliverMode) {
    double destination_prize = 0 ;
    double specialPackPrize = 0;
    double warrantyPrize = 0;
    if(weight!= null){
      if(destination == "ในเมือง"){
        destination_prize = weight*10;
      }else if (destination == "ต่างจังหวัด"){
        destination_prize = weight*15;
      }else {
        destination_prize = weight*50;
      }
    }

    if(specialPack != null){
      specialPackPrize = specialPack;
    }

    if(warranty!= null){
      warrantyPrize = warranty;
    }
    return destination_prize + specialPackPrize + warrantyPrize + deliverMode ;
  }
}


