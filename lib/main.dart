import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Teste Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int _somar = 0;
final valor1 = TextEditingController();
final valor2 = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  void realizarSoma() {
    setState(() {
      if (valor1.text.isNotEmpty && valor2.text.isNotEmpty) {
        _somar = int.parse(valor1.text) + int.parse(valor2.text);
      }
    });
  }

  void limparForm() {
    setState(() {
      _somar = 0;
      valor1.clear();
      valor2.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Soma de valores'),
            SizedBox(
                width: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 18),
                      child: TextField(
                        controller: valor1,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Informe um valor'),
                      ),
                    ),
                    TextField(
                      controller: valor2,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Informe um valor'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Resultado : $_somar'),
                          OutlinedButton(
                              onPressed: realizarSoma,
                              child: const Text('Somar'))
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: limparForm, child: const Text('Limpar'))
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
