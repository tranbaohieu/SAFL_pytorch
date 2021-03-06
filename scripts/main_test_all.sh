array=("CUTE80"
    "IC03_860"
    "IC13_1015"
    "IC15_1811"
    "SVTP"
    "SVT")



DLS_DATA_URL="./data/"
DLS_TRAIN_URL=""
for i in "${array[@]}"
do
  echo $i
  CUDA_VISIBLE_DEVICES=0,1 python main.py \
    --synthetic_train_data_dir xxx \
    --test_data_dir ${DLS_DATA_URL}$i \
    --batch_size 128 \
    --workers 8 \
    --height 32 \
    --width 100 \
    --voc_type ALLCASES_SYMBOLS \
    --arch ResNet_ASTER \
    --with_lstm \
    --logs_dir logs_test/baseline \
    --real_logs_dir xxx \
    --max_len 100 \
    --evaluate \
    --STN_ON \
    --beam_width 5 \
    --tps_inputsize 32 64 \
    --tps_outputsize 32 100 \
    --tps_margins 0.05 0.05 \
    --stn_activation none \
    --num_control_points 20 \
    --resume ./logs_wo_rec/baseline/model_best.pth.tar
done
