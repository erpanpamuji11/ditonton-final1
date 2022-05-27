import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series/tvseries.dart';
import 'package:ditonton/domain/usecases/tv_series/get_top_rated_tvseries.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper_tvseries.mocks.dart';

void main() {
  late GetTopRatedTvSeries usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = GetTopRatedTvSeries(mockTvSeriesRepository);
  });

  final tTv = <TvSeries>[];

  test('should get list of tv_series from repository', () async {
    // arrange
    when(mockTvSeriesRepository.getTopRatedTvSeries())
        .thenAnswer((_) async => Right(tTv));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTv));
  });
}
