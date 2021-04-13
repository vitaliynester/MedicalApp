import 'package:flutter/material.dart';
import 'package:medical_app/components/appointment_card.dart';

class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      color: Colors.white,
      height: size.height * .6,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppointmentCard(
              primaryCardColor: Color(0xFF088B81),
              imagePath: "assets/images/hospital_icon.svg",
              cardTitle: "Выбор медицинского учреждения",
              cardBody: "Выбрать филиал и больницу",
            ),
            SizedBox(height: 30),
            AppointmentCard(
              primaryCardColor: Color(0xFF0B8BB4),
              imagePath: "assets/images/medicine_wellness_icon.svg",
              cardTitle: "Выбор специальности",
              cardBody: "Выбрать специальность врача для записи",
            ),
            SizedBox(height: 30),
            AppointmentCard(
              primaryCardColor: Color(0xFF50C900),
              imagePath: "assets/images/doctor_icon.svg",
              cardTitle: "Выбор врача",
              cardBody: "Выбрать врача указанной специальности",
            ),
            SizedBox(height: 30),
            AppointmentCard(
              primaryCardColor: Color(0xFFFFBB00),
              imagePath: "assets/images/calendar_select_icon.svg",
              cardTitle: "Выбор даты",
              cardBody: "Выбрать время и дату для приёма",
            ),
            SizedBox(height: 30),
            AppointmentCard(
              primaryCardColor: Color(0xFF9D00CB),
              imagePath: "assets/images/calendar_history_icon.svg",
              cardTitle: "История посещений",
              cardBody: "Просмотр прошлых и будущих посещений",
            ),
          ],
        ),
      ),
    );
  }
}
