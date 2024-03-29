part of '../home_view.dart';

final class _SubscriptionDetailsListTile extends StatelessWidget {
  const _SubscriptionDetailsListTile({
    required this.iconColor,
    required this.icon,
    required this.title,
    required this.trailing,
  });

  final Color iconColor;
  final Icon icon;
  final String title;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon.icon,
        color: iconColor,
      ),
      title: Text(
        title,
      ).tr(),
      trailing: Text(
        trailing,
      ),
    );
  }
}
