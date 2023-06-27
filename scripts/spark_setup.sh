#!/bin/bash
echo "Downloading Java"

cd ~
mkdir spark
cd spark
wget https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
# tar -zxf 解壓縮 v means verbose, 顯示解壓過程
tar xzfv openjdk-11.0.2_linux-x64_bin.tar.gz

# 每次啟動bash時可以直接宣告變數, 但寫進script時沒有啟動，所以需要下面多一行eval執行.bashrc中的內容
echo "Exporting Java path"
echo '' >> ~/.bashrc
echo 'export JAVA_HOME="${HOME}/spark/jdk-11.0.2"' >> ~/.bashrc
echo 'export PATH="${JAVA_HOME}/bin:${PATH}"' >> ~./bashrc

# A hack because source .bashrc doesn't work inside the script
eval "$(cat ~/.bashrc | tail -n +10)"

rm openjdk-11.0.2_linux-x64_bin.tar.gz

echo "Downloading Spark"
wget https://dlcdn.apache.org/spark/spark-3.0.3/spark-3.0.3-bin-hadoop3.2.tgz

echo "Extracting Spark"
tar xzfv spark-3.0.3-bin-hadoop3.2.tgz
rm spark-3.0.3-bin-hadoop3.2.tgz

echo "Exporting Spark Home"
echo '' >> ~/.bashrc
echo 'export SPARK_HOME="${HOME}/spark/spark-3.0.3-bin-hadoop3.2"' >> ~/.bashrc
# use colon(:) as separation
echo 'export PATH="${SPARK_HOME}/bin:${PATH}"' >> ~/.bashrc
eval "$(cat ~/.bashrc | tail -n +10)"

echo "Setting up Pyspark"
# Get correct name for py4j library
# basename 用來去掉文件名的目錄和後綴，此例會取得最後文件名py4j...
py4j="$(basename ${SPARK_HOME}/python/lib/py4j*)"
echo "py4j version is $py4j"

echo '' >> ~/.bashrc
echo 'export PYTHONPATH="${SPARK_HOME}/python/:${PYTHONPATH}"' >> ~/.bashrc
# ${!var}, ! mean indirection.
echo 'export PYTHONPATH="${SPARK_HOME}/python/lib/${!py4j}:${PYTHONPATH}"' >> ~/.bashrc



