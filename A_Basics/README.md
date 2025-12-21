# 🛠️ Sui Move Temelleri: Bölüm A - Temel Kavramlar

Bu dizin, **Fırat Blockchain** tarafından hazırlanan Sui Move eğitim serisinin ilk aşamasını içermektedir. Bu bölümde, Move dilinin temel yapı taşlarını ve Sui ekosistemine özgü temel programlama mantığını öğrenebilirsiniz.

---

## 📋 İçerik Tablosu
- [Giriş](#giriş)
- [Öğrenilecek Temel Konular](#öğrenilecek-temel-konular)
- [Gereksinimler](#gereksinimler)
- [Kullanım ve Komutlar](#kullanım-ve-komutlar)
- [Dizin Yapısı](#dizin-yapısı)

---

## 🚀 Giriş
Move, güvenliği ve kaynak (resource) yönetimini merkeze alan bir akıllı sözleşme dilidir. Sui üzerinde kullanılan Move (Sui Move), nesne odaklı (object-centric) yapısıyla standart Move'dan ayrılır. Bu bölümdeki örnekler, bu temel mantığı kavramanıza yardımcı olmak için tasarlanmıştır.

## 📚 Öğrenilecek Temel Konular
Bu klasördeki kod örnekleri şu konuları kapsar:
* **Primitif Veri Tipleri:** `u8`, `u64`, `u128`, `bool`, `address`.
* **Değişken Yönetimi:** `let` anahtar kelimesi.
* **Sabit Yönetimi:** `const` anahtar kelimesi.

## 🛠 Gereksinimler
Kodları çalıştırmak için sisteminizde Sui CLI'nın kurulu olması gerekir.
* [Sui Kurulum Dokümantasyonu](https://docs.sui.io/guides/developer/getting-started/sui-install)

## 💻 Kullanım ve Komutlar

Terminalinizi bu klasörde (`A_Basics`) açtıktan sonra aşağıdaki komutları kullanabilirsiniz:

**1. Projeyi Derleme:**
```bash
sui move build
```

**2. Test Süreci:**
Çıktıları daha rahat görmeniz için tasarlanmıştır.
```bash
sui move test [test fonksiyonun adı]
```
