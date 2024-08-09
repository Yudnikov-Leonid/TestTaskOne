import 'package:flutter/material.dart';

class HomeSearchWidget extends StatefulWidget {
  const HomeSearchWidget({required this.controller, super.key});

  final TextEditingController controller;

  @override
  State<HomeSearchWidget> createState() => _HomeSearchWidgetState();
}

class _HomeSearchWidgetState extends State<HomeSearchWidget> {
  bool _editing = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_editing,
      onPopInvoked: (can) {
        if (_editing) {
          _cancelEditing();
        }
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        onTap: () {
                          setState(() {
                            _editing = true;
                          });
                        },
                        onEditingComplete: () {
                          print('onEditingComplete');
                          FocusScope.of(context).unfocus();
                        },
                        controller: widget.controller,
                        decoration: const InputDecoration(
                          hintText: 'Input name, tag...',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    if (!_editing)
                      Transform.scale(
                        scaleX: -1,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.sort,
                              color: Colors.grey,
                            )),
                      )
                  ],
                )),
          ),
          if (_editing)
            TextButton(
                onPressed: () {
                  _cancelEditing();
                },
                child: const Text('Cancel'))
        ],
      ),
    );
  }

  void _cancelEditing() {
    FocusScope.of(context).unfocus();
    widget.controller.clear();
    setState(() {
      _editing = false;
    });
  }
}
