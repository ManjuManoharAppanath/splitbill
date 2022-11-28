import 'package:flutter/material.dart';
class result extends StatefulWidget {

  double frnd;
  double tipp;
  String taxx;
  String totall;
  result(this.frnd,this.tipp,this.taxx,this.totall);

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  void initState() {
    super.initState();
    bill();
  }
  double res=0;
  bill()
  {
    double taxamnt=double.parse(widget.totall)*double.parse(widget.taxx)/100;
    double ans=(double.parse(widget.totall)+taxamnt+(widget.tipp))/widget.frnd;
    setState(() {
      res=ans;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: const EdgeInsets.only(left: 100,right: 100),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Align(alignment: Alignment.centerLeft,
            child: Text('Result',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,
            ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 100,
            width: double.maxFinite,
            color: Colors.orange,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Equally Divided',  style:
                      TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text('\$${res.round.toString()}',  style:
                      TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(children: [
                        Text('Friends',
                          style:
                          TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Tax',style:
                        TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('Tip',style:
                        TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ],
                      ),
                      SizedBox(width: 20,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${widget.frnd}',
                            style:
                            TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Text('${widget.taxx}%',style:
                          TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Text('\$${widget.tipp}',style:
                          TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        ],)
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Text('Everybody should pay \$${res.toStringAsFixed(2)}',  style:
          TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.orange,),
                  height: 50,
                  width: 100,

                  child: TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('Calculate Again ?',
                    style: TextStyle(fontSize: 18,color: Colors.white),),),),
              ),
            )
          ],)
        ],),
    ),
    );
  }
}

