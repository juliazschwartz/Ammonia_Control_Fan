Projeto apresentado na Feira Maker 2023 em Curitiba, recebendo o prêmio de 2° Lugar.
O projeto consiste em um exaustor para recintos de roedores e outros animais, controlado por níveis de amônia. 
Um sensor de amônia do tipo MQ137 integrado ao ESP32 controla o exaustor, ligando-o quando atinge 25ppm de amônia, quantidade considerada prejudicial à saúde dos animais. 

<img src="https://github.com/juliazschwartz/Ammonia_Control_Fan/blob/main/fan.png" alt="fan" width="250"/>
<img src="https://github.com/juliazschwartz/Ammonia_Control_Fan/blob/main/mq137_a.jpg" alt="sensor" width="250"/>

Quando cai abaixo desse valor, ele desliga. Também é feito o controle manual da velocidade do exaustor por um circuito PWM.
Além disso, foi construido um aplicativo em Flutter para receber os dados em tempo real dos níveis de amônia, pela comunicação através de sockets UDP.

<img src="https://github.com/juliazschwartz/Ammonia_Control_Fan/blob/main/flutter_dashboard.jpg" alt="Your image title" width="250"/>

O adaptador para a mangueira no exaustor foi modelada e impressa em 3D.
<img src="https://github.com/juliazschwartz/Ammonia_Control_Fan/blob/main/modelo.png" alt="Your image title" width="250"/>
<img src="https://github.com/juliazschwartz/Ammonia_Control_Fan/blob/main/hose_adaptor.jpg" alt="Your image title" width="100"/>

Apresentação na Feira Maker: 
<img src="https://github.com/juliazschwartz/Ammonia_Control_Fan/blob/main/maker_fair.jpg" alt="Your image title" width="250"/>





