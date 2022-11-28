import 'package:flutter/material.dart';
import 'package:splitbill/result.dart';
void main() {
  runApp(MaterialApp(home: const MyApp(),
  ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double friends=0;
  double tip=0;
  String total='';
  String tax='';
  // List cn=['1','2','3','4','5','6','7','8','9','.','0','-'];
  fun(String num)
  {
    return Expanded(child: OutlinedButton(onPressed: (){
      setState(() {
        if(num=='-')
          {
            total='0';
          }
        else
          {
            total =total+num;
          }
      });
    },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text('$num',
            style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
        )));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:
        Center(
          child: SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              child: Column(
                children: [
                  Align(alignment: Alignment.centerLeft,
                      child: Text('Split bill',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(color: Colors.orange,
                      height: 100,
                      width: double.maxFinite,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Total',style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text('$total',style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Friends',
                                      style:
                                      TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    Text('Tax',style:
                                    TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    Text('Tip',style:
                                    TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  ],),
                                SizedBox(width: 20,),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('$friends',
                                      style:
                                      TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    Text('$tax%',style:
                                    TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    Text('\$${tip}',style:
                                    TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  ],)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('How many Friends ?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 20,),
                  Slider(value: friends,
                      min: 0,
                      max: 20,
                      divisions: 20,
                      activeColor: Colors.orange,
                      inactiveColor: Colors.blueGrey,
                      onChanged: (value)
                  {
                  setState(() {
                    friends=value;
                  });
                  }
                  ),
                   Row(children: [
                    Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                      color: Colors.orange,
                    ),
                      height: 150,
                      width: 500,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('TIP',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FloatingActionButton(backgroundColor: Colors.blueGrey,
                                onPressed: (){
                                setState(() {
                                  tip--;
                                });
                                },child: Icon(Icons.minimize,),),
                              Text('\$${tip}',style: TextStyle(fontWeight: FontWeight.bold),),
                              FloatingActionButton(backgroundColor: Colors.blueGrey,
                                onPressed: (){
                                setState(() {
                                  tip++;
                                });
                                },child: Icon(Icons.add,),),
                            ],
                          ),
                        ],
                      ),
                    ),
                     SizedBox(width: 50,),
                     Container(decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(20)),
                       height: 150,
                       width: 300,
                       child: Padding(
                         padding: const EdgeInsets.all(10),
                         child: TextField(onChanged: (value){
                           setState(() {
                             tax=value;
                           });
                         },
                           decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                             contentPadding: EdgeInsets.symmetric(vertical: 70),
                             label: Text('Tax in $tax%'),
                         ),
                         ),
                       ),
                     ),
                  ],
                  ),
                  SizedBox(height: 20,),
                  // GridView.count(shrinkWrap: true,
                  //   crossAxisCount: 3,
                  // mainAxisSpacing: 5,
                  //   crossAxisSpacing: 5,
                  // children: [
                  //   ListView.builder(shrinkWrap: true,
                  //       itemCount:cn.length,itemBuilder: (BuildContext context,int i)
                  //   {
                  //     return Container(
                  //       height: 100,
                  //         child: Center(child: Text('$cn[i]')),
                  //     );
                  //   }
                  //   ),
                  // ],
                  // ),
                  // Container(height: 50,
                  //   width: 100,
                  //   color: Colors.green,
                  //   child: TextButton(onPressed: (){}, child: Text('Splitt Bill',
                  //     style: TextStyle(fontSize: 18,color: Colors.white),),),)
                  Row(children: [
                    fun('1'),
                    fun('2'),
                    fun('3'),
                  ],),
                  Row(children: [
                    fun('4'),
                    fun('5'),
                    fun('6'),
                  ],),
                  Row(children: [
                    fun('7'),
                    fun('8'),
                    fun('9'),
                  ],),
                  Row(children: [
                    fun('.'),
                    fun('0'),
                    fun('-'),
                  ],),
                  SizedBox(height: 10,),
                  Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green,),
                          height: 50,
                          width: 100,

                          child: TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>result(friends,tip,tax,total)),);
                          }, child: Text('Splitt Bill', style: TextStyle(fontSize: 18,color: Colors.white),),),),
                      ),
                    )
                  ],)
                ],
              ),
            ),
          ),
          ),
    );
  }
}
