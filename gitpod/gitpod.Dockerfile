FROM gitpod/workspace-full

USER gitpod

RUN true \
  && wget https://github.com/pawn-lang/compiler/releases/download/v3.10.10/pawnc-3.10.10-linux.tar.gz "$HOME/.cache/pawnc-3.10.10-linux.tar.gz" \
  && { mkdir "$HOME/.cache" || true ;} \
  && tar xpf "$HOME/.cache/pawnc-3.10.10-linux.tar.gz" -C /tmp \
  && cp /tmp/pawnc-3.10.10-linux/bin/pawncc /usr/bin/pawncc \
  && cp /tmp/pawnc-3.10.10-linux/bin/pawndisasm /usr/bin/pawndisasm \
  && cp /tmp/pawnc-3.10.10-linux/lib/libpawnc.so /lib32/libpawnc.so

# Does not build, upstream sucks
# RUN true \
#   && sudo apt install -y build-essential gcc-multilib \
#   && git clone --branch=dev https://github.com/pawn-lang/compiler.git pawn-compiler \
#   && cd pawn-compiler \
#   && mkdir build \
#   && cd build \
#   && cmake ../source/compiler -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_FLAGS="-m32 -Werror" -DCPACK_GENERATOR="TGZ;ZIP" \
#   && make \
#   && make install