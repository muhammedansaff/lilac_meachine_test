import 'package:flutter/material.dart';

class Requirementdcreen extends StatelessWidget {
  const Requirementdcreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("Requirement List"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(padding: EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Colors.white),
                height: 200,
                child:  Column(mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                  const Text(
                    "Rolls Roys Ghost standard(2000)",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Row(
                    children: [
                      Text("Transmission"),
                      Spacer(),
                      Text("Automatic")
                    ],
                  ),
                  const Row(
                    children: [
                      Text("Fuel"),
                      Spacer(),
                      Text("Petrol")
                    ],
                  ),
                  const Row(
                    children: [
                      Text("Color"),
                      Spacer(),
                      Text("Black")
                    ],
                  ),
                Switch(
          value: true,
          
          activeColor: Color(0xFF4A101D),
          inactiveThumbColor: Colors.grey, onChanged: (bool value) {  },
        ),
                ]),

              )
            ],
          ),
        ) // Loading indicator while fetching data
        );
  }
}
