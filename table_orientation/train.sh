export BASEPATH=path_to/table_orientation
export EMBEDDING=path_to/embedding_file
export MODEL_DIR=$BASEPATH/model
export TRAIN_TABLES=$BASEPATH/tables.pickle

python DeepTableTrain.py -e 5 -l 0.01 -v $EMBEDDING -i $TRAIN_TABLES -o $MODEL_DIR
#python DeepTableEval.py -m $MODEL_DIR/model_name -ip $INPUTPATH -o evaluation
