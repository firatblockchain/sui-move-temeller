module firat::while_example;

public fun topla(n: u64): u64 {
    let mut sum = 0; // Toplamı tutacak değişken
    let mut i = 1; // Sayaç değişkeni   

    while (i <= n) { // i n'den küçük veya eşit olduğu sürece döngü devam eder
        sum = sum + i; // i'yi toplama ekle
        i = i + 1 // i'yi bir artır
    };

    sum // Toplamı döndür
}

#[test_only]
use std::debug::print;

#[test]
fun test_topla() {
    let test_topla = topla(5);

    // 5'e kadar olan sayıların toplamı 15 olmalı (1+2+3+4+5)
    print(&test_topla);
}   
