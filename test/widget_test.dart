import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_sandbox/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Colors list device test', (tester) async {
    await loadAppFonts();

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [
        Device.iphone11,
        Device.tabletPortrait,
      ])
      ..addScenario(
        name: 'Colors List',
        widget: const MyApp(),
        onCreate: (scenarioWidgetKey) async {
          expect(
            find.descendant(
              of: find.byKey(scenarioWidgetKey),
              matching: find.byIcon(Icons.add),
            ),
            findsOneWidget,
          );
        },
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'colors_list_device');
  });

  testGoldens('Colors list test', (tester) async {
    await loadAppFonts();

    final builder = GoldenBuilder.column(
      wrap: (child) => SizedBox(
        height: 600,
        child: child,
      ),
    )..addScenario('Colors List', const MyApp());

    await tester.pumpWidgetBuilder(
      builder.build(),
      surfaceSize: const Size(400, 680),
    );

    await tester.drag(find.byType(ListView), const Offset(0, -1000));
    await tester.pump();

    await screenMatchesGolden(tester, 'colors_list');
  });

  testWidgets('Colors list regular widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byKey(Key(Colors.red.toString())), findsOneWidget);
    expect(find.byKey(Key(Colors.yellow.toString())), findsNothing);

    await tester.drag(find.byType(ListView), const Offset(0, -1000));
    await tester.pump();

    expect(find.byKey(Key(Colors.yellow.toString())), findsOneWidget);
  });
}
