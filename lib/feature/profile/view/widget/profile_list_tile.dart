part of '../profile_view.dart';

final class _ProfileListTile extends StatelessWidget {
  const _ProfileListTile(
    this.index,
    this.onTap,
  );

  final int index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(Profile.values[index].name),
          trailing: Profile.values[index].icon,
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}
