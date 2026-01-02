// break: Bir döngüyü (örneğin loop veya while) anında sonlandırır ve döngüden çıkar.
// continue: Döngünün o anki iterasyonunu atlar ve bir sonraki iterasyona geçer.

// BREAK KULLANIMI
module firat::break_continue_ornek;

public fun topla(n: u64): u64 {
    let mut toplam = 0; 
    let mut i = 1; 
    while (i <= n) {
        // i n'den küçük veya eşit olduğu sürece döngü devam eder
        if (i == 5) {
            break // i DEĞİŞKENİ 5 OLDUĞUNDA DÖNGÜYÜ "BREAK" İLE SONLANDIRDIK
        };
        toplam = toplam + i; // i'yi toplama ekle
        i = i + 1; // i'yi bir artır
    };
    toplam // Toplamı döndür
}

#[test_only]
use std::debug::print;

#[test]
fun test_toplam() {
    // 10'a kadar olan sayıların toplamı, ancak 5'e kadar olanlar dahil (1+2+3+4)

    let test = topla(10);
    print(&test); // Beklenen sonuç 10'dur (1+2+3+4)
}
