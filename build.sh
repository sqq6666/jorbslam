mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j

#cd ../../Pangolin/

#echo "Configuring and building Thirdparty/Pangolin ..."

#mkdir build
#cd build
#cmake .. -DBUILD_TOOLS=OFF -DBUILD_EXAMPLES=OFF
#make -j

#cd ../../../

echo "Uncompress vocabulary ..."

cd Vocabulary
tar -xf ORBvoc.txt.tar.gz
cd ..

echo "Configuring and building ORB_SLAM2 ..."

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j
cd ..

echo "Converting vocabulary to binary"
./build/binarize
