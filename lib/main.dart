import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
TextEditingController url = new TextEditingController();
var appfont = 'Righteous', normfont = 'NotoSans';
void main() {
  runApp(MaterialApp(
    home: Typein(),
    routes: {
      'twitter': (home) => Output(),
      'nxtpage': (home) => TwitterPage(),
      'about': (home) => About(),
      'settings': (home) => Settings(),
      'faq':(home) => FAQ(),
    },
  ));
}
int x = 0 ;
var mapResponse = new Map();
Map threadstuff = new Map();
String twtid = '1435211920328445952';
String link = 'https://twitter.com/Kh2Khanna/status/1435644625029672961';
int questionremove = 0;
var output_txtcolor = Colors.white54, output_bgcolor = Colors.black;
double output_size = 18;
String datastuff = "";
class About extends StatelessWidget {
  @override
  Widget build(BuildContext about) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About App'),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: GestureDetector(
          child: IconButton(
            onPressed: () {
              Navigator.pop(about);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              print("Muhahahahahah");
            },
            child: Image.asset(
              'assets/Images/playstore.png',
              height: 128,
              width: 128,
            ),
          ),
          Text(
            'Rdrr',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 48),
          ),
          Text(
            'version: prealpha 1.18 build 19',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 15),
          ),
          Text(
            '\n \n The Twitter Thread reading app.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          Text(
            '\n \n  proudly created in Flutter by \n Harsh Chan',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          padd,
        ],
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(onPressed: (){
        print("FAQ page muhahahahahhahaha");
        Navigator.pushNamed(about, 'faq');
      },
        backgroundColor: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("FAQ"),
            Icon(Icons.question_answer_outlined,size: 20,color: Colors.white60,),
          ],
        ),
      ),
    );
  }
}
class Output extends StatefulWidget {
  @override
  output createState() => output();
}
class output extends State<Output> {
  @override
  Widget build(BuildContext sutput) {
    String d = "Thread by  ";
    d = d +
        "  @" +
        mapResponse['includes']['users'][0]['username'];
    ScrollController _controller = new ScrollController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          d,
          style: TextStyle(color: output_txtcolor),
        ),
        backgroundColor: output_bgcolor,
        centerTitle: true,
        leading: GestureDetector(
          child: IconButton(
            onPressed: () {
              Navigator.pop(sutput);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            ListView(
              primary: false,
              shrinkWrap: true,
              children: [
                Card(
                  color:output_bgcolor,
                  child: Text(
                    ('\t'+datastuff),
                    style: TextStyle(color: output_txtcolor, fontSize: output_size),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            x == 1? Container(
              child: Text(
                "\n either there is no more tweets in said thread, \n or the thread is more than a week old.",
                style: TextStyle(color: Colors.deepOrange,fontSize: output_size,),
                textAlign: TextAlign.center,),
            ) :
            ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: threadstuff['data'].length,
                itemBuilder: (sutput, index) {
                  var p = threadstuff['data'][index].keys.toList(); print(p); print('finally');
                  var c = threadstuff['data'][threadstuff['data'].length - 1 - index][p[1]];
                  return Card(
                    color:output_bgcolor,
                    child: ListTile(
                        title: Text(
                          c.toString(),
                          style: TextStyle(color: output_txtcolor,fontSize: output_size,),
                          textAlign: TextAlign.justify,)
                    ),
                  );
                }
            ),

          ],
        ),
        scrollDirection: Axis.vertical,
      ),
      backgroundColor: output_bgcolor,
    );
  }
}
class Typein extends StatefulWidget {
  @override
  typew createState() => typew();
}
class typew extends State<Typein> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              Text(
                'Rdrr',
                style: TextStyle(color: Colors.white70, fontSize: 42),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 50,
                width: 0,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'settings');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Settings",
                        style: TextStyle(color: Colors.white70, fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                      Icon(
                        Icons.settings_applications_sharp,
                        size: 35,
                        color: Colors.white70,
                      ),
                    ],
                  )),
              Container(
                height: 30,
                width: 0,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'about');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(color: Colors.white70, fontSize: 20),
                        textAlign: TextAlign.justify,
                      ),
                      Icon(
                        Icons.account_box_sharp,
                        size: 35,
                        color: Colors.white70,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title: Text(
          'Read all threads easily',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white54),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white70),
      ),
      body: Container(
        child: ListView(
          children: [
            padd,
            padd,
            padd,
            padd,
            padd,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 65,
                  width: 300,
                  color: Colors.white70,
                  child: TextField(
                    controller: url,
                    decoration: InputDecoration(
                        labelText: 'Paste url here',
                        alignLabelWithHint: true,
                        labelStyle:
                        TextStyle(fontSize: 18, color: Colors.black87)),
                  ),
                ),
                Container(
                  height: 65,
                  width: 65,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.white70,
                    ),
                    iconSize: 30,
                    onPressed: () {
                      url.text == '' ? print('nah ' + link) : link = url.text;
                      print(link);
                      Navigator.pushNamed(context, 'nxtpage');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
class TwitterPage extends StatefulWidget {
  @override
  _twitterapp createState() => _twitterapp();
}
class _twitterapp extends State<TwitterPage> {
  TweetData() {
    var dt = link.split('/');
    print(link);
    var xe;
    print(dt);
    twtid = dt[5];
    for (int i = 0; i < twtid.length; i++) {
      var se = twtid[i];
      se == '?' ? questionremove = 1 : print(questionremove);
    }
    questionremove == 1 ? xe = twtid.split('?') : xe = '';
    print(xe);
    xe == '' ? twtid = dt[5] : twtid = xe[0];
    print("ho gaya");
    mapResponse = " ipkojoko" as Map;
    threadstuff = " ipkojoko" as Map;
    x = threadstuff.length;
  }

  @override
  void initState() {
    TweetData();
    super.initState();
  }

  @override
  Widget build(BuildContext twitterpg) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: GestureDetector(
          child: IconButton(
            onPressed: () {
              Navigator.pop(twitterpg);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Text("Tap to Continue",style:TextStyle(fontSize: 20,color: Colors.white60))),
          Container(height: 10,),
          IconButton(
            onPressed: () {
              print(url.text);
              print("we moving biches");
              Navigator.pushNamed(twitterpg, 'twitter');
            },
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white60,
            ),
            iconSize: 70,
          )
        ],
      ),

    );
  }
}
class Settings extends StatefulWidget {
  @override
  _settings createState() => _settings();
} // Done today :)
var padd = Container(
  height: 40,
  width: 0,
);
class _settings extends State<Settings> {
  @override
  Widget build(BuildContext settings) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 20, color: Colors.white70),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(settings);
          },
          child: Icon(
            Icons.arrow_back_ios_sharp,
            size: 30,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Text("--- Output Window formatting ---",style: TextStyle(fontSize: 20,color: Colors.white70),textAlign: TextAlign.center,),
          padd, // padding
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 200,
              minHeight: 100,
              maxHeight: 100,
              maxWidth: 200,
            ),
            child: AnimatedContainer(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: output_bgcolor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xfffFF2399)),
                ),
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInCubic,
                child: Text(
                  "Sample Text",
                  style: TextStyle(
                    color: output_txtcolor,
                    fontSize: output_size,
                  ),
                  textAlign: TextAlign.center,
                )),
          ), //text
          padd,
          Container(
            child: Column(
              children: [
                Text("Size of Text",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    )),
                Slider(
                  value: output_size,
                  max: 32,
                  min: 13,
                  divisions: 4,
                  onChanged: (double value) {
                    setState(() {
                      output_size = value;
                    });
                    ;
                  },
                ), // mafi problem :)
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Small",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ), // Labels start here :P
                      Text(
                        "Medium",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Large",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          padd,
          Container(
            height: 75,
            child: Row(
              children: [
                Text(
                  "Color Scheme:   ",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffFAFFAF))),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          output_bgcolor = Colors.white54;
                          output_txtcolor = Colors.black;
                        });
                      },
                      child: Text(
                        "Light",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      )),
                ),
                Container(
                  width: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffFAFFAF))),
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          output_txtcolor = Colors.white54;
                          output_bgcolor = Colors.black;
                        });

                      },
                      child: Text(
                        "Dark",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      )),
                ),
              ],
            ),
          ),
          padd,
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
// Next on agenda -  storage ( future updates) and better queries to twitter api
class FAQ extends StatefulWidget{
  @override
  faq createState() => faq();
}
class faq extends State<FAQ>{
  @override
  Widget build(BuildContext questionsme) {
    List v = [0,1,2,3,4,5];
    Map pq = new Map();
    pq = {0:"Q) What does this app do? \n\n A) This app will unroll a long twitter thread and piece together sequential threads thereby making it a handy tool for reading long threads.\n", 1:"Q) How do I use this app? \n\n A) Click on share for the selected tweet, select the copy link option and paste in the app field. Then, click the arrow twice, wait for a few seconds to allow the app to pull the data and then enjoy reading the thread easily \n ",2:"Q) Why does my output screen turn white when I click the button? \n\n A) It is because the app has not loaded the tweets into memory. Just press the back button and try again :) \n",3:"Q) Why doesn't the app display threads older than a week? \n\n A) Twitter charges a hefty fee for accessing tweets older than a week. I am currently a student and simply cannot afford the price. Currently, the free endpoints only support searching of tweets that are less than a week old. However, when/if Twitter decides to release full archive search for free, I will add features to support that. \n",4:"Q) When do you plan to add more features (like picture viewing/ videos)? \n\n A) I will be adding more features from time to time as my college schedule allows. \n",5:"Q) Who are you? And where can I contact you? \n A) I am a college student. I like doing such projects in his spare time. To contact me, send me an email at crthedeveloperharsh@gmail.com \n"};
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Frequently Asked Questions",style: TextStyle(color: Colors.white70),),
        centerTitle: true,
        leading: GestureDetector(
          child: IconButton(
            onPressed: () {
              Navigator.pop(questionsme);
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(itemCount: v.length,itemBuilder: (questionsme , index){return Card( color: Colors.black, child: Text(pq[index],style: TextStyle(color: Colors.white70,fontSize: 20),),);},),
    );
  }
}