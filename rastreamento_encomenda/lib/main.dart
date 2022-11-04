import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:another_stepper/dto/stepper_data.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool result = false;

  //create list of data for stepper!!
  List<StepperData> stepperData = [
    StepperData(
      title: "Venda",
      subtitle: "Hello",
    ),
    StepperData(
      title: "Produção",
      subtitle: "Hola",
    ),
    StepperData(
      title: "Produção",
      subtitle: "Hola",
    ),
    StepperData(
      title: "Produção",
      subtitle: "Hola",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT6Yc_N3xC9akfMD4yRs9kwCBKoaRrie9z-Rg&usqp=CAU",
                      height: 200,
                    ),
                    const Text(
                      "Parcel Tracker",
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(child: body()),
        ],
      ),
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 35.0),
          child: Text(
            "Tracking Number :",
            style: TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        //OBS - DEIXAR RESPONSIVO CAMPO DE PESQUISA
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
          child: Row(
            children: [
              Container(
                height: 60,
                width: 310,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: "Ex. #123456789",
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    result = true;
                  });
                },
                child: const Icon(
                  Icons.search,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        result
            ? Padding(
                padding: const EdgeInsets.fromLTRB(35, 2, 31, 0),
                child: Row(
                  children: [
                    const Text(
                      "Result :",
                      style: TextStyle(fontSize: 25),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          result = false;
                        });
                      },
                      child: const Icon(
                        Icons.close,
                        size: 25,
                      ),
                    )
                  ],
                ),
              )
            : const SizedBox(),
        const SizedBox(
          height: 5,
        ),
        result
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnotherStepper(
                      stepperList: stepperData,
                      stepperDirection: Axis.vertical,
                      horizontalStepperHeight: 70,
                      dotWidget: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: const Icon(Icons.fastfood, color: Colors.white),
                      ),
                      activeBarColor: Colors.red,
                      inActiveBarColor: Colors.grey,
                      activeIndex: 1,
                      barThickness: 8,
                    ),
                  ),
                ],
              )
            : Transform(
                transform: Matrix4.translationValues(0, -50, 0),
                child: Lottie.network(
                  "https://assets1.lottiefiles.com/private_files/lf30_epvidscs.json",
                ),
              )
      ],
    );
  }
}

//https://assets2.lottiefiles.com/packages/lf20_t24tpvcu.json
//https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT6Yc_N3xC9akfMD4yRs9kwCBKoaRrie9z-Rg&usqp=CAU
