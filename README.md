Projeto apresentado na Feira Maker 2023 em Curitiba, recebendo o prêmio de 2° Lugar.
O projeto consiste em um exaustor para recintos animais, principalmente roedores, controlado por níveis de amônia. 
Um sensor de amônia do tipo MQ137 integrado ao ESP32 controla o exaustor, ligando-o quando atinge 25ppm de amônia, quantidade considerada prejudicial à saúde dos animais. 

<img src="https://github.com/juliazschwartz/Ammonia_Control_Fan/blob/main/IMG_20231219_164715_1.jpg" alt="Your image title" width="250"/>

Quando cai abaixo desse valor, ele desliga. Também é feito o controle manual da velocidade do exaustor por um circuito PWM.
Além disso, foi construido um aplicativo em Flutter para receber os dados em tempo real dos níveis de amônia, pela comunicação através de sockets UDP.
![alt text](https://github.com/juliazschwartz/Ammonia_Control_Fan/blob/main/Screenshot_2023-12-19-16-45-17-596_com.example.flutter_application_1.jpg)
O adaptador para a mangueira no exaustor foi modelada e impressa em 3D.
![alt text](https://github.com/juliazschwartz/Ammonia_Control_Fan/blob/main/modelo.png)
![alt text](https://github.com/juliazschwartz/Ammonia_Control_Fan/blob/main/IMG_20231128_121346.jpg)



![alt text](https://github.com/juliazschwartz/Ammonia_Control_Fan/blob/main/FB_IMG_1702936540810.jpg)





