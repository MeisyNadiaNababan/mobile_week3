import 'dart:io';
import 'dart:math';

void main() {
  while (true) {
    print("\n=== MENU PROGRAM ===");
    print("1. Hitung Faktorial");
    print("2. Cek Bilangan Prima");
    print("3. Game Tebak Angka");
    print("4. Keluar");
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
      default:
        print("Pilihan tidak valid, coba lagi.");
    }
  }
}
