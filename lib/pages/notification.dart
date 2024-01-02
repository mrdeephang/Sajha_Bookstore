/*
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  SpeechToText speechToText=SpeechToText();
  var text="Hold the Button";
  var isListening=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
       // endRadius:75,
        animate: isListening,
        duration: Duration(milliseconds:2000 ),
        glowColor: Colors.deepPurple,
        repeat: true,
       // repeatPauseDuration: Duration(milliseconds: 100),
        //showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
           if(!isListening){
            var available=await speechToText.initialize();
            if(available){
              setState(() {
                isListening=true;
                speechToText.listen(
                  onResult: (result){
                    setState(() {
                      text=result.recognizedWords;
                    });
                  }
                );
              });
            }
           }
          },
          onTapUp: (details) {
            setState(() {
              isListening=false;
            });
            speechToText.stop();
          } ,
          child: CircleAvatar(
            backgroundColor: Colors.deepPurple,
            radius: 35,
            child: Icon(isListening ? Icons.mic:Icons.mic_none,color: Colors.white,),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text('Voice Search',style: TextStyle(fontWeight: FontWeight.bold,color: isListening? Colors.black: Colors.grey),),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width*0.7,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
          margin: EdgeInsets.only(bottom: 150),
          child: Text(text,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
*/