export ORIGIN=path_to_models
export BASEPATH=$ORIGIN/semantic_type_detection

export DT_MODEL_DIR=$ORIGIN/table_orientation/model
export INPUT_DIR=path_to_input_tables

export SHERLOCKPATH=$BASEPATH/sherlock
export EXTRACTPATH=$BASEPATH/extract

export TYPENAME='syntheaB'
export LDANAME='t18'
export DTOUTPUT='deeptable_output'

while true
do
  echo "Run table orientation classification YES[y] NO[n]"
  read ans
  
  if [[ "$ans" == "y" ]] || [[ "$ans" == "yes" ]]; then
    cd $ORIGIN/table_orientation
    python DeepTablePred.py -m $DT_MODEL_DIR/pretrained_DeepTableModel_name -i $INPUT_DIR -o $DTOUTPUT
    break
  elif [[ "$ans" == "n" ]] || [[ "$ans" == "no" ]]; then
    echo "quit"
    break
  else
    echo "please enter yes/y or no/n"
  fi
done

while true
do
  echo "Continue to semantic type detection YES[y] NO[n]"
  read ans

  if [[ "$ans" == "y" ]] || [[ "$ans" == "yes" ]]; then
    cd $BASEPATH/model
    python pred_CRF.py -dt $DTOUTPUT -n 50 -m pretrained_CRFmodel_name -o name_of_output -t $LDANAME
    break
  elif [[ "$ans" == "n" ]] || [[ "$ans" == "no" ]]; then
    echo "quit"
    break
  else
    echo "please enter yes/y or no/n"
  fi
done


