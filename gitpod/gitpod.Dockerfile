FROM gitpod/workspace-full

USER gitpod

# Does not build, upstream sucks
RUN true \
  && sudo apt install -y build-essential gcc-multilib cmake-data cpp-5 g++-5 gcc-5 gcc-5-base gcc-5-multilib lib32asan2 lib32atomic1 lib32cilkrts5 lib32gcc-5-dev lib32gcc1 lib32gomp1 lib32itm1 lib32mpx0 lib32quadmath0 lib32stdc++6 lib32ubsan0 libarchive13 libasan2 libatomic1 libc6-dev-i386 libc6-dev-x32 libc6-i386 libc6-x32 libcc1-0 libcilkrts5 libgcc-5-dev libgomp1 libitm1 libjsoncpp1 liblsan0 libmpx0 libquadmath0 libstdc++-5-dev libstdc++6 libtsan0 libubsan0 libx32asan2 libx32atomic1 libx32cilkrts5 libx32gcc-5-dev libx32gcc1 libx32gomp1 libx32itm1 libx32quadmath0 libx32stdc++6 libx32ubsan0 \
  && git clone --branch=dev https://github.com/pawn-lang/compiler.git pawn-compiler \
  && cd pawn-compiler/source/compiler \
  && mkdir build \
  && cd build \
  && cmake ../ -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_C_FLAGS="-m32 -Werror -Wno-address-of-packed-member" -DCPACK_GENERATOR="TGZ;ZIP" \
  && make \
  && make install