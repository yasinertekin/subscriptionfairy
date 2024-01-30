part of '../search_view.dart';

final class _SearchTextField extends StatelessWidget {
  const _SearchTextField({
    required this.controller,
    required this.searchProvider,
    required this.subscriptions,
  });

  final TextEditingController controller;
  final SearchViewModel searchProvider;
  final List<SubscriptionsList> subscriptions;

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
          subscriptions,
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
