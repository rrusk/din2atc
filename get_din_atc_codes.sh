#!/bin/sh
if [ ! -d download ]; then
  mkdir download
fi
cd download
rm drug*.zip* ther*.zip*
wget http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/ther.zip || curl -O http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/ther.zip
wget http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/ther_ia.zip || curl -O http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/ther_ia.zip
wget http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/drug.zip || curl -O http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/drug.zip
wget http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/drug_ia.zip || curl -O http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/drug_ia.zip
if [ ! -d ../data ]; then
  mkdir ../data
fi
cd ../data
unzip -o ../download/ther.zip
unzip -o ../download/ther_ia.zip
unzip -o ../download/drug.zip
unzip -o ../download/drug_ia.zip
