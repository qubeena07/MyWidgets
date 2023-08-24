import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';

class CountryList extends ISuspensionBean {
  final String title;
  final String tag;
  CountryList({required this.title, required this.tag});

  @override
  String getSuspensionTag() => tag;
}

class AlphabetListScrollView extends StatefulWidget {
  final List<String> items;
  const AlphabetListScrollView({super.key, required this.items});

  @override
  State<AlphabetListScrollView> createState() => _AlphabetListScrollViewState();
}

class _AlphabetListScrollViewState extends State<AlphabetListScrollView> {
  List<CountryList> items = [];

  @override
  void initState() {
    super.initState();
    initList(widget.items);
  }

  void initList(List<String> items) {
    this.items =
        items.map((item) => CountryList(title: item, tag: item[0])).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AzListView(
        data: items,
        indexBarMargin: const EdgeInsets.all(10),
        indexHintBuilder: (context, tag) => Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text(
                tag,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
        indexBarOptions: const IndexBarOptions(
            indexHintAlignment: Alignment.centerRight,
            selectTextStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            selectItemDecoration:
                BoxDecoration(shape: BoxShape.rectangle, color: Colors.blue)),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return _buildListItem(item);
        });
  }

  Widget _buildListItem(CountryList item) => ListTile(
        title: Text(item.title),
      );
}
