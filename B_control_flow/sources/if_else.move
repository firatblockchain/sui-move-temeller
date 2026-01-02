module firat::if_else_ornek;

// Bu fonksiyon bir sayının pozitif olup olmadığını kontrol eder
public fun pozitif_mi(n: u64): bool {
    // Eğer n sıfırdan büyükse, true döndür
    if (n > 0) {
        // Buraya sadece n > 0 ise girilir
        // Sonuç olarak true döndürülür
        true
    } else {
        // Eğer n > 0 değilse (yani n sıfır veya negatifse) buraya girilir
        // Sonuç olarak false döndürülür
        false
    }
    // Fonksiyonun dönüş tipi bool olduğu için, yukarıdaki bloklardan biri çalışır ve sonuç döner
}

#[test]
public fun test_pozitif_mi() {
    // 5 pozitif olduğu için true dönmeli
    assert!(pozitif_mi(5) == true, 100);

    // 0 sıfır olduğu için false dönmeli
    assert!(pozitif_mi(0) == false, 101);
}
