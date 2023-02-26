import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vg_task/app/config/widgets/inputs/input_button.dart';

import '../../../config/widgets/inputs/default_form_field.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VG Task'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                DefaultFormField(
                  hint: 'please enter number of Genes',
                  controller: controller.genesNumber,
                  isNumber: true,
                ),
                Obx(
                  () => controller.genes.isEmpty
                      ? const SizedBox.shrink()
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 50,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => SizedBox(
                                  width: 100,
                                  child: DefaultFormField(
                                    hint: 'Name${index + 1}',
                                    onChange: (value) {
                                      controller.addAnswer(
                                        index: index,
                                        name: value,
                                      );
                                    },
                                  ),
                                ),
                                itemCount: controller.genes.length,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => SizedBox(
                                  width: 100,
                                  child: DefaultFormField(
                                    hint: 'health${index + 1}',
                                    onChange: (value) {
                                      controller.addAnswer(
                                        index: index,
                                        health: value,
                                      );
                                    },
                                  ),
                                ),
                                itemCount: controller.genes.length,
                              ),
                            ),
                          ],
                        ),
                ),
                Obx(
                  () => controller.number.value == 0
                      ? const SizedBox.shrink()
                      : DefaultFormField(
                          hint: 'please enter number of strands',
                          controller: controller.strandsNumber,
                          isNumber: true,
                        ),
                ),
                Obx(
                  () => controller.strands.isEmpty
                      ? const SizedBox.shrink()
                      : Wrap(
                          children: controller.strands
                              .map(
                                (e) => ExpansionTile(
                                  title: Text(e.modelName),
                                  children: [
                                    DefaultFormField(
                                      hint: 'Start',
                                      isNumber: true,
                                      onChange: (value) {
                                        controller.addStrand(
                                          modelName: e.modelName,
                                          start: value,
                                        );
                                      },
                                    ),
                                    DefaultFormField(
                                      hint: 'End',
                                      isNumber: true,
                                      onChange: (value) {
                                        controller.addStrand(
                                          modelName: e.modelName,
                                          end: value,
                                        );
                                      },
                                    ),
                                    DefaultFormField(
                                      hint: 'Name',
                                      onChange: (value) {
                                        controller.addStrand(
                                          modelName: e.modelName,
                                          dnaName: value,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => controller.genes.isEmpty || controller.strands.isEmpty
                      ? const SizedBox.shrink()
                      : DefaultButton(
                          text: 'calc',
                          onTap: controller.calc,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
