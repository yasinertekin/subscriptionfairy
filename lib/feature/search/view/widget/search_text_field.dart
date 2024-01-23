part of '../search_view.dart';

final class _SearchTextField extends StatelessWidget {
  const _SearchTextField({
    required this.controller,
    required this.searchProvider,
    required this.state,
  });

  final TextEditingController controller;
  final SearchViewModel searchProvider;
  final AppLoadedState state;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      onEditingComplete: () {
        if (controller.text.isEmpty) {
          return;
        }
        searchProvider.search(
          controller.text,
          state.subscriptions,
        );
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
        ),
        hintText: LocaleKeys.search_title.tr(),
      ),
    );
  }
}
