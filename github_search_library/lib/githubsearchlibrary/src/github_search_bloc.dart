import 'package:bloc/bloc.dart';
import 'package:github_search_library/githubsearchlibrary/src/github_cache.dart';
import 'package:github_search_library/githubsearchlibrary/src/github_search_event.dart';
import 'package:github_search_library/githubsearchlibrary/src/github_search_state.dart';
import 'package:github_search_library/githubsearchlibrary/src/search_result_error.dart';
import 'package:stream_transform/stream_transform.dart';

const _duration = Duration(milliseconds: 300);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  GithubSearchBloc({required this.githubRepo})
      : super(SearchStateEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  final GithubRepo githubRepo;

  Future<void> _onTextChanged(
    TextChanged event,
    Emitter<GithubSearchState> emit,
  ) async {
    final searchTerm = event.text;

    if (searchTerm.isEmpty) return emit(SearchStateEmpty());

    emit(SearchStateLoading());

    try {
      final results = await githubRepo.search(searchTerm);
      emit(SearchStateSuccess(results.items));
    } catch (error) {
      emit(
        error is SearchResultError
            ? SearchStateError(error.message)
            : const SearchStateError('something went wrong'),
      );
    }
  }
}

