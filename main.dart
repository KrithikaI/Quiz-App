import 'package:quiz_app/result.dart';

import './quiz.dart';
import 'package:flutter/material.dart';
import './answer.dart';
import './result.dart';

void main(){
  runApp(MyApp());
}

//void main() =>runApp(MyApp());--- when we have only 1 statement in main()

class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  final _questions=const [//Map inside 
      {'questionText':"Entomology is the science that studies?", 
      'answers':[
        {'text':'Human Behaviour','score':0},
        {'text':'Insects','score':10},
        {'text':'Formation of Rocks','score':0},
        {'text':'Birds','score':0}
      ],
      },
      {'questionText':"Which of these is the world's smallest country?", 
      'answers':[
        {'text':'Canada','score':0},
        {'text':'Russia','score':0},
        {'text':'Maldives','score':0},
        {'text':'Vatican City','score':10}
      ],
      },
      {'questionText':"Which of these actor's debut movie is MASAAN?", 
      'answers':[
        {'text':'Aayushman Khurranna','score':0},
        {'text':'Vicky Kaushal','score':10},
        {'text':'Nawazzuddin Siddique','score':0},
        {'text':'Irfan Khan','score':0},
      ],
      },
      {'questionText':"From which Indian organization, the four personnel have been selected for training in Russia for the Gaganyaan Mission, that is going to be launched in 2022?",
      'answers':[
          {'text':'ISRO','score':0},
          {'text':'IAF','score':10},
          {'text':'MARCOS','score':0},
          {'text':'Indian Navy','score':0},
          
        ],
      },
      {'questionText':'Which nation has recently banned the \'reef toxic\' sunscreen?',
      'answers':[
        {'text':'Australia','score':0},
        {'text':'New Zealand','score':0},
        {'text':'Palau','score':10},
        {'text':'Nauru','score':0},
      ]
      }
      
    ];
  
  var _questionIndex=0;//class variable also called property
  var _totalScore=0;

  void _resetQuiz(){
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });
   
  }

  void _answerQuestion(int score){

    _totalScore+=score;

    setState(() {
      _questionIndex=_questionIndex+1;
    });
    print(_questionIndex);
    if(_questionIndex< _questions.length){
      print('We have more questions!');
    }
  }


  @override
  Widget build(BuildContext context){
    //return MaterialApp(home: Text('Hello!'),);//MaterialApp-class
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
       body: _questionIndex< _questions.length 
       ? Quiz(answerQuestion: _answerQuestion,questionIndex: _questionIndex,questions: _questions, )
        : Result(_totalScore, _resetQuiz)
      ),
    );
  }
}
