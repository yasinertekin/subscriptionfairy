part of '../subscriptions_detail_view.dart';

final class _SubscriptionsCardSwitch extends StatelessWidget
    with SuccesFullLottie {
  const _SubscriptionsCardSwitch({
    required this.state,
    required this.receivedSubscriptions,
    required this.index,
    required this.subscriptionsDetailViewModel,
    required this.appCubit,
    required this.scaffoldKey,
  });

  final AppLoadedState state;
  final SubscriptionsList receivedSubscriptions;
  final int index;
  final SubscriptionsDetailViewModel subscriptionsDetailViewModel;
  final AppCubit appCubit;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final value = state.users.subscriptionList!
        .where(
          (element) =>
              element.subId == receivedSubscriptions.name![index].subId &&
              // ignore: use_if_null_to_convert_nulls_to_bools
              element.isSubscribed == true,
        )
        .isNotEmpty;
    return Align(
      alignment: Alignment.centerRight,
      child: Switch(
        value: value,
        onChanged: (value) async {
          subscriptionsDetailViewModel.onEndDateSelected(
            receivedSubscriptions.name![index].subscriptionLength!,
          );
          if (value) {
            await NavigationService.instance.navigateToPage(
              path: Routes.datePicker,
              data: subscriptionsDetailViewModel,
            );
            await appCubit.updateSubscriptionList(
              receivedSubscriptions.name![index].copyWith(
                isSubscribed: true,
                startDate: subscriptionsDetailViewModel.selectedDate,
                endDate: subscriptionsDetailViewModel.selectedDate.add(
                  Duration(
                    days: receivedSubscriptions.name![index].subscriptionLength!
                        .toInt(),
                  ),
                ),
              ),
            );
            succesFullLottie(
              scaffoldKey,
            );
          } else {
            await context.read<AppCubit>().updateSubscriptions(
                  state.users.subscriptionList!.firstWhere(
                    (element) =>
                        element.subId ==
                        receivedSubscriptions.name![index].subId,
                  ),
                  receivedSubscriptions.name![index].copyWith(
                    isSubscribed: false,
                    startDate: DateTime.now(),
                    endDate: DateTime.now(),
                  ),
                );
          }
        },
      ),
    );
  }
}
