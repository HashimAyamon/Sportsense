import 'package:flutter/material.dart';

import 'bottomnav.dart';
import 'draw.dart';
class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  // static const data = [
  //   "https://5.imimg.com/data5/SELLER/Default/2022/9/VK/FQ/EG/17769549/ap0015.jpeg",
  //   "https://5.imimg.com/data5/SELLER/Default/2022/9/RL/ZT/GR/17769549/bkt001-5347-1000x1000.jpeg",
  //   "https://5.imimg.com/data5/SELLER/Default/2022/9/TE/IH/KW/17769549/bkt00125-1000x1000.jpeg",
  //   "https://5.imimg.com/data5/SELLER/Default/2022/9/OZ/MM/UW/17769549/bkt0041--1000x1000.jpg"
  // ];
  var label=['Home','Page1','Page2','Page3','Page4'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 32, 26, 48),
        // automaticallyImplyLeading: false,
        title: Text('SPORTSENSE',
        style: new TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: draw(),
      bottomNavigationBar: botnav(),
      body: Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/fixfix.png'),
        fit: BoxFit.cover,
         )
    ),

        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),

        //   child: GridView.count(
        //     crossAxisCount: 4,
        //     childAspectRatio: 0.5,
        //     children: List.generate(
        //       data.length,
        //           (index) => Padding(
        //         padding: const EdgeInsets.all(5.0),
        //         child: GestureDetector(
        //           child: Card(
        //             child: Column(
        //               children: [
        //                 Image.network(data[index]),
        //                 Padding(
        //                   padding: const EdgeInsets.all(10.0),
        //                   child: Text('${label[index]}'),
        //                 ),
        //
        //               ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
