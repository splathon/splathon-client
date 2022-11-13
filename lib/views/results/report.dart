import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as API;
import 'package:splathon_app/domains/admin_porovider.dart';
import 'package:splathon_app/domains/event_provider.dart';
import 'package:splathon_app/domains/report_provider.dart';
import 'package:splathon_app/styles/color.dart';
import 'package:splathon_app/styles/text.dart';
import 'package:splathon_app/styles/text_style.dart';
import 'package:splathon_app/views/components/dialog.dart';
import 'package:splathon_app/views/components/error_view.dart';
import 'package:splathon_app/views/components/loader.dart';

class Report extends ConsumerStatefulWidget {
  final API.Match _match;
  final API.Battle _battle;
  const Report(this._match, this._battle, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ReportState();
  }
}

class _ReportState extends ConsumerState<Report> {
  _ReportState();

  @override
  void initState() {
    super.initState();

    final initialViewModel =
        ReportViewModel(match: widget._match, battle: widget._battle);
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        ref.read(reportProvider.notifier).setInitialModel(initialViewModel));
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(reportProvider);
    final event = ref.watch(eventProvider);

    if (viewModel == null) {
      return Scaffold(
        appBar: AppBar(
          title: const SplaText('リザルト'),
          backgroundColor: const Color.fromRGBO(11, 49, 143, 1),
        ),
        body: const ColorLoader(),
      );
    }

    final dropdownRuleValue = viewModel.battle.rule?.name;
    final dropdownStageValue = viewModel.battle.stage?.name;
    final dropdownTeamValue = viewModel.battle.winner?.value;
    final order = viewModel.battle.order;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const SplaText('リザルト'),
        backgroundColor: const Color.fromRGBO(11, 49, 143, 1),
      ),
      body: event.when(
        data: (data) {
          return ListView.builder(
            itemCount: 9,
            itemBuilder: (BuildContext context, i) {
              if (i == 0) {
                return Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/goldInc.png'),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text('マッチ 第$order試合', style: headerStyle),
                      ),
                    ],
                  ),
                );
              }
              if (i == 1) {
                return SizedBox(
                  height: 36.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: screenWidth * 0.35,
                        child: Text(
                          viewModel.match.teamAlpha.name,
                          style: resultNameStyle,
                          maxLines: 1,
                        ),
                      ),
                      const Text('vs', style: resultNameStyle),
                      SizedBox(
                        width: screenWidth * 0.35,
                        child: Text(
                          viewModel.match.teamBravo.name,
                          style: resultNameStyle,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (i == 2) {
                return Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/silverInc.png'),
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('ルール', style: headerStyle),
                      ),
                    ],
                  ),
                );
              }
              if (i == 3) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: borderblueColor,
                        width: 1,
                      )),
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  height: 72.0,
                  width: 300.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 14),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: dropdownRuleValue,
                        onChanged: (String? newValue) {
                          if (newValue == null) {
                            return;
                          }
                          setState(() {
                            ref
                                .read(reportProvider.notifier)
                                .update(rule: newValue, event: data);
                          });
                        },
                        items: data.rules
                            .map<DropdownMenuItem<String>>((API.Rule rule) {
                          return DropdownMenuItem<String>(
                            value: rule.name,
                            child: Text(rule.name ?? '',
                                style: topNameStyle), // TODO: null case
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              }
              if (i == 4) {
                return Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/silverInc.png'),
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('ステージ', style: headerStyle),
                      ),
                    ],
                  ),
                );
              }
              if (i == 5) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: borderblueColor,
                        width: 1,
                      )),
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  height: 72.0,
                  width: 300.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 14),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: dropdownStageValue,
                        onChanged: (String? newValue) {
                          if (newValue == null) {
                            return;
                          }
                          setState(() {
                            ref
                                .read(reportProvider.notifier)
                                .update(stage: newValue, event: data);
                          });
                        },
                        items: data.stages
                            .map<DropdownMenuItem<String>>((API.Stage stage) {
                          return DropdownMenuItem<String>(
                            value: stage.name,
                            child: Text(stage.name ?? '',
                                style: topNameStyle), // TODO: null case
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              }
              if (i == 6) {
                return Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Stack(
                    children: <Widget>[
                      Image.asset('assets/images/goldInc.png'),
                      const Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Text('勝者', style: headerStyle),
                      ),
                    ],
                  ),
                );
              }
              if (i == 7) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: borderblueColor,
                        width: 1,
                      )),
                  margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  height: 72.0,
                  width: 300.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 14),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: dropdownTeamValue,
                        onChanged: (String? newValue) {
                          if (newValue == null) {
                            return;
                          }
                          setState(() {
                            ref
                                .read(reportProvider.notifier)
                                .update(winner: newValue, event: data);
                          });
                        },
                        items: [
                          DropdownMenuItem<String>(
                            value: API.BattleWinnerEnum.alpha.value,
                            child: Text(viewModel.match.teamAlpha.name,
                                style: topNameStyle),
                          ),
                          DropdownMenuItem<String>(
                            value: API.BattleWinnerEnum.bravo.value,
                            child: Text(viewModel.match.teamBravo.name,
                                style: topNameStyle),
                          ),
                          const DropdownMenuItem<String>(
                            value: null,
                            child: Text('指定しない', style: topNameStyle),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
              if (i == 8) {
                return Container(
                  margin: const EdgeInsets.only(
                      top: 40, left: 20, right: 20, bottom: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: splaYellowColor,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                    ),
                    child: const Text(
                      '試合結果を送信する',
                      style: actionButtonStyle,
                    ),
                    onPressed: () {
                      _submit(context, viewModel);
                    },
                  ),
                );
              }

              // out of range
              return Container();
            },
          );
        },
        error: (error, stackTrace) => ErrorView(
          error: error,
          retryPressed: () => ref.refresh(eventProvider),
        ),
        loading: () => const ColorLoader(),
      ),
    );
  }

  void _submit(BuildContext context, ReportViewModel viewModel) {
    ref.read(adminProvider.notifier).report(viewModel).then((_) {
      Navigator.of(context).pop();
    }).catchError((onError) {
      ErrorDialog.show(context, '登録に失敗しました');
    });
  }
}
