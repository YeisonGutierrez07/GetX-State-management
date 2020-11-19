import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_state_management/controllers/reactive_controller.dart';

class ReactivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ReactiveController>(
        init: ReactiveController(),
        builder: (_) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Trabajando con valores"),
                Obx(
                  () => Text(
                    _.counter.value.toString(),
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Obx(
                  () => Center(
                    child: Text(
                      _.date.value.toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Text("Trabajando con Listas"),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: _.listDates.length,
                      itemBuilder: (__, index) => ListTile(
                        title: Text(_.listDates[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _.deleteItem(index),
                        ),
                      ),
                    ),
                  ),
                ),
                Text("Trabajando con Mapa"),
                Expanded(
                  child: Obx(
                    () => ListView(
                      children: _.mapNumbers.values
                          .map(
                            (e) => ListTile(
                              title: Text(e),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => _.deleteNumberItem(e),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Text("Trabajando con Clase"),
                Expanded(
                  child: Column(
                    children: [
                      Obx(() => Column(
                            children: [
                              Text("Nombre: ${_.myPet.name}"),
                              Text("Edad: ${_.myPet.age}"),
                            ],
                          )),
                      FlatButton(
                        child: Text("Agregar Edad"),
                        onPressed: () => _.addAgeMyPet(_.myPet.age + 1),
                      )
                    ],
                  ),
                )
              ],
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    _.increment();
                  },
                ),
                FloatingActionButton(
                  child: Icon(Icons.calendar_today),
                  onPressed: () {
                    _.setDate();
                  },
                ),
                FloatingActionButton(
                  child: Icon(Icons.add_alarm),
                  onPressed: () {
                    _.addItem();
                  },
                ),
                FloatingActionButton(
                  child: Icon(Icons.padding),
                  onPressed: () {
                    _.addNumberItem();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
