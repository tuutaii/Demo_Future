
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Info.dart';
import 'package:flutter_application_1/InfoService.dart';


class UITest extends StatefulWidget {
  const UITest({ Key? key }) : super(key: key);

  @override
  _UITestState createState() => _UITestState();
}

class _UITestState extends State<UITest> {
  InfoService info =   InfoService(); 

  @override
  void initState(){
    super.initState();    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Align(
          child: Text(
            'Members'
            ),
            alignment: Alignment.center,
        ),
        ),
      body: FutureBuilder<List<Info>>(
        future: info.fetchInfo(),
        builder: (context, snapshot){
          if(snapshot.hasData){
           return ListView.builder(
             itemCount: snapshot.data?.length,
             itemBuilder: (BuildContext context, int index ){
               return buildInfo(snapshot.data![index]);
             });
          }else if(snapshot.hasError){
            return Text('$snapshot.error');
          }else{
            return const CircularProgressIndicator();
          }

        },
      ),
      
    );
  }
  Widget buildInfo(Info info){
    return Container( 
      color: Colors.redAccent,
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(10),
      child: 
      Row(        
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:[
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: SizedBox( height: 50, width: 50,
             child: ClipOval(
              child: Image.network(info.avatar, fit: BoxFit.cover,),
        ),
           ),
         ),
        Expanded(           
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children:[ 
              Row(  mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(info.name, style: 
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(info.age.toString() + ' Age'),
                  ),
                ],
              ),       
              Text(info.company),
              Text(info.address, style: 
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
              
              Container(
        
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: const BoxDecoration(
                  color:Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Text(info.bio) ,)
            ],
          ),
        ),
      ],),
    );
     
      //  Text(info.name),
              // Text(snapshot.data?.age.toString()??''),
              // Text(snapshot.data?.position??''),
              // Text(snapshot.data?.company??''),
              // Text(snapshot.data?.bio??''),
              // Text(snapshot.data?.job??''),
              // Text(snapshot.data?.isPremium.toString()??''),
              // Text(snapshot.data?.avatar??''),
              // Text(snapshot.data?.address??''),

// snapshot.data!.map((e) {
//                 return  buildInfo(e);}
//                 ).toList()
  } 
}


