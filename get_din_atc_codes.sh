#!/bin/sh
if [ ! -d update ]; then
  mkdir update
  touch update/.gitkeep
fi
cd update
wget http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/ther.zip || curl -O http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/ther.zip
wget http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/ther_ia.zip || curl -O http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/ther_ia.zip
wget http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/drug.zip || curl -O http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/drug.zip
wget http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/drug_ia.zip || curl -O http://www.hc-sc.gc.ca/dhp-mps/alt_formats/zip/prodpharma/databasdon/drug_ia.zip
unzip ther.zip
unzip ther_ia.zip
unzip drug.zip
unzip drug_ia.zip
