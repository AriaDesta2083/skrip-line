class Beasiswa {
  int id;
  String judul, ketentuan, tanggal, keterangan, urlmore;

  Beasiswa({
    required this.id,
    required this.judul,
    required this.ketentuan,
    required this.keterangan,
    required this.tanggal,
    required this.urlmore,
  });

  static List<Beasiswa> getItems() {
    return <Beasiswa>[
      Beasiswa(
          id: 1,
          judul: 'Beasiswa Mahaghora',
          ketentuan: '''	
PERSYARATAN BEASISWA
1.	Merupakan putra-putri dari seluruh Indonesia yang mempunyai keterbatasan finansial dan ingin melanjutkan kuliah D4/S1.
2.	Telah melaksanakan vaksinasi minimal tahap 1.
3.	Diperuntukkan bagi:
– siswa-siswi SMA/SMK/sederajat yang sedang menempuh kelas 12 Tahun Ajaran 2021/2022; DAN
– lulusan SMA/SMK/sederajat tahun 2020 dan 2021
4.	Mempunyai visi yang jelas dan motivasi yang kuat untuk menggapai cita-citanya.
5.	Tidak sedang menerima beasiswa lain dan/atau mengikuti seleksi beasiswa lain, tidak terdaftar dalam Kartu Indonesia Pintar (KIP), serta wajib menandatangani surat keterangan diatas materai Rp 10.000,-.
6.	Universitas yang dapat dipilih adalah universitas yang berlokasi di Surabaya baik negeri maupun swasta sesuai dengan minat jurusan masing-masing calon penerima beasiswa.
7.	Penerima beasiswa wajib mengikuti pembekalan berupa kegiatan organisasi dan kegiatan pengembangan diri.
8.	Lebih diutamakan bagi yang mempunyai pengalaman dalam berorganisasi (walaupun tidak ikut organisasi juga tetap bisa mendaftar).
9.	Lebih diutamakan bagi yang mempunyai prestasi/kejuaraan dalam bidang akademik maupun non-akademik selama SMA/SMK/Sederajat (dibuktikan dengan sertifikat).
10.	Penerima beasiswa tidak terikat dengan ikatan dinas.
''',
          keterangan: '''
PENDAFTARAN
Untuk mendaftar Beasiswa Mahaghora, peserta dapat mengisi formulir pendaftaran online pada link berikut: https://pendaftaran.beasiswamahaghora.com/.
''',
          tanggal: '29-12-2022',
          urlmore: 'https://pendaftaran.beasiswamahaghora.com/'),
      Beasiswa(
          id: 2,
          judul: 'Beasiswa Amgen Scholars',
          ketentuan: '''	
Persyaratan:
1. Terdaftar di perguruan tinggi atau universitas di seluruh dunia yang memberikan gelar sarjana atau setara
2. Minimum telah menyelesaikan tahun pertama studi sarjana pada musim panas program dimulai
3. Belum lulus sebelum program musim panas dimulai, dan setelah program musim panas berakhir akan melanjutkan studi sarjana untuk setidaknya satu atau seperempat semester
4. Memiliki prestasi akademik yang bagus
5. Memiliki kemampuan bahasa Inggris yang baik, dibuktikan dengan Skor TOEFL (iBT) 72, skor IELTS 5.5, Cambridge English FCE, TOEIC 1095, skor TOEIC L&R 785, atau skor TOEIC S&W 310 jika buka pengguna bahasa Inggris native atau bahasa Inggris bukan bahasa pertama Anda
6. Minat untuk mengejar gelar Ph.D
''',
          keterangan: '''
Pendaftaran:
Pengajuan beasiswa penelitian Amgen Scholars dilakukan secara online di laman masing-masing universitas. Detil link universitas tertera di laman Amgen Scholars. Perlu dipahami, masing-masing universitas memiliki mekanisme pendaftaran yang berbeda, karena itu sebaiknya dipelajari terlebih dahulu sebelum mengirimkan permohonan.
''',
          tanggal: '29-12-2022',
          urlmore: 'https://scholarship.wardahbeauty.com'),
      Beasiswa(
          id: 3,
          judul: 'Beasiswa Wardah untuk Mahasiswi D4/S1 Tanah Air',
          ketentuan: '''	
Persyaratan:
1. Memiliki prestasi akademik dan non akademik yang baik.
2. Merupakan mahasiswi semester 3 saat periode pendaftaran berlangsung.
3. Program beasiswa diutamakan diberikan kepada mahasiswi yang berasal dari keluarga kurang mampu.
4. Merupakan mahasiswi D4/S1 dari Perguruan Tinggi Negeri yang menjadi mitra
5. Mahasiswi yang bersangkutan belum menikah.
6. Mahasiswi yang bersangkutan tidak sedang mendapatkan beasiswa dari fakultas, universitas, lembaga atau pihak ketiga lainnya.
7. Direkomendasikan oleh pihak Rektorat atau minimal Dekanat
8. Bersedia untuk mengikuti seluruh kegiatan pengembangan diri serta kerelawanan yang dilaksanakan oleh Wardah beserta mitra beasiswa.
9. Beasiswa ini diberikan tanpa ikatan kedinasan atau apapun terhadap mahasiswi penerima beasiswa maupun pihak kampus.
''',
          keterangan: '''
Pendaftaran:
Bagi Anda yang berminat, pendaftaran Beasiswa Wardah dilakukan secara online. Silakan lengkapi formulir registrasi online beasiswa Wardah: https://scholarship.wardahbeauty.com
''',
          tanggal: '29-12-2022',
          urlmore: 'https://scholarship.wardahbeauty.com'),
      Beasiswa(
        id: 4,
        judul:
            'Beasiswa Sarjana Sea Full Jenjang S1 di Universitas Dalam Negeri',
        ketentuan: '''	
Persyaratan:
1. Warganegara Indonesia
2. Terdaftar sebagai mahasiswa tahun pertama, kedua, atau ketiga di universitas mitra Sea (Universitas Indonesia, Institut Teknologi Bandung, Universitas Gadjah Mada, Bina Nusantara, Institut Pertanian Bogor, dan Institut Teknologi Del).
3. Tidak sedang memperoleh beasiswa lain atau komitmen kerja dengan organisasi lain
4. Berkomitmen untuk mempertahankan IPK kumulatif 3.5 / 4.0 (atau lebih tinggi) selama program beasiswa
5. Terdaftar di semua jurusan kecuali Sekolah Kedokteran (termasuk Fakultas Kedokteran, Fakultas Kedokter Hewan, Fakultas Kedokteran Gigi, dan Ilmu Keperawatan)  
''',
        keterangan: '''
Pendaftaran:
Bagi Anda yang ingin mengajukan diri,  pendaftaran Beasiswa Sea 2021 dilakukan secara online di laman beasiswa Sea: idscholarships.seagroup.com
''',
        tanggal: '29-12-2022',
        urlmore: 'https://idscholarships.seagroup.com',
      ),
      Beasiswa(
          id: 5,
          judul:
              'Beasiswa Jardine 2022 – 2023 Program S1 di University of Oxford dan Cambridge',
          ketentuan: '''	
Persyaratan:
1. Sudah meraih standar akademik untuk memenuhi syarat masuk ke salah satu college (lulus SMA/sederajat)
2. Penduduk tetap di salah negara di mana Jardine Matheson Group memiliki kepentingan bisnis signifikan, yang meliputi  Kamboja, Cina daratan, Hong Kong, Indonesia, Malaysia, Myanmar, Filipina, Singapura, Taiwan, Thailand, dan Vietnam.
3. Memiliki kondisi kesehatan yang sangat baik
Dokumen aplikasi:
1. Personal statement yang menjelaskan tujuan, aspirasi, rencana pelamar setelah lulus dan khususnya kegiatan ekstra kurikuler, termasuk olahraga, dan tingkat keterlibatan mereka di masyarakat
2. Pasfoto ukuran paspor terbaru
3. Salinan formulir aplikasi UCAS yang telah dilengkapi
4. Salinan resmi dari transkrip GCSE, A / AS Level dan IB, atau kualifikasi setara yang tunduk pada sistem ujian di negara atau teritori yang bersangkutan. Ini termasuk, tetapi tidak terbatas pada, sertifikat HKDSE, sertifikat SPM atau STPM, dan sertifikat SKHU.
5. Testimoni yang ditandatangani oleh kepala sekolah yang menetapkan:
   a. Hasil akademis yang dicapai dan / atau sementara
   b. Catatan yang akan membantu Komite Beasiswa dalam penilaiannya; dan
   c. Informasi relevan lainnya untuk aplikasi.
''',
          keterangan: '''
Pendaftaran:
Pengajuan beasiswa Jardine 2022 – 2023 dilakukan secara online di laman: jardinesrecruit.com
''',
          tanggal: '29-12-2022',
          urlmore: 'https://jardinesrecruit.com')
    ];
  }
}

class Lowker {
  int id;
  String judul, ketentuan, keterangan, pekerjaan, tempat, urlmore;

  Lowker({
    required this.id,
    required this.pekerjaan,
    required this.judul,
    required this.ketentuan,
    required this.tempat,
    required this.keterangan,
    required this.urlmore,
  });

  static List<Lowker> getItems() {
    return <Lowker>[
      Lowker(
          id: 1,
          pekerjaan: 'Secretary',
          judul: 'Istana Mobil Surabaya Indah PT ',
          ketentuan: '''
Persyaratan
1.	Wanita.
2.	Lulusan S1 Semua Jurusan, IPK min. 2,75
3.	Menguasai Bahasa Inggris aktif dan pasif.
4.	Memiliki SIM A atau SIM C.
5.	Jujur, berpenampilan menarik dan mampu bekerja dibawah tekanan.
6.	
''',
          tempat: 'Surabaya',
          keterangan: '''
info lebih lanjut : https://www.jobs.id/lowongan/MjY5ODgx/secretary-istana-mobil-surabaya-indah-pt?qt_ref=search&qt_page=1&qt_pos=5 
''',
          urlmore: ''),
      Lowker(
          id: 2,
          pekerjaan: 'Sales Executive (SE)',
          judul: 'Wira Arta Telematika PT',
          ketentuan: '''
Persyaratan
1.	Male/Female max 35 years old
2.	Candidate must possess at least bachelor degree in any major
3.	At least 1-2 years direct IT Sales experience
4.	Excellent communication, negotiation, a self motivated, hardworking and problem solving skills
5.	Computer literate
6.	Able to work in team and collaborate with many partners
''',
          tempat: 'Jakarta Raya',
          keterangan: '''
info lebih lanjut : https://www.jobs.id/lowongan/MzEyNjIz/sales-executive-se-wira-arta-telematika-pt?qt_ref=search&qt_page=1&qt_pos=6 
''',
          urlmore:
              'https://www.jobs.id/lowongan/MzEyNjIz/sales-executive-se-wira-arta-telematika-pt?qt_ref=search&qt_page=1&qt_pos=6'),
      Lowker(
          id: 3,
          pekerjaan: 'Staff Accounting',
          judul: 'Jatim Watkoraya PT',
          ketentuan: '''
Persyaratan
1.	Pria / Wanita max. 35 Tahun
2.	Minimal pendidikan SMU Diutamakan S1 Accounting
3.	Memiliki background accounting, mengerti Account Receivable, Account Payable, General Ledger
4.	Mampu membuat laporan keuangan
5.	Mampu bekerja dengan komputer (MS Office & Internet)
6.	Cekatan dan mampu bekerja dalam team / individu
7.	Detail, teliti, memiliki analisa yang baik, inisiatif yang tingi
8.	Mampu bekerja di bawah tekanan dan terbiasa bekerja dengan target waktu
9.	Jangan lupa untuk mencantumkan kota penempatan yang dipilih
10.	Bersedia mengikuti Training di Kantor Pusat 
''',
          tempat: 'Surabaya',
          keterangan: '''
info lebih lanjut : https://www.jobs.id/lowongan/MTU3MTg1/staff-accounting-jatim-watkoraya-pt?qt_ref=search&qt_page=1&qt_pos=11 
''',
          urlmore:
              'https://www.jobs.id/lowongan/MTU3MTg1/staff-accounting-jatim-watkoraya-pt?qt_ref=search&qt_page=1&qt_pos=11'),
      Lowker(
          id: 4,
          pekerjaan: 'Staff Karyawan Kantor',
          judul: 'Republik Indonesia Finance (RIF) PT ',
          ketentuan: '''
Persyaratan
1.	Pria/Wanita
2.	Single/Married
3.	Usia 18-30 tahun
4.	Pengalaman tidak diutamakan (diadakan kelas Training)
5.	Pend. Minimal SMA/SMK (diutamakan D3/S1)
6.	Diutamakan domisili Bandung/ bersedia untuk ditempatkan di Bandung
7.	Jujur, disiplin dan bertanggung jawab
8.	Dapat berkerjasama dan berkoordinasi dengan baik
''',
          tempat: 'Bandung',
          keterangan: '''
Info lebih lanjut : https://www.jobs.id/lowongan/MzA4MDQz/staff-karyawan-kantor-republik-indonesia-finance-rif-pt?qt_ref=search&qt_page=2&qt_pos=0 
''',
          urlmore:
              'https://www.jobs.id/lowongan/MzA4MDQz/staff-karyawan-kantor-republik-indonesia-finance-rif-pt?qt_ref=search&qt_page=2&qt_pos=0'),
      Lowker(
          id: 5,
          pekerjaan: 'Kasir',
          judul: 'RS Belleza Kedaton Bandar Lampung',
          ketentuan: '''
Persyaratan
1.	Laki - Laki & Perempuan
2.	Usia maksimal 30 tahun
3.	D3 Akuntansi / Ekonomi
4.	IPK Diatas 3.00
5.	Fresh Graduate
Dokumen yang harus dilengkapi :
1.	Curiculum Vitae
2.	Melampirkan Fotocopy KTP, Ijazah & Transkip Nilai Terakhir
3.	Melampirkan Sertifikat Pelatihan (bila ada)
4.	melampirkan Surat Keterangan Kerja (bila sudah bekerja)
''',
          tempat: 'Bandar Lampung',
          keterangan: ''' 
Info lebih lanjut : https://www.jobs.id/lowongan/MTkwMjYz/kasir-rs-belleza-kedaton-bandar-lampung?qt_ref=search&qt_page=2&qt_pos=13 
''',
          urlmore:
              'https://www.jobs.id/lowongan/MTkwMjYz/kasir-rs-belleza-kedaton-bandar-lampung?qt_ref=search&qt_page=2&qt_pos=13')
    ];
  }
}
