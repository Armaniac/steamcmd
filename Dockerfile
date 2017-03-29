FROM rainee4563/ubuntu:16.04-i386
MAINTAINER Calvin Nguyen <calvin4084@gmail.com>

ADD rootfs /
CMD ["bash"]

RUN groupadd -r steam
RUN useradd -r -d /home/steam -g steam steam
RUN apt-get update && apt-get install -y \
    lib32gcc1 \
    wget \
    unzip \
    nano \
    htop \
    screen \
    lib32stdc++6 \
    mono-reference-assemblies-2.0 \
    mono-runtime \
    libc6:i386 \
    libgl1-mesa-glx:i386 \
    libxcursor1:i386 \
    libxrandr2:i386 \
    libc6-dev-i386 \
    libgcc-4.8-dev:i386
RUN apt-get clean
RUN mkdir -p /home/steam && chown -R steam:steam /home/steam
RUN cd /home/steam
RUN wget https://ci.rocketmod.net/job/Rocket.Unturned%20Linux/lastSuccessfulBuild/artifact/Rocket.Unturned/bin/Release/Rocket.zip -o rocket.zip
RUN unzip -o rocket.zip && rm rocket.zip
RUN cd ~/Scripts && chmod 755 update.sh && chmod 755 start.sh
