import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/logic/cubit/settings_cubit.dart';

class ThirdScreen extends StatefulWidget {
  final String title;
  final Color color;
  const ThirdScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state.appNotifications == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'App: ${state.appNotifications} Email: ${state.emailNotifications}'),
              duration: const Duration(milliseconds: 300),
            ),
          );
        } else if (state.emailNotifications == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'App: ${state.appNotifications} Email: ${state.emailNotifications}'),
              duration: const Duration(milliseconds: 300),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'App: ${state.appNotifications} Email: ${state.emailNotifications}'),
              duration: const Duration(milliseconds: 300),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.color,
          title: Text(widget.title),
        ),
        body: Center(
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SwitchListTile(
                      title: const Text('App Notifications'),
                      value: state.appNotifications,
                      onChanged: (newValue) {
                        context
                            .read<SettingsCubit>()
                            .toggleAppNotifications(newValue);
                      }),
                  SwitchListTile(
                      title: const Text('Email Notifications'),
                      value: state.emailNotifications,
                      onChanged: (newValue) {
                        context
                            .read<SettingsCubit>()
                            .toggleEmailNotifications(newValue);
                      })
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
