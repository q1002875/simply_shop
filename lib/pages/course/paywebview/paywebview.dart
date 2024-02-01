import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/pages/course/paywebview/bloc/payview_blocs.dart';
import 'package:simply_shop/pages/course/paywebview/bloc/payview_states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayWebview extends StatefulWidget {
  const PayWebview({super.key});

  @override
  State<PayWebview> createState() => _PayWebviewState();
}

class _PayWebviewState extends State<PayWebview> {
  late String weburl = "";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayWebViewBlocs, PayWebViewStates>(
      builder: (context, state) {
        print("state.url here ${state.url}");
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Pay',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          body: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: weburl,
          ),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    // context.read<PayWebViewBlocs>().add(TriggerWebView(args["url"]));
    weburl = args["url"];
  }

  @override
  void initState() {
    super.initState();
  }
}
