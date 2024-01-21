part of '../subscriptions_view.dart';

final class _SearchSubscriptions extends StatelessWidget {
  const _SearchSubscriptions();

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: context.border.normalBorderRadius,
        ),
      ),
    );
  }
}
