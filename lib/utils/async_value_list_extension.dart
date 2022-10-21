import 'package:hooks_riverpod/hooks_riverpod.dart';

// List<AsyncValue> に対して、全てのProviderが読み込み終わったイベントを監視するI/F
extension AsyncValueList on List<AsyncValue> {
  R when<R>({
    required R Function() loaded,
    required R Function(Object error, StackTrace? stackTrace) error,
    required R Function() loading,
  }) {
    // エラーが1つでもあればエラーを返す
    final errors = where((element) => element is AsyncError);
    if (errors.isNotEmpty) {
      final e = errors.first as AsyncError;
      return error(e.error, e.stackTrace);
    }

    // エラーはないが、1つでもloading中であれば Loadingを返す
    final loadings = where((element) => element is AsyncLoading);
    if (loadings.isNotEmpty) {
      return loading();
    }
    // エラーもLoadingもない場合に、全てのLoadが完了したことを指すLoadedを返す
    return loaded();
  }
}
