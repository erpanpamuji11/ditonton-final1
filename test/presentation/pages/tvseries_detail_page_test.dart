import 'package:ditonton/presentation/provider/tv_series/tvseries_detail_notifier.dart';
import 'package:mockito/annotations.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/tvseries.dart';
import 'package:ditonton/presentation/pages/tv_series/tvseries_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../dummy_data/dummy_objects_tvseries.dart';
import 'tvseries_detail_page_test.mocks.dart';

@GenerateMocks([TvSeriesDetailNotifier])
void main() {
  late MockTvDetailNotifier mockNotifier;

  setUp(() {
    mockNotifier = MockTvDetailNotifier();
  });

  Widget _makeTestableWidget(Widget body) {
    return ChangeNotifierProvider<TvSeriesDetailNotifier>.value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
          (WidgetTester tester) async {
        when(mockNotifier.tvState).thenReturn(RequestState.Loaded);
        when(mockNotifier.tv).thenReturn(testTvSeriesDetail);
        when(mockNotifier.recommendationTvState).thenReturn(RequestState.Loaded);
        when(mockNotifier.tvRecommendations).thenReturn(<TvSeries>[]);
        when(mockNotifier.isAddedToWatchlistTv).thenReturn(false);

        final watchlistButtonIcon = find.byIcon(Icons.add);

      });

  testWidgets(
      'Watchlist button should dispay check icon when tv is added to wathclist',
          (WidgetTester tester) async {
        when(mockNotifier.tvState).thenReturn(RequestState.Loaded);
        when(mockNotifier.tv).thenReturn(testTvSeriesDetail);
        when(mockNotifier.recommendationTvState).thenReturn(RequestState.Loaded);
        when(mockNotifier.tvRecommendations).thenReturn(<TvSeries>[]);
        when(mockNotifier.isAddedToWatchlistTv).thenReturn(true);

        final watchlistButtonIcon = find.byIcon(Icons.check);

      });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
          (WidgetTester tester) async {
        when(mockNotifier.tvState).thenReturn(RequestState.Loaded);
        when(mockNotifier.tv).thenReturn(testTvSeriesDetail);
        when(mockNotifier.recommendationTvState).thenReturn(RequestState.Loaded);
        when(mockNotifier.tvRecommendations).thenReturn(<TvSeries>[]);
        when(mockNotifier.isAddedToWatchlistTv).thenReturn(false);
        when(mockNotifier.watchlistMessageTv).thenReturn('Added to Watchlist');

        final watchlistButton = find.byType(ElevatedButton);

      });

  testWidgets(
      'Watchlist button should display AlertDialog when add to watchlist failed',
          (WidgetTester tester) async {
        when(mockNotifier.tvState).thenReturn(RequestState.Loaded);
        when(mockNotifier.tv).thenReturn(testTvSeriesDetail);
        when(mockNotifier.recommendationTvState).thenReturn(RequestState.Loaded);
        when(mockNotifier.tvRecommendations).thenReturn(<TvSeries>[]);
        when(mockNotifier.isAddedToWatchlistTv).thenReturn(false);
        when(mockNotifier.watchlistMessageTv).thenReturn('Failed');

        final watchlistButton = find.byType(ElevatedButton);

      });
}