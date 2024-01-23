part of '../search_view.dart';

final class _SearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _SearchAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        LocaleKeys.search_title,
      ).tr(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
