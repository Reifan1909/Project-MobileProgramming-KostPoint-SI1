import 'package:flutter_test/flutter_test.dart';
import 'package:kost_point/main.dart';

void main() {
  testWidgets('Smoke test KostPointApp', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const KostPointApp());

    // Verify that the title is present.
    expect(find.text('Kost Point - Padang'), findsOneWidget);
  });
}
