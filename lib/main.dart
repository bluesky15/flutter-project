import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyState();
}

class _MyState extends State<MyApp> {
  final List<bool> _selection = [true, false, false];
  final TextEditingController _controller = TextEditingController();
  String? tip;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (tip != null)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    tip!,
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              const Text('Total Amount'),
              SizedBox(
                width: 90,
                child: TextFormField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: '\$100.00'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: calculateTip,
                    child: const Text("Calculate Tip")),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ToggleButtons(
                  children: const [Text('10%'), Text('15%'), Text('20%')],
                  isSelected: _selection,
                  onPressed: updateSelection,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateSelection(int position) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = position == i;
      }
    });
  }

  void calculateTip() {
    final totalAmount = double.parse(_controller.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercentage = [0.1, 0.15, 0.2][selectedIndex];
    final tipTotal = (tipPercentage * totalAmount).toStringAsFixed(2);
    setState(() {
      tip = '\$$tipTotal';
    });
  }
}
