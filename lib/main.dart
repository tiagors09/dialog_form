import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const DialogForm());
}

class DialogForm extends StatelessWidget {
  const DialogForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: DialogFormBody(),
      ),
    );
  }
}

class DialogFormBody extends StatefulWidget {
  const DialogFormBody({super.key});

  @override
  State<DialogFormBody> createState() => _DialogFormBodyState();
}

class _DialogFormBodyState extends State<DialogFormBody> {
  final nameCtrl = TextEditingController();
  String? name = '';

  Widget onBuild(BuildContext ctx) {
    return AlertDialog(
      title: const Text('Alert Dialog'),
      content: TextField(
        controller: nameCtrl,
        decoration: const InputDecoration(label: Text('Name')),
      ),
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              name = nameCtrl.text;
            });
            Navigator.pop(ctx, 'OK');
          },
          child: const Text('OK'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 1 / 4,
            top: MediaQuery.of(context).size.height * 0.05,
            bottom: MediaQuery.of(context).size.height * 0.05,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.2,
          child: const Row(
            children: [
              Placeholder(),
              Placeholder(),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            showDialog(context: context, builder: onBuild);
          },
          child: const Text('Open dialog form'),
        ),
        Text(name ?? 'Insert a name in form'),
      ],
    );
  }
}
