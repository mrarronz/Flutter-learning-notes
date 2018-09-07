import 'package:flutter/material.dart';

class ExpansionTiles extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('ExpansionTiles')),
      body: new ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return new EntryItem(data[index]);
        }
      ),
    );
  }
}

class EntryItem extends StatelessWidget {

  const EntryItem(this.entry);

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return _buildTile(entry);
  }

  Widget _buildTile(Entry entry) {
    if (entry.children.isEmpty) {
      return new ListTile(title: new Text(entry.title));
    }
    return new ExpansionTile(
      title: new Text(entry.title),
      key: new PageStorageKey<Entry>(entry),
      children: entry.children.map(_buildTile).toList(),
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  new Entry('Chapter A',
    <Entry>[
      new Entry('Section A0',
        <Entry>[
          new Entry('Item A0.1'),
          new Entry('Item A0.2'),
          new Entry('Item A0.3'),
        ],
      ),
      new Entry('Section A1'),
      new Entry('Section A2'),
    ],
  ),
  new Entry('Chapter B',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry('Chapter C',
    <Entry>[
      new Entry('Section C0'),
      new Entry('Section C1'),
      new Entry('Section C2',
        <Entry>[
          new Entry('Item C2.0'),
          new Entry('Item C2.1'),
          new Entry('Item C2.2'),
          new Entry('Item C2.3'),
        ],
      ),
    ],
  ),
];