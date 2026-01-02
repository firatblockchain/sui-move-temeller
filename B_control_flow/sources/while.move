module firat::while_ornek;

public fun while_topla(n: u64): u64 {
    let mut toplam = 0; 
    let mut i = 1; 

    while (i <= n) {
        // i n'den küçük veya eşit olduğu sürece döngü devam eder
        toplam = toplam + i; // i'yi toplama ekle
        i = i + 1 // i'yi bir artır
    };

    toplam // Toplamı döndür
}

#[test_only]
use std::debug::print;

#[test]
fun test_topla() {
    let test_topla = while_topla(5);

    // 5'e kadar olan sayıların toplamı 15 olmalı (1+2+3+4+5)
    print(&test_topla);
}
