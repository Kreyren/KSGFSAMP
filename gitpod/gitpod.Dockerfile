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
  && sudo make install