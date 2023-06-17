export BASEPATH=path_to/semantic_type_detection
export INPUT_DIR=path_to_input_files
export SHERLOCKPATH=$BASEPATH/sherlock
export EXTRACTPATH=$BASEPATH/extract

export TYPENAME=name_of_type
export LDANAME=name_of_lda_model
export TOPICMODELPATH=$BASEPATH/topic_model/LDA_cache/$TYPENAME

cd $BASEPATH/extract
python make_type_list.py --file_path $INPUT_DIR --type_name $TYPENAME
python extract_header.py header.pkl -n 50 -o True
python split_train_test.py --header_file header.pkl --output split_cv --cv 10
python extract_features.py header.pkl -O test

cd $BASEPATH/topic_model
python train_LDA.py -n $LDANAME -cv 10 -s split_cv -b 512 --topic_num 7
cd $BASEPATH/extract
python extract_features.py header.pkl -O output_feature_name -f topic -LDA $LDANAME

cd $BASEPATH/model
python train_sherlock.py -c $BASEPATH/configs/sherlock.txt
python train_CRF.py -c $BASEPATH/configs/CRF.txt

#for cross_validation
#python sherlock_exp.py -c $BASEPATH/configs/sherlock_exp.txt
#python CRF_exp.py -c $BASEPATH/configs/CRF_exp.txt
