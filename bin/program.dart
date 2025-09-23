import 'dart:io';
import 'dart:math';

// List untuk menyimpan riwayat hasil program
List<String> history = [];

void main() {
  while (true) {
    print("\n=== MENU PROGRAM ===");
    print("1. Hitung Faktorial");
    print("2. Cek Bilangan Prima");
    print("3. Game Tebak Angka");
    print("4. Keluar");
    print("5. Lihat History"); // menu tambahan
    stdout.write("Pilih menu: ");
    String? pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        hitungFaktorial();
        break;
      case '2':
        cekPrima();
        break;
      case '3':
        gameTebakAngka();
        break;
      case '4':
        print("Terima kasih, program selesai.");
        return;
      case '5':
        tampilkanHistory();
        break;
      default:
        print("Pilihan tidak valid, coba lagi.");
    }
  }
}

// 1. Faktorial (for)
void hitungFaktorial() {
  stdout.write("Masukkan angka: ");
  int n = int.parse(stdin.readLineSync()!);
  int hasil = 1;
  for (int i = 1; i <= n; i++) {
    hasil *= i;
  }
  print("Faktorial dari $n = $hasil");
  history.add("Faktorial dari $n = $hasil"); // simpan ke history
}

// 2. Cek Bilangan Prima (while + if-else)
void cekPrima() {
  stdout.write("Masukkan angka: ");
  int n = int.parse(stdin.readLineSync()!);
  if (n < 2) {
    print("$n bukan bilangan prima");
    history.add("$n bukan bilangan prima");
    return;
  }
  int i = 2;
  bool prima = true;
  while (i <= n ~/ 2) {
    if (n % i == 0) {
      prima = false;
      break;
    }
    i++;
  }
  if (prima) {
    print("$n adalah bilangan prima");
    history.add("$n adalah bilangan prima");
  } else {
    print("$n bukan bilangan prima");
    history.add("$n bukan bilangan prima");
  }
}

// 3. Game Tebak Angka (do-while + random)
void gameTebakAngka() {
  var random = Random();
  int angkaRahasia = random.nextInt(10) + 1;
  int tebakan;
  int kesempatan = 3;

  print("Tebak angka antara 1 sampai 10! Punya $kesempatan kesempatan.");

  do {
    stdout.write("Masukkan tebakan: ");
    tebakan = int.parse(stdin.readLineSync()!);
    if (tebakan == angkaRahasia) {
      print("Selamat! Tebakan benar.");
      history.add("Game: Tebakan benar ($tebakan)"); // simpan hasil
      return;
    } else {
      print("Salah! Coba lagi.");
      kesempatan--;
    }
  } while (kesempatan > 0);

  print("Kesempatan habis. Angka rahasia adalah $angkaRahasia.");
  history.add("Game: Gagal menebak, angka rahasia = $angkaRahasia");
}

// 4. Tampilkan History (for-in)
void tampilkanHistory() {
  if (history.isEmpty) {
    print("Belum ada riwayat.");
    return;
  }
  print("\n=== HISTORY PROGRAM ===");
  for (var h in history) {
    print(h);
  }
}