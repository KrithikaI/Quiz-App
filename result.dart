import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase{
    var resultText="You got 0/3 correct";
    if(resultScore==50){
      resultText="You got all correct!";
    }
    else if(resultScore==40){
      resultText="You got 4/5 correct!";
    }
    else if(resultScore==30){
      resultText="You got 3/5 correct!";
    }
    else if(resultScore==20){
      resultText="You got 2/5 correct!";
    }
    else if(resultScore==10){
        resultText="You got 1/5 correct!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
       child: Column(
         children: <Widget>[
            Text(
              resultPhrase,
              style:TextStyle(fontSize:36, fontWeight: FontWeight.bold),    
              textAlign: TextAlign.center,  
          ),
          FlatButton(child:Text('Restart Quiz'),textColor: Colors.blue,onPressed: resetHandler,)
        ]
      ),
    );
  }
}