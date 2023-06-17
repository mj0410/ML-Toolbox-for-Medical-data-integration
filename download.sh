# download pretrained sherlock model features provided by Zhang et al.

export BASEPATH=path_to/semantic_type_detection

cd $BASEPATH

data_URL="http://sato-data.s3.amazonaws.com"
curl "$data_URL/pretrained.zip" > sherlock/pretrained.zip
cd sherlock; unzip pretrained.zip; cd -
rm sherlock/pretrained.zip

