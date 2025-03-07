Nama : Devandra Reswara Arkananta

NPM : 2206083552

## Implementasi Latihan Mandiri Tutorial 3:

#### 1. New Animation 
* Animasi baru dibuat menggunakan AnimatedSprite2D, dimana dengan SpriteFrames bisa menggunakan splicing untuk dibuat animasi baru untuk jump, crouch, walk, dan idle.
* implementasi animasi ke pergerakan dibuat dengan sprite.play lalu untuk mengubah arah menggunakan sprite.flip_h

#### 2. Movement Upgrade
* ada dua movement yang ditambahkan, yaitu crouch, double jump, dan dashing, crouch bisa hanya dengan menambahkan animasi, double jump dengan menggunakan jump counter yang maksimalnya 2 hingga tidak bisa jump lagi jika sudah 2 kali jump, lalu dashing dengan menggunakan tombol shift untuk menambah kecepatan karakter.

## Implementasi Latihan Mandiri Tutorial 5:

#### 1. Object Baru dengan animasi
* Animasi untuk NPC baru dibuat menggunakan AnimatedSprite2D, dimana dengan SpriteFrames bisa menggunakan splicing untuk dibuat animasi baru untuk walking, lalu object bisa jalan sendiri dari kiri ke kanan.
* implementasi animasi ke pergerakan dibuat dengan sprite.play lalu untuk mengubah arah menggunakan sprite.flip_h

#### 2. Audio SFX
* ditambahkan dengan menggunakan audiostreamplayer yang ditambahkan pada root node player, lalu ditambahkan pada kode sehingga bisa saat player walking maka sound akan berjalan

#### 2. Background Music
* ditambahkan dengan menggunakan audiostreamplayer pada main node, lalu di set secara looping sehingga saat game dimulai akan bermain terus

#### 2. Interaksi Object baru dengan kendali pemain
* ditambahkan dengan mendeteksi klik dari mouse, dan klik mouse dirouting ke audiostreamplayer sound klik, jadi pada game ketika klik mouse pada object baru, maka sound klik akan langsung menyala

#### 2.Interaksi object baru dengan pemain
* ditambahkan dengan menggunakan audiostreamplayer untuk collision pada player node, setelah itu object tersebut di link pada kode di dalam player yang mendeteksi collision, jadi ketika object collide pada kiri atau kanan dari player, maka sound collision akan langsung berjalan.
