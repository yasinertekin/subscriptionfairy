part of '../home_view.dart';

final class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Text(
        LocaleKeys.home_title,
        style: context.general.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ).tr(),
      actions: [
        IconButton(
          onPressed: () {
            ProductLocalization.updateLanguage(
              context: context,
              value: Locales.en,
            );
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
