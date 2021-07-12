import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_f/list.dart';
import 'logic/theme/theme_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter theme Demo',
            theme: state.themeData,
            home: MyHomePage(title: 'Flutter Theme Demo Page'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Homepage build called');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.title,
        style: Theme.of(context).textTheme.headline6,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hi This is\nSubrota Debnath',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline3,
              textAlign: TextAlign.center,
            ),
            Text(
              'Select a theme',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1,
              textAlign: TextAlign.center,
            ),
            Container(
              height: 220,
              child: ListView.builder(
                itemCount: ItemList().themes.length,
                itemBuilder: (context, index) {
                  return BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          print('Tap on index $index');
                          if (index == 0) {
                            context.read<ThemeCubit>().darkTheme();
                          } else if(index==1) {
                            context.read<ThemeCubit>().lightTheme();
                          }else{
                            context.read<ThemeCubit>().defaultTheme(context);
                          }
                        },
                        child: Card(
                          elevation:2,
                          margin: EdgeInsets.only(left: 20, right: 20, top: 8),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    ItemList().themes[index],
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodyText2,
                                  ),
                                ),
                                Visibility(
                                  visible: index == state.status.index,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
