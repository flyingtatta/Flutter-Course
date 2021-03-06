# quiz_app
- To first run the app use `flutter run`
- every flutter app is a widget
- widgets contain other widgets

# Creating Normal Hello App 🍍
![image](https://user-images.githubusercontent.com/47095611/112745594-41322000-8fc7-11eb-9159-fc711cecb4f4.png)

For using the built in widgets
So we don't have to make our own widgets
```
import 'package:flutter/material.dart';
```

Runs the flutter app<br>
Draws something onto the Screen<br>
So we have to pass `MyApp()`<br>
The parenthesis instantiates the class
```
void main() {
  runApp(MyApp());
}
```
For **one expression** you can use this<br>
```
void main() => runApp(MyApp());
```

*Need to memorize this* (Automatically done by flutter) <br>
- returns a widget hence Widget <br>
- returns `MaterialApp()` to render the app which takes named arguments
  1. `home:` the core widget
  2. `Text('Hello!')` where that you want to display gets printed
- `@override` is a decorater provided by Flutter
  - makes the code clear and clear
  - overriding the build method
```
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Text('Hello!'));
  }
}

```

# Building a Widget Tree 🌲
![image](https://user-images.githubusercontent.com/47095611/112750279-5f0e7d80-8fe5-11eb-8e78-2391a9aaf85a.png)

`appBar:` is for the top title
  - `AppBar()` for the contents inside it
  - `title: Text()`<br>

```
return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Text('This is my default text! '),
      ),
    );
```

![image](https://user-images.githubusercontent.com/47095611/112751682-de537f80-8fec-11eb-8f9c-c74288b2c93e.png)


`body:` is for the contents inside it
  - Cannot add more widgets inside a body
  - List is a group of data 
  - `<Widget>[]` is a group of widgets
  - `RaisedButton()` or `ElevatedButton()` either of them can be used
  

```
body: Column(
          children: <Widget>[
            Text('The Question!'),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: null,
            ),
          ],
        ),
  ```
  # Connecting Fuctions & Buttons 🔗
  
  ![image](https://user-images.githubusercontent.com/47095611/112752088-ec0a0480-8fee-11eb-9141-d7a84483a716.png)

  
  ![image](https://user-images.githubusercontent.com/47095611/112752080-e2809c80-8fee-11eb-9702-59c950b532ed.png)

```
class MyApp extends StatelessWidget {
  void answerQuestion() {
    print('Answer Chosen!');
  }

  @override
  Widget build(BuildContext context) {
    var questions = ["What's your fav color", "What's your fav animal"];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Text('The Question!'),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: null,
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
```
All The functions that work inside the class should be in the class *stand alone classes*
```
void answerQuestion() {
    print('Answer Chosen!');
  }
```
:heavy_check_mark: `onPressed: answerQuestion` 

:x: `onPressed: answerQuestion()` 

because it is not executing the function
```
RaisedButton(
              child: Text('Answer 1'),
              onPressed: answerQuestion,
            ),
```

## Anonymous Functions
```
onPressed: () => print('Answer 2 chosen!'),
```
```
onPressed: () {
                print('Answer 3 Chosen!');
              },
```
## Accessing the elements inside the list
```
children: <Widget>[
            Text(questions[0]),
```
```
children: <Widget>[
            Text(questions.elementAt(0)),
```
## Stateless vs Stateful
| Stateless | Stateful |
|-----|-----|
| Input Data :arrow_right: Widget :arrow_right: Renders UI | Input Data :arrow_right: Widget + Internal State :arrow_right: Renders UI |
| Data can change(externally) | Data can change(externally) |
| Gets (re)-rendered when input data changes | Gets (re)-rendered when input data or local State changes |

## Converting stateless to Statefull
1. First we create a class 
   - Returns `MyAppState()` so this is connected to the main class
```
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}
```
2. The main class where all the code is
   - `<MyApp>` is a pointer to the MyApp class which is a stateful widget
```
class MyAppState extends State<MyApp> {
```
Private class
  - Can be only used inside the main.dart file
```
class _MyAppState extends State<MyApp> {
```

3. Functions where things have to be changed are written
   - `seState()` allows only the specific values that have to be changed to change rather than the app waiting on all the values to change which would cause it to slow down
```
void answerQuestion() {
    setState(() {
      questionIndex++;
    });   
  }
```

# Widget from a new file 📁
**question.dart**
```
import 'package:flutter/material.dart';

class Question extends StatelessWidget {  
  final String questionText;

  Question(this.questionText);
  
  @override
  Widget build(BuildContext context) {
    return Text(questionText);
  }
}
```
- `final String questionText;` value will never change after its initialization in the constructor<br>
`Question(this.questionText);` :arrow_right: **positional argument**<br>
`Question({this.questionText});` :arrow_right: **named argument**

**main.dart**
```
children: <Widget>[
            // calls the question file
            Question(questions[_questionIndex]),
```
- `import './question.dart';` importing the `question.dart` file 
- `Question()` constructor that calls the class and passes the value

## Styling & Layout
```
return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
```
1. First wrap the content inside into a container
2. `width: double.infinity,` allow the width of the content to be set to infinity
3. `margin: EdgeInsets.all(10),` this sets the padding around the entire content, `EdgeInsets.only()` allows for a specific side
    - padding is the internal spacing of the content
    - border can be given to the outer portion of the content
    - margin is a spacing that is given to the entire content
4. Text styling
```
 style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
```

# Passing Callback Functions Around 🤙
![image](https://user-images.githubusercontent.com/47095611/112948729-09a5ae00-9156-11eb-80f8-f0856dc7fa1a.png)

`answer.dart`
```
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // Value has to be a function
  final Function selectHandler;

  //Constructor storing the function
  Answer(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Answer 1'),
          // Using the function
          onPressed: selectHandler,
        ));
  }
}
```
`final Function selectHandler;` specifies that the value that is being passed is supposed to be a function, `final` defines that it cannot be changed

`Answer(this.selectHandler);` the constructor is storing the pointer to the function

`onPressed: selectHandler` passes the pointer to the `_answerQuestion` function

- **Button Styling**
  1. `color: Colors.blue` sets the color to blue
  2. `textColor: Colors.white` text color is set to white


`main.dart`
```
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = ["What's your fav color", "What's your fav animal"];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]),            
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
          ],
        ),
      ),
    );
  }
}

```
`import './answer.dart';` imports the answer file for displaying the buttons

`Answer(_answerQuestion)` is a pointer to the `_answerQuestion` function without the paranthesis because you want to execute the function *forwards the pointer to the function*


# Mapping Lists To Widgets 🗺️
![image](https://user-images.githubusercontent.com/47095611/112953998-9c951700-915b-11eb-8a98-f08d926e2d56.png)


`main.dart`
```
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Map is a collection of key value pairs
    // key could be a number or string
    // Shorthand way to make it long way is using Map()
    var questions = [
      {
        'questionText': "What's your fav color? ",
        'answers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': "What's your fav animal? ",
        'answers': ['Dog', 'Cat', 'Lion', 'Zebra']
      },
      {
        'questionText': "Who's your fav instructor? ",
        'answers': ['Hamzz', 'Hamzz', 'Hamzz', 'Hamzz']
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[_questionIndex]['questionText']),

            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              // returns an answer widget

              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
```

- `var question = [{}]` mapping
  1. Map is a collection of key value pairs
  2. Key could be a number or string, `'questionText':` & `'answers':` are the two keys
  3. Shorthand way to make it long way is using the `Map()` class
 
- `Question(questions[_questionIndex]['questionText'])` 
  1. First calls the questions function
  2. `[_questionIndex]` is firstly mapped
  3. `['questionText']` with the same index is read and sent to the Question constructor

```
...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              // returns an answer widget

              return Answer(_answerQuestion, answer);
            }).toList()
```
1. `...` is a spread operator
 - It takes a list and they pull all the values out of the list
 - Then adds them to the surrounding list as individual values
2. `(questions[_questionIndex]['answers'] as List<String>).map((answer){`
  - `questions[_questionIndex]['answers']` maps the answers of the current index
  - `List<String>` prepares the map function that a List full of Strings is going to be sent to the `.map((answer)
  - `.map((answer)` stores the value in the field answer
3. `return Answer(_answerQuestion, answer);` calls the constructor in the `answer.dart` file passing the fucntion and the answer text
4. `.toList()` generates a new list

`answer.dart`
```
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          child: Text(answerText),
          onPressed: selectHandler,
        ));
  }
}
```
`final String answerText;` adding another variable that will catch the answers that have been sent from the map function

 `Answer(this.selectHandler, this.answerText);` the answers will then be stored in this contructor
 
 `child: Text(answerText),` and printed using this Text box

# final vs const ♾️
- const - compiled time constant (implicitly means run time constant)
- all objects are stored in memory,
- the objects what dart stores in thevariables are the pointers at the objects in the memory, so the addresses of the objects in memory stores the object only once and takes the address in different places
- when we turn a variable into a constaant it implicitly also treats the value as a constant
- if the value will never change make it a const

:heavy_check_mark: `var dummy = ['Hello'];`

:x: `var dummy = const ['Hello'];` Const would give a error cause we can't change the value
- Modifies the original list
`dummy.add('Max'); `



# 'if' Statements

| and |  | Yields |
|-----|-----|-----|
| True | True | True |
| True | False | False |
| False | False | False |

| or |  | Yields |
|-----|-----|-----|
| True | True | True |
| True | False | True |
| False | False | False |

![image](https://user-images.githubusercontent.com/47095611/113052870-46f55480-91c5-11eb-8ff2-ae122939a2d7.png)

`main.dart`
```
final questions = const [
    {
      'questionText': "What's your fav color? ",
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': "What's your fav animal? ",
      'answers': ['Dog', 'Cat', 'Lion', 'Zebra']
    },
    {
      'questionText': "Who's your fav instructor? ",
      'answers': ['Hamzz', 'Hamzz', 'Hamzz', 'Hamzz']
    }
  ];
```
We have to define the variables as final - const when using them outside the build method

```
if (_questionIndex < questions.length) {
      print('We have more questions');
    } else {
      print('No mo');
    }
```
Simple if else statements checking the length

```
body: _questionIndex < questions.length
            ? Column(
                children: <Widget>[
                  Question(questions[_questionIndex]['questionText']),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            // else block
            : Center(child: Text('You did it')),
```
The stuff after the ? gets executed if true, for else stuff after the `:` gets executed

# Splitting the App into Widgets 💔
`quiz.dart`
```
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(answerQuestion, answer);
        }).toList()
      ],
    );
  }
}
```
Creating a new file for displaying the answers

`final List<Map<String, Object>> questions;` defining the questions in a variable, setting the type since it's a map

```
Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});
```
anything inside {} is a named parameter

`result.dart`
```
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('You did it'));
  }
}
```
Result page is the final page displaying the output after the last question

`main.dart`
```
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  final _questions = const [
    {
      'questionText': "What's your fav color? ",
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': "What's your fav animal? ",
      'answers': ['Dog', 'Cat', 'Lion', 'Zebra']
    },
    {
      'questionText': "Who's your fav instructor? ",
      'answers': ['Hamzz', 'Hamzz', 'Hamzz', 'Hamzz']
    }
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No mo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        // if true after question mark it runs
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(),
      ),
    );
  }
}
```

```
Quiz(
     answerQuestion: _answerQuestion,
     questionIndex: _questionIndex,
     questions: _questions)
: Result()
```
Sending the variables to the `quiz.dart` file, and then calling the Result file


# Getters & 'else-if' 🤲
`quiz.dart`
```
import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {

          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
```
Only address is passed using `() =>`, now it executes the function with the score variable

`result.dart`
```
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);


  String get resultPhrase {
    var resultText = 'You did it';
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 16) {
      resultText = 'You are strange';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      resultPhrase,
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}
```
Getter is a mixture of propety and method 

`String get resultPhrase {`
1. Type of value you want to derive
2. Add `get` keyword and any word you want

`main.dart`
```
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No mo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        // if true after question mark it runs
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore),
      ),
    );
  }
}
```

# Resetting the quiz
`result.dart`

```
final Function resetHandler;
Result(this.resultScore, this.resetHandler);

@override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        FlatButton(child: Text('Restart Quiz!'), onPressed: resetHandler)
      ],
    ));
  }
```

`main.dart`
```
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
```
`: Result(_totalScore, _resetQuiz),`
