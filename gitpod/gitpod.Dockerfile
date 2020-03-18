FROM gitpod/workspace-full

USER gitpod

# Does not build, upstream sucks
RUN true \
  && sudo apt install -y build-essential gcc-multilib \
  && git clone --branch=master https://github.com/pawn-lang/compiler.git pawn-compiler \
  && cd pawn-compiler/source/compiler \
  && mkdir build \
  && cd build \
  && cmake ../ -DCMAKE_C_FLAGS="-m32" -DCMAKE_BUILD_TYPE=Release \
  && make \
  && sudo make install \
  && sudo dpkg --add-architecture i386 \
  && wget -nc https://dl.winehq.org/wine-builds/winehq.key \
  && sudo apt-key add winehq.key \
  && sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ $(cat /etc/os-release | grep "UBUNTU_CODENAME" | grep -oP "[^=]+$") main' \
  && apt update \
  && apt install -y winehq-stable