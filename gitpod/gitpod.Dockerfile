FROM gitpod/workspace-full

USER gitpod

# Does not build, upstream sucks
RUN true \
  && sudo apt install -y build-essential gcc-multilib \
  && git clone --branch=dev https://github.com/pawn-lang/compiler.git pawn-compiler \
  && cd pawn-compiler \
  && mkdir build \
  && cd build \
  && cmake ../source/compiler -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_FLAGS="-m32 -Werror" -DCPACK_GENERATOR="TGZ;ZIP" \
  && make \
  && make install