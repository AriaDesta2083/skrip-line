class Dosen {
  int id, htm;
  String nama, matkul;
  List jadwal;

  Dosen(
      {required this.id,
      required this.nama,
      required this.matkul,
      required this.jadwal,
      required this.htm});

  static List<Dosen> getItems() {
    return <Dosen>[
      Dosen(
        id: 1,
        nama: 'Drs Ilham Maulana',
        matkul: 'Ekonomi ',
        jadwal: ['senin : 13.30 WIB', 'Senin : 16.30 WIB', 'Kamis : 15.00 WIB'],
        htm: 150000,
      ),
      Dosen(
          id: 2,
          nama: 'Prof Aria Desta',
          matkul: 'Komputasi cerdas',
          jadwal: [
            'Senin :15.30 WIB',
            'Selasa: 13.30 WIB',
            'Kamis :18.00 WIB',
            'Jumat:18.00 WIB'
          ],
          htm: 250000),
      Dosen(
          id: 3,
          nama: 'Drs Nadia Umi',
          matkul: 'Eletro dan Listrik',
          jadwal: ['Sabtu : 13.30 WIB', 'Sabtu : 18.30 WIB'],
          htm: 150000),
      Dosen(
          id: 4,
          nama: 'Drs Riszha berlian',
          matkul: 'Tenaga surya',
          jadwal: [
            'Senin : 17.30 WIB',
            'Selasa : 18.00 WIB',
            'Jumat : 15.00 WIB ',
            'Sabtu : 18.30 WIB'
          ],
          htm: 185000),
      Dosen(
          id: 5,
          nama: 'Drs Nathan syach',
          matkul: 'Jaringan Komputer',
          jadwal: [
            'Senin : 13.00 WIB',
            'Rabu  : 15.00 WIB',
            'Kamis : 15.00 WIB ',
            'Jumat : 15.00 WIB '
          ],
          htm: 200000)
    ];
  }
}
