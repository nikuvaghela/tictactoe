import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home:nik() ,));
}
class nik extends StatefulWidget {
  const nik({Key? key}) : super(key: key);

  @override
  State<nik> createState() => _nikState();
}

class _nikState extends State<nik> {
  int cnt=0;
  List l = List.filled(9, "");
  String p1="X";
  String p2="O";
  String msg ="GAME IS RUNNING";
  int w=0;
  Widget mybtn(int i){
    return Expanded(child: InkWell(
      onTap: () {
        if(l[i]=="" && w==0)
          {
            if(cnt%2==0)
              {
                l[i]=p1;
              }
            else
              {
                l[i]=p2;
              }
            cnt++;
            Win();
            setState(() {

            });

          }
      },
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: l[i]=="" ? Colors.lightGreen :(l[i]==p1 ? Colors.lightBlueAccent:Colors.purpleAccent),
        ),

        margin: EdgeInsets.all(10),
        child: Text(l[i],
        style: TextStyle(fontSize: 50),),
      ),
    ));
  }
  Win(){
    if((l[0]==p1 && l[1]==p1 && l[2]==p1 )||
        (l[3]==p1 && l[4]==p1 && l[5]==p1 )||
        (l[6]==p1 && l[7]==p1 && l[8]==p1 )||
        (l[0]==p1 && l[3]==p1 && l[6]==p1 )||
        (l[1]==p1 && l[4]==p1 && l[7]==p1 )||
        (l[2]==p1 && l[5]==p1 && l[8]==p1 )||
        (l[0]==p1 && l[4]==p1 && l[8]==p1 )||
        (l[2]==p1 && l[4]==p1 && l[6]==p1 )){
      msg ="$p1 is winner";
      w=1;
    }
    else if((l[0]==p2 && l[1]==p2 && l[2]==p2 )||
        (l[3]==p2 && l[4]==p2 && l[5]==p2 )||
        (l[6]==p2 && l[7]==p2 && l[8]==p2 )||
        (l[0]==p2 && l[3]==p2 && l[6]==p2 )||
        (l[1]==p2 && l[4]==p2 && l[7]==p2 )||
        (l[2]==p2 && l[5]==p2 && l[8]==p2 )||
        (l[0]==p2 && l[4]==p2 && l[8]==p2 )||
        (l[2]==p2 && l[4]==p2 && l[6]==p2 )){
      msg ="$p2 is winner";
      w=1;
    }
   else if(cnt==9)
    {
         msg="Game is Draw";
         w=1;
    }
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TICTAC"),
        
      ),
      body: Column(children: [
        Container(
          height: 50,
          alignment: Alignment.center,
          width: double.infinity,
          child: Text(msg),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: Colors.teal,
          ),

        ),
        Expanded(
              child: Row(
                children: [
                  mybtn(0),
                  mybtn(1),
                  mybtn(2),
                ],
              ),
            ),
        Expanded(
          child: Row(
            children: [
              mybtn(3),
              mybtn(4),
              mybtn(5),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              mybtn(6),
              mybtn(7),
              mybtn(8),
            ],
          ),
        ),
        ElevatedButton(onPressed:() {
          cnt=0;
           l = List.filled(9, "");
           String msg ="Game is runnig";
          w=0;
           setState(() {
            
           });
           
        }, child: Container(
          height: 50,
          width: double.infinity,
          child: Text("RESET",style: TextStyle(fontSize: 25),),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.elliptical(10, 27))
          ),

          alignment: Alignment.center,
        )
        ),




        ],)
        );
  }
}
