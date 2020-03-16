FROM gitpod/workspace-full

USER gitpod

RUN true \
  && sudo apt install -y build-essential libc6-dev:amd64 \
  && git clone https://github.com/pawn-lang/compiler.git pawn-compiler \
  && cd pawn-compiler \
  && mkdir build \
  && cd build \
  && cmake ../source/compiler -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_FLAGS="-m32 -Werror -Wno-address-of-packed-member" -DCPACK_GENERATOR="TGZ;ZIP" \
  && make \
  && make install