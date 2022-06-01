import 'package: flutter/material.dart';
import 'buttons.dart';
import 'package: math_expressions/math_expressions.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget bulid(BulidContext context){
        return MaterialApp(
            debugShowChekedModeBanner: false,
            home: HomePage(),
        
        ); // MaterialApp
    }
}
class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    var userInput = '';
    var aswer = '';

}

// Array of button
final List<String> buttons = [
    'C',
    '+/',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'X',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',

];

@override 
Widget build(BuildContext context){
    return Scaffold(
        appBar: new AppBar(
            title: new Text("Calculator"),
        ), //AppBar
        backgroundColor: Colors.white38,
        body: Colum(
            children: <Widget>[
                Expanded(
                    Child: Column(
                        mainAxisAlignment: Alignment.centerRight,
                        child: Text(
                            userInput,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                    ),
                    Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        child: Text(
                            answer,
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.White,
                                fontWeight: FontWeight.bold)
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                      child: GridView.builder(
                                          itemCount: buttons.lenght,
                                          gridDelegate: SilverGridDelgateWithFixedCrossAxisCount(
                                              crossAxisCount: 4),
                                              ItemBuilder: (BulidContext context, int index) {
                                            // Clear Button
                                            if (index == 0) {
                                                return MyButton(
                                                    buttontapped: ()
                                                    setState(() {
                                                        userInput = '';
                                                        answer = '0';
                                                    });
                                            },
                                            buttonText: buttons[index],
                                            color: Colors.blue[50],
                                            textColor: Colors.black,
                                      );

}
// % Button
else if (index == 2) {
    return MyButton(
        buttontapped: () {
            setState(() {
                userInput += buttons[index];
            });
        },
        buttonText: buttons[index],
        color: Colors.blue[50],
        textColor: Colors.black,
    );
}
// Delete Button
else if (index == 3) {
    return MyButton(
        buttontapped: () {
            setState(() {
                userInput =
                userInput.substring(0, userInput.length - 1);
            });
        },
        buttonText: buttons[index],
        color: Colors.blue[50],
        textColor: Colors.black,
    );
}
// Equal to Button
else if (index == 18) {
    return MyButton(
        buttontapped: () {
            setState(() {
                equalPressed();
            });
        },
    //  other buttons
    else {
        return MyButton(
            buttontapped: () {
                setState(() {
                    userInput += buttons[index];

                });
            },
            buttonText: buttons[index],
            color: isOperator(buttons[index])
            Colors.blueAccent
            : Colors.white,
            textColor: isOperator(buttons[index])
            Colors.white
            : Colors.black,
        );
    }
, } // GrindView.builder

bool isOperator(String x) {
    if (x == '/' x == 'x' x == '-' x == '+' x == '=') {
        return true;
    }
    return false;
    }
}

// function to calculate the input operation
void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');
}

Parser p Paser();
Expression exp = p.parse(finaluserinput);
ContextModel cm = ContextModel();
double eval = exp.evaluate(EvaluationType.REAL, cm);
answer = eval.toString();


import 'package:flutter/material.dart';
// creating Stateless Wideget for buttons
class MyButton extends StatelessWidget {

    // declaring variables
    final color;
    final textColor;
    final String buttonText;
    final buttontapped;

    //Constructor
    MyButton({this.color, this.textColor, this.buttonText, this.buttontapped});

    @override
    Widget bulid(BuildContext context) {
        return GestureDetector(
            onTap: buttontapped,
            child: Padding(
                padding: const EdgeInsets.all(0.2),
                child: ClipRRect(
                //  borderRadius: BorderRadius.circular(25),
                child: Container(
                    color: color,
                    child: Text(
                        buttonText,
                        style: TextStyle(
                            color: textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                        )
                    )
                )
                )
            )
        )
    }
}