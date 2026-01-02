//Move dilinde loop döngüsü, koşulsuz olarak sürekli tekrar eden bir döngüdür ve genellikle break ifadesiyle sonlandırılır.
module firat::loop_ornek;

public fun toplam_loop(n: u64): u64 {
    let mut topla = 0; // Toplamı tutacak değişken
    let mut i = 0; // Sayaç değişkeni
    loop {
        if (i >= n) {
            break // i, n'ye ulaştığında döngüyü sonlandır
        };
        i = i + 1; // i'yi bir artır
        topla = topla + i; // i'yi toplama ekle
    };
    topla // Toplamı döndür
}

#[test]
fun test_topla() {
    // 5'e kadar olan sayıların toplamı 15 olmalı (1+2+3+4+5)
    assert!(toplam_loop(5) == 15, 100);

    // 10'a kadar olan sayıların toplamı 55 olmalı (1+2+...+10)
    assert!(toplam_loop(10) == 55, 101);
}
