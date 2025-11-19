import 'package:flutter_test/flutter_test.dart';
import 'package:fanpulse/main.dart';

void main() {
  testWidgets('FanPulse app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FanPulseApp());
    
    expect(find.text('⚽️ '), findsOneWidget);
    expect(find.text('FanPulse'), findsOneWidget);
  });
}
