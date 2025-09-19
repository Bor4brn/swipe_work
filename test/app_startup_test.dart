import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swipe_to_apply_tr/main.dart';

void main() {
  testWidgets('SwipeToApplyApp shows splash content on startup', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: SwipeToApplyApp()));

    // Allow initial animations to build the widget tree.
    await tester.pump();

    expect(find.text('İş Bul'), findsOneWidget);
    expect(find.text('Swipe to Apply'), findsOneWidget);
  });
}
