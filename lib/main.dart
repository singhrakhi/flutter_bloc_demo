import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bloc Demo'),
        ),
        body: BlocProvider(
          builder: (BuildContext context) => CounterBloc(),
            child: CounterScreen()
        )
      ),
    );
  }
}
class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final _counterBlock = BlocProvider.of<CounterBloc>(context);

    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('Content Value 0',
          //   style: TextStyle(fontSize: 20),
          // )
          // ,
          BlocBuilder<CounterBloc, int>(
            builder: (BuildContext context, int state){
              return Text("Counter value : $state", style: TextStyle(fontSize: 20));
            },
          ),

          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(onPressed: (){
                _counterBlock.add(CounterEvents.increment);
              },
                child: Text('Increment'),
              ),
              SizedBox(width: 5,),
              RaisedButton(onPressed: (){
                _counterBlock.add(CounterEvents.decrement);
              },
                child: Text('Decrement'),
              )

            ],
          )
        ],
      ),
    );
  }
}

