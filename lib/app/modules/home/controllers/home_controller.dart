import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/dna.dart';
import '../../../models/gene_details.dart';

class HomeController extends GetxController {
  final genesNumber = TextEditingController();
  final number = 0.obs;
  final genes = <GeneDetailsModel>[].obs;
  final strandsNumber = TextEditingController();
  final strands = <DnaModel>[].obs;

  void addAnswer({
    // required GeneDetailsModel gene,
    required int index,
    String? name,
    String? health,
  }) {
    final item = genes[index].copyWith(
      name: name,
      health: health,
    );
    genes[index] = item;
    log(genes[index].name.toString());
  }

  void addStrand({
    required String modelName,
    String? start,
    String? end,
    String? dnaName,
  }) {
    final index = strands.indexWhere(
      (element) => element.modelName == modelName,
    );
    final item = strands[index].copyWith(
        start: int.tryParse(start ?? ''),
        end: int.tryParse(end ?? ''),
        dnaName: dnaName);
    strands[index] = item;
    log(strands[index].dnaName.toString() + strands[index].start.toString());
  }

  final totalHealths = <int>[].obs;

  void calc() {
    for (var strand in strands) {
      var totalHealth = 0;
      for (var i = strand.start; i <= strand.end; i++) {
        var gene = genes[i].name;
        if (strand.dnaName.contains(gene)) {
          var count = strand.dnaName.split(gene).length - 1;
          totalHealth += (int.parse(genes[i].health)) * count;
        }
      }
      totalHealths.add(totalHealth);
    }

    Get.dialog(
      AlertDialog(
        title: const Text('result'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('max health : ${totalHealths.reduce((previousValue, element) => previousValue > element? previousValue: element)}'),
            Text('min health : ${totalHealths.reduce((previousValue, element) => previousValue < element? previousValue: element)}'),
          ],
        ),
      ),
    );
    // log(totalHealths.toString());
  }

  @override
  void onReady() {
    genesNumber.addListener(
      () {
        if (genesNumber.text.isNotEmpty) {
          number.value = int.parse(genesNumber.text);
        } else {
          number.value = 0;
        }
      },
    );

    ever(
      number,
      (callback) {
        if (number.value > 0) {
          genes.assignAll(
            List.generate(
              number.value,
              (index) => GeneDetailsModel(
                health: '',
                name: '',
                index: index,
              ),
            ),
          );
        }
      },
    );

    strandsNumber.addListener(
      () {
        if (strandsNumber.text.isNotEmpty) {
          strands.assignAll(
            List.generate(
              int.parse(strandsNumber.text),
              (index) => DnaModel(
                  modelName: 'Strand${index + 1}',
                  start: 0,
                  end: 0,
                  dnaName: ''),
            ),
          );
        } else {
          strands.clear();
        }
      },
    );
    super.onReady();
  }
}
