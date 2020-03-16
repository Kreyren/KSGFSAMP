FROM gitpod/workspace-full

USER gitpod

RUN true \
  && git clone --depth=50 --branch=dev https://github.com/pawn-lang/compiler.git pawn-compiler \
  && cd pawn-compiler \
  && mkdir build && cd build \
  && cmake ../source/compiler -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_FLAGS="-m32 -Werror -Wno-address-of-packed-member" -DCPACK_GENERATOR="TGZ;ZIP" \
  && make \
  && make install