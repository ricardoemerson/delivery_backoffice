import 'package:flutter/material.dart';

import '../../core/env/env.dart';
import '../../core/helpers/loader_mixin.dart';
import '../../core/helpers/message_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with LoaderMixin, MessageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                'HomePage is working',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                Env.instance.get('BACKEND_BASE_URL'),
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  showInfo('Teste de info');

                  showSuccess('Teste de success');

                  showWarning('Teste de warning');

                  showError('Teste de error');
                },
                child: const Text('Show Message'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
