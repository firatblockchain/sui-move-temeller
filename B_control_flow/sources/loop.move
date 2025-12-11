//Move dilinde loop döngüsü, koşulsuz olarak sürekli tekrar eden bir döngüdür ve genellikle break ifadesiyle sonlandırılır.
module firat::loop_example;

    public fun sum(n: u64): u64 {
        let mut sum = 0; // Toplamı tutacak değişken
        let mut i = 0; // Sayaç değişkeni
        loop {
            if (i >= n) {
                break // i, n'ye ulaştığında döngüyü sonlandır
            };
            i = i + 1; // i'yi bir artır
            sum = sum + i; // i'yi toplama ekle
        };
        sum // Toplamı döndür
    }

    #[test]
    fun test_sum() {
        // 5'e kadar olan sayıların toplamı 15 olmalı (1+2+3+4+5)
        assert!(sum(5) == 15, 100);

        // 10'a kadar olan sayıların toplamı 55 olmalı (1+2+...+10)
        assert!(sum(10) == 55, 101);
    }   
