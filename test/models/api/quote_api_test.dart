import 'package:damodi_daily_mood_diary/models/api/quote_api.dart';
import 'package:damodi_daily_mood_diary/models/quote_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'quote_api_test.mocks.dart';

@GenerateMocks([QuoteApi])
void main() {
  group('QuoteAPI', () {
    QuoteApi quoteApi = MockQuoteApi();
    test('get quote returns data', () async {
      when(quoteApi.getQuote()).thenAnswer(
        (_) async => QuoteModel(
          id: '1',
          content: 'test quote content',
          author: 'test quote author',
          tags: ['test', 'quote'],
          authorSlug: 'test-author-slug',
          length: 100,
          dateAdded: DateTime.now(),
          dateModified: DateTime.now(),
        ),
      );

      final quote = await quoteApi.getQuote();
      expect(quote.id, '1');
      expect(quote.content, 'test quote content');
      expect(quote.author, 'test quote author');
      expect(quote.tags, ['test', 'quote']);
      expect(quote.authorSlug, 'test-author-slug');
      expect(quote.length, 100);
      expect(quote.dateAdded, isA<DateTime>());
      expect(quote.dateModified, isA<DateTime>());
    });
  });
}
