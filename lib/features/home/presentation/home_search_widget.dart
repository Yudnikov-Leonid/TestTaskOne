import 'package:flutter/material.dart';

class HomeSearchWidget extends StatefulWidget {
  const HomeSearchWidget({super.key});

  @override
  State<HomeSearchWidget> createState() => _HomeSearchWidgetState();
}

class _HomeSearchWidgetState extends State<HomeSearchWidget> {
  bool _editing = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
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
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Input name, mail, tag...',
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
                FocusScope.of(context).unfocus();
                _controller.clear();
                setState(() {
                  _editing = false;
                });
              },
              child: const Text('Cancel'))
      ],
    );
  }
}
