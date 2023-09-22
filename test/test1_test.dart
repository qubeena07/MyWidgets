import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_widgets/widget_test/mi_app.dart';

void main() {
  testWidgets("Mi app test", (tester) async {
    await tester
        .pumpWidget(MiApp(items: List.generate(1000, (i) => 'Items $i')));
    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_80_text'));

    await tester.scrollUntilVisible(itemFinder, 200, scrollable: listFinder);

    expect(itemFinder, findsOneWidget);
  });
}
