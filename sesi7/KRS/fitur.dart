import 'data.dart';
import 'input.dart';

// ============================================================
// Fungsi bantu
// ============================================================

/// Mencari mata kuliah berdasarkan kode. Mengembalikan null jika tidak ada.
Map<String, dynamic>? cariByKode(String kode) {
  for (final matkul in daftarMatkul) {
    if (matkul['kode'] == kode) return matkul;
  }
  return null;
}

/// Mencetak satu baris data mata kuliah.
void cetakMatkul(Map<String, dynamic> matkul) {
  final hari = matkul['hari'] as Hari;
  print(
    '${matkul['kode']} | ${matkul['nama']} | ${matkul['sks']} SKS | '
    '${hari.name} ${matkul['mulai']}-${matkul['selesai']}',
  );
}

/// Menjumlahkan SKS semua mata kuliah di KRS.
int hitungTotalSks() {
  var total = 0;
  for (final kode in krs) {
    total += cariByKode(kode)!['sks'] as int;
  }
  return total;
}

/// Meminta pengguna memilih hari.
Hari bacaHari() {
  final pilihan = bacaInt(
    'Hari (1=senin, 2=selasa, 3=rabu, 4=kamis, 5=jumat)',
    min: 1,
    max: 5,
  );
  return switch (pilihan) {
    1 => Hari.senin,
    2 => Hari.selasa,
    3 => Hari.rabu,
    4 => Hari.kamis,
    _ => Hari.jumat,
  };
}

// ============================================================
// Fitur yang sudah jadi
// ============================================================

/// Menu 1: menampilkan semua mata kuliah yang ditawarkan.
void tampilkanMatkul() {
  print('\n=== Mata Kuliah Ditawarkan ===');
  for (final matkul in daftarMatkul) {
    cetakMatkul(matkul);
  }
}

/// Menu 2: mengambil mata kuliah ke KRS.
void ambilMatkul() {
  print('\n=== Ambil Mata Kuliah ===');
  final kode = bacaTeks('Kode mata kuliah').toUpperCase();
  final matkul = cariByKode(kode);
  if (matkul == null) {
    print('Mata kuliah $kode tidak ditemukan.');
    return;
  }
  if (krs.contains(kode)) {
    print('${matkul['nama']} sudah ada di KRS.');
    return;
  }
  final batas = hitungBatasSks(ipk);
  final sksBaru = hitungTotalSks() + (matkul['sks'] as int);
  if (sksBaru > batas) {
    print('Gagal: total SKS menjadi $sksBaru, batas SKS Anda $batas.');
    return;
  }
  final bentrok = cariBentrok(matkul);
  if (bentrok != null) {
    print('Gagal: jadwal bentrok dengan ${bentrok['nama']}.');
    return;
  }
  krs.add(kode);
  print('${matkul['nama']} berhasil diambil.');
}

/// Menu 3: menampilkan isi KRS dan total SKS.
void tampilkanKrs() {
  print('\n=== KRS Saya ===');
  if (krs.isEmpty) {
    print('KRS masih kosong.');
    return;
  }
  for (final kode in krs) {
    cetakMatkul(cariByKode(kode)!);
  }
  print('Total SKS: ${hitungTotalSks()} dari batas ${hitungBatasSks(ipk)}');
}

// ============================================================
// Fitur pilihan (pilih minimal 3, lihat README.md)
// ============================================================

/// Menu 4 [Mudah]: menghapus mata kuliah dari KRS.
void dropMatkul() {
  print('\n=== Drop Mata Kuliah ===');
  final kode = bacaTeks('Kode mata kuliah').toUpperCase();

  if (krs.contains(kode)) {
    krs.remove(kode);
    print('Mata kuliah $kode berhasil di-drop.');
  } else {
    print('Gagal: Mata kuliah $kode tidak ada di dalam KRS Anda.');
  }
}

/// Menu 5 [Mudah]: menampilkan mata kuliah yang ditawarkan pada satu hari.
void tampilkanMatkulPerHari() {
  print('\n=== Mata Kuliah per Hari ===');
  final hariPilihan = bacaHari();

  print('\nHari ${hariPilihan.name}:');
  var adaMatkul = false;

  for (final matkul in daftarMatkul) {
    if (matkul['hari'] == hariPilihan) {
      print(
        '${matkul['kode']} ${matkul['nama']} ${matkul['sks']} SKS ${hariPilihan.name} ${matkul['mulai']}-${matkul['selesai']}',
      );
      adaMatkul = true;
    }
  }

  if (!adaMatkul) {
    print('Tidak ada jadwal mata kuliah di hari ${hariPilihan.name}.');
  }
}

/// [Sedang] Menentukan batas SKS berdasarkan IPK.
///
/// Fungsi ini sudah dipakai di menu 2 dan 3. Selama belum dibuat, batasnya
/// selalu batasSksDefault.
int hitungBatasSks(double ipk) {
  if (ipk >= 3.00) {
    return 24;
  } else if (ipk >= 2.50) {
    return 21;
  } else if (ipk >= 2.00) {
    return 18;
  } else {
    return 15;
  }
}

/// Menu 6 [Sedang]: menampilkan jadwal kuliah dari KRS, dikelompokkan per hari.
void tampilkanJadwal() {
  print('\n=== Jadwal Kuliah Saya ===');
  if (krs.isEmpty) {
    print('KRS masih kosong.');
    return;
  }

  for (final hari in Hari.values) {
    final listMatkulHariIni = <Map<String, dynamic>>[];

    for (final kode in krs) {
      final matkul = cariByKode(kode)!;
      if (matkul['hari'] == hari) {
        listMatkulHariIni.add(matkul);
      }
    }

    if (listMatkulHariIni.isNotEmpty) {
      print('${hari.name}:');
      for (final m in listMatkulHariIni) {
        print('  ${m['mulai']}-${m['selesai']} ${m['nama']}');
      }
    }
  }
}

/// [Sulit] Mencari mata kuliah di KRS yang jadwalnya bentrok dengan [baru].
///
/// Fungsi ini sudah dipakai di menu 2. Selama belum dibuat, tidak pernah ada
/// jadwal bentrok.
Map<String, dynamic>? cariBentrok(Map<String, dynamic> baru) {
  for (final kode in krs) {
    final matkulKrs = cariByKode(kode)!;
    if (matkulKrs['hari'] == baru['hari']) {
      final mulaiA = matkulKrs['mulai'] as int;
      final selesaiA = matkulKrs['selesai'] as int;
      final mulaiB = baru['mulai'] as int;
      final selesaiB = baru['selesai'] as int;

      // Logika beririsan jam kuliah
      if (mulaiA < selesaiB && mulaiB < selesaiA) {
        return matkulKrs;
      }
    }
  }
  return null;
}

/// Menu 7 [Sulit]: mencetak KRS lengkap dengan identitas mahasiswa.
void cetakKrsLengkap() {
  print('\n=== KARTU RENCANA STUDI ==========');
  print('Nama : $namaMahasiswa');
  print('NIM  : $nimMahasiswa');

  final batas = hitungBatasSks(ipk);
  print('IPK  : $ipk (batas $batas SKS)');
  print('==================================');

  var nomor = 1;
  for (final kode in krs) {
    final m = cariByKode(kode)!;
    final hari = m['hari'] as Hari;
    print(
      '$nomor. ${m['kode']} ${m['nama']} (${m['sks']} SKS) ${hari.name} ${m['mulai']}-${m['selesai']}',
    );
    nomor++;
  }

  final totalSks = hitungTotalSks();
  final sisaSks = batas - totalSks;
  print('Total SKS: $totalSks');
  print('Sisa SKS: $sisaSks');
}
