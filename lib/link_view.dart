import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'link_bloc/link_bloc.dart';

class LinkView extends StatefulWidget {
  const LinkView({super.key});

  @override
  State<LinkView> createState() => _LinkViewState();
}

class _LinkViewState extends State<LinkView> {
  @override
  void initState() {
    super.initState();
    _getNextLink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          BlocBuilder<LinkBloc, LinkState>(
            builder: (context, state) {
              if (state is GetNextLinkState) {
                final String url = state.link;
                return Expanded(
                    child: Center(
                        child: GestureDetector(
                            onTap: () => _launchUrl(url),
                            child: Text(
                              url,
                              style: const TextStyle(color: Colors.blue),
                            ))));
              } else {
                return const SizedBox();
              }
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                  onPressed: () => _getNextLink(),
                  child: const Text(
                    'Next Link',
                    style: TextStyle(color: Colors.red),
                  )),
            ),
          )
        ],
      ),
    ));
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  void _getNextLink() =>
      BlocProvider.of<LinkBloc>(context).add(const GetNextLinkEvent());
}
