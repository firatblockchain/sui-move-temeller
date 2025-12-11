// break: Bir döngüyü (örneğin loop veya while) anında sonlandırır ve döngüden çıkar.
// continue: Döngünün o anki iterasyonunu atlar ve bir sonraki iterasyona geçer.


// BREAK KULLANIMI 
module firat::break_continue_example;

public fun sum(n: u64): u64 {
    let mut sum = 0; // Toplamı tutacak değişken
    let mut i = 1; // Sayaç değişkeni
    while (i <= n) { // i n'den küçük veya eşit olduğu sürece döngü devam eder
        if (i == 5) {
            break // i DEĞİŞKENİ 5 OLDUĞUNDA DÖNGÜYÜ "BREAK" İLE SONLANDIRDIK
        };
        sum = sum + i; // i'yi toplama ekle
         i = i + 1; // i'yi bir artır
    };
     sum // Toplamı döndür
 }

#[test_only]
use std::debug::print;

#[test]
fun test_sum() {
    // 10'a kadar olan sayıların toplamı, ancak 5'e kadar olanlar dahil (1+2+3+4)

    let test= sum(10);
     print(&test);// Beklenen sonuç 10'dur (1+2+3+4)

}   
