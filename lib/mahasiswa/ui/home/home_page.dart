import 'package:flutter/material.dart';
import 'package:flutter_aplikasi_absensi/shared/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            splashRadius: 24.0,
            onPressed: () {},
            icon: Icon(Icons.history),
          ),
          IconButton(
            splashRadius: 24.0,
            onPressed: () {},
            icon: Icon(Icons.filter_alt),
          )
        ],
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Container(
          color: kPrimaryColor,
          child: Column(
            children: [
              DrawerHeader(
                margin: EdgeInsets.zero,
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Text(
                        'AJA',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      radius: 24.0,
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Ahmad Jamil Al Rasyid\n',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '1212121212',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    print('home');
                  },
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    print('Jadwal Matkul');
                  },
                  child: ListTile(
                    leading: Icon(Icons.calendar_today, color: Colors.white),
                    title: Text(
                      'Jadwal Matkul',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    print('Profile');
                  },
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.white),
                    title: Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    print('Logout');
                  },
                  child: ListTile(
                    leading: Icon(Icons.logout, color: Colors.white),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text(
                'version 1.0',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16.0)
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        children: [
          AbsenItem(
            date: 'Senin, 27 Oktober 2021',
            childItems: [
              AbsenItemChild(
                matkulName: 'Pengenalan Pemrograman',
                meetingCount: 1,
                teacherName: 'Marfuad Fajri, S.Pdi',
                startTime: '12:00',
                endTime: '13:40',
                state: AbsenItemChildState.ABSEN_TIME,
              ),
              AbsenItemChild(
                matkulName: 'Pengenalan Pemrograman',
                meetingCount: 1,
                teacherName: 'Marfuad Fajri, S.Pdi',
                startTime: '12:00',
                endTime: '13:40',
                state: AbsenItemChildState.NOT_YET,
              ),
              AbsenItemChild(
                matkulName: 'Pengenalan Pemrograman',
                meetingCount: 1,
                teacherName: 'Marfuad Fajri, S.Pdi',
                startTime: '12:00',
                endTime: '13:40',
                state: AbsenItemChildState.ALPHA,
              ),
              AbsenItemChild(
                matkulName: 'Pengenalan Pemrograman',
                meetingCount: 1,
                teacherName: 'Marfuad Fajri, S.Pdi',
                startTime: '12:00',
                endTime: '13:40',
                state: AbsenItemChildState.DONE,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AbsenItem extends StatelessWidget {
  const AbsenItem({
    Key? key,
    required this.date,
    required this.childItems,
  }) : super(key: key);
  final String date;
  final List<AbsenItemChild> childItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 4.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: kPrimaryColor),
            ),
          ),
          child: Text(
            date,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: kPrimaryColor, fontSize: 16.0),
          ),
        ),
        SizedBox(height: 16.0),
        Column(
          children: childItems,
        )
      ],
    );
  }
}

enum AbsenItemChildState { ABSEN_TIME, NOT_YET, ALPHA, DONE }

class AbsenItemChild extends StatelessWidget {
  const AbsenItemChild({
    Key? key,
    required this.matkulName,
    required this.meetingCount,
    required this.teacherName,
    required this.startTime,
    required this.endTime,
    required this.state,
  }) : super(key: key);
  final String matkulName;
  final int meetingCount;
  final String teacherName;
  final String startTime;
  final String endTime;
  final AbsenItemChildState state;

  Widget _buildAbsenStateWidget(AbsenItemChildState state) {
    switch (state) {
      case AbsenItemChildState.ABSEN_TIME:
        return MaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          color: kLogoutButtonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          onPressed: () {
            print('Absen');
          },
          child: Text(
            'Absen Sekarang !',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 10.0,
            ),
          ),
        );
      case AbsenItemChildState.NOT_YET:
        return Text(
          'Belum waktu absen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 12.0,
          ),
        );
      case AbsenItemChildState.ALPHA:
        return Text(
          'Tidak Hadir',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red.withOpacity(0.75),
            fontSize: 12.0,
          ),
        );
      case AbsenItemChildState.DONE:
        return Text(
          'Sudah selesai',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green.withOpacity(0.75),
            fontSize: 12.0,
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24.0,
            child: Text('PP'),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$matkulName\n',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      TextSpan(
                        text: 'Pertemuan Ke-$meetingCount\n',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black54,
                        ),
                      ),
                      TextSpan(
                        text: '$teacherName',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 6.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Mulai\n',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Selesai',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 16.0),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '$startTime\n',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: '$endTime',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    _buildAbsenStateWidget(state)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
