#!/usr/bin/env bash
#
# Based mostly on the Switchboard recipe. The training database is TED-LIUM,
# it consists of TED talks with cleaned automatic transcripts:
#
# https://lium.univ-lemans.fr/ted-lium3/
# http://www.openslr.org/resources (Mirror).
#
# The data is distributed under 'Creative Commons BY-NC-ND 3.0' license,
# which allow free non-commercial use, while only a citation is required.
#
# Copyright  2014  Nickolay V. Shmyrev
#            2014  Brno University of Technology (Author: Karel Vesely)
#            2016  Vincent Nguyen
#            2016  Johns Hopkins University (Author: Daniel Povey)
#            2018  François Hernandez
#
# Apache 2.0
#
LANG=C
LANGUAGE=en_IN.utf8
LANG=en_IN.utf8

#https://stackoverflow.com/a/67333425/3465519
#https://stackoverflow.com/a/60268632/3465519
#https://stackoverflow.com/a/58523012/3465519


. ./cmd.sh
. ./path.sh


set -e -o pipefail -u

#nj=35
nj=8
#decode_nj=38   # note: should not be >38 which is the number of speakers in the dev set
decode_nj=8   # note: should not be >38 which is the number of speakers in the dev set
               # after applying --seconds-per-spk-max 180.  We decode with 4 threads, so
               # this will be too many jobs if you're using run.pl.
train_rnnlm=true
train_lm=true

. utils/parse_options.sh # accept options

# stage=1
# Data preparation
# if [ $stage -le 0 ]; then
#   echo "Stage $stage begin: downloading data";
#   local/download_data.sh
#   echo "Stage $stage end: downloading data";
# fi

home_folder=$HOME

stage=12
if [ $stage -le 0 ]; then
  input_dataset=telugu_combined_transcription
  #input_dataset=mozillacv_tamil/transcription
  #input_dataset=microsoft_tamil/transcription
  #input_dataset=openslr_tamil/transcription
  #input_dataset=asriitm_tamil/transcription
  echo "----------------------- Stage $stage Load data from $input_dataset begin---------------------------";
  date
  rm -rf db/telugu_data telugu_data
  mkdir -p db/telugu_data
  ln -s $(pwd)/db/telugu_data telugu_data
  for set in test dev train; do
    rm -rf telugu_data/$set.orig
    cp -r db/$input_dataset/$set telugu_data/$set.orig
    sed -i "s/~/${home_folder//\//\\/}/g" telugu_data/$set.orig/wav.scp
    utils/fix_data_dir.sh telugu_data/$set.orig
  done
  date
  echo "----------------------- Stage $stage end---------------------------";
  stage=1
fi

#stage=1
if [ $stage -le 1 ]; then
  echo "----------------------- Stage $stage begin: prepare data ---------------------------";
  date
  local/prepare_data_telugu.sh
  # Split speakers up into 3-minute chunks.  This doesn't hurt adaptation, and
  # lets us use more jobs for decoding etc.
  # [we chose 3 minutes because that gives us 38 speakers for the dev data, which is
  #  more than our normal 30 jobs.]
  # for dset in dev test train; do
  #   utils/data/modify_speaker_info.sh --seconds-per-spk-max 180 data/${dset}.orig data/${dset}
  # done
  date
  echo "----------------------- Stage $stage end: prepare data ---------------------------";
  stage=2
fi


#stage=2
if [ $stage -le 2 ]; then
  echo "----------------------- Stage $stage begin: prepare dict ---------------------------";
  date
  local/prepare_dict_telugu.sh
  date
  echo "----------------------- Stage $stage end: prepare dict ---------------------------";
fi
#stage=3

if [ $stage -le 3 ]; then
  echo "----------------------- Stage $stage begin: prepare lang ---------------------------";
  date
  utils/prepare_lang.sh telugu_data/local/dict_nosp \
    "<unk>" telugu_data/local/lang_nosp telugu_data/lang_nosp
  date
  echo "----------------------- Stage $stage end: prepare lang ---------------------------";
fi


if [ $stage -le 4 ]; then
  echo "----------------------- Stage $stage begin: lang model ---------------------------";
  date
  # later on we'll change this script so you have the option to
  # download the pre-built LMs from openslr.org instead of building them
  # locally.
  if $train_lm; then
    local/telugu_train_lm.sh
  else
    echo "train_lm is false. not training LM."
  fi
  date
  echo "----------------------- Stage $stage end: lang model ---------------------------";
  # later on we'll change this script so you have the option to
fi

if [ $stage -le 5 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  local/format_lms_telugu.sh
  date
  echo "------- first format complete, second starting"
  date
  local/format_lms_telugu.sh
  date
  echo "----------------------- Stage $stage end---------------------------";
fi

# Feature extraction
if [ $stage -le 6 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  for set in test dev train; do
    date
    [[ ! -d telugu_data/$set ]] && cp -r telugu_data/$set.orig/ telugu_data/$set
    sed -i "s/~/${home_folder//\//\\/}/g" telugu_data/$set/wav.scp
    dir=telugu_data/$set
    steps/make_mfcc.sh --nj 30 --cmd "$train_cmd" $dir
    steps/compute_cmvn_stats.sh $dir
    date
  done
  date
  echo "----------------------- Stage $stage end---------------------------";
fi

# Now we have 452 hours of training data.
# Well create a subset with 10k short segments to make flat-start training easier:
if [ $stage -le 7 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  utils/subset_data_dir.sh --shortest telugu_data/train 10000 telugu_data/train_10kshort
  date
  utils/data/remove_dup_utts.sh 10 telugu_data/train_10kshort telugu_data/train_10kshort_nodup
  date
  echo "----------------------- Stage $stage end---------------------------";
fi

# Train
if [ $stage -le 8 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  steps/train_mono.sh --nj 20 --cmd "$train_cmd" \
    telugu_data/train_10kshort_nodup telugu_data/lang_nosp telugu_exp/mono
  date
  echo "----------------------- Stage $stage end---------------------------";
fi

if [ $stage -le 9 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  steps/align_si.sh --nj $nj --cmd "$train_cmd" \
    telugu_data/train telugu_data/lang_nosp telugu_exp/mono telugu_exp/mono_ali
  date
  echo "------------ steps/align_si.sh finished------------"
  date
  steps/train_deltas.sh --cmd "$train_cmd" \
    2500 30000 telugu_data/train telugu_data/lang_nosp telugu_exp/mono_ali telugu_exp/tri1
  date
  echo "----------------------- Stage $stage end---------------------------";
fi

if [ $stage -le 10 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  utils/mkgraph.sh telugu_data/lang_nosp telugu_exp/tri1 telugu_exp/tri1/graph_nosp

  # The slowest part about this decoding is the scoring, which we can't really
  # control as the bottleneck is the NIST tools.
  # for dset in dev test; do
  #   steps/decode.sh --nj $decode_nj --cmd "$decode_cmd"  --num-threads 4 \
  #     exp/tri1/graph_nosp data/${dset} exp/tri1/decode_nosp_${dset}
  #   steps/lmrescore_const_arpa.sh  --cmd "$decode_cmd" data/lang_nosp data/lang_nosp_rescore \
  #      data/${dset} exp/tri1/decode_nosp_${dset} exp/tri1/decode_nosp_${dset}_rescore
  # done
  date
  echo "----------------------- Stage $stage end---------------------------";
fi

if [ $stage -le 11 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  steps/align_si.sh --nj $nj --cmd "$train_cmd" \
    telugu_data/train telugu_data/lang_nosp telugu_exp/tri1 telugu_exp/tri1_ali

  date
  echo "----------------------- Stage $stage mid align_si complete, train_lda starting---------------------------";
  date
  steps/train_lda_mllt.sh --cmd "$train_cmd" \
    4000 50000 telugu_data/train telugu_data/lang_nosp telugu_exp/tri1_ali telugu_exp/tri2
  date
  echo "----------------------- Stage $stage end---------------------------";
fi

if [ $stage -le 12 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  utils/mkgraph.sh telugu_data/lang_nosp telugu_exp/tri2 telugu_exp/tri2/graph_nosp
  # for dset in dev test; do
  #   steps/decode.sh --nj $decode_nj --cmd "$decode_cmd"  --num-threads 4 \
  #     exp/tri2/graph_nosp data/${dset} exp/tri2/decode_nosp_${dset}
  #   steps/lmrescore_const_arpa.sh  --cmd "$decode_cmd" data/lang_nosp data/lang_nosp_rescore \
  #      data/${dset} exp/tri2/decode_nosp_${dset} exp/tri2/decode_nosp_${dset}_rescore
  # done
  date
  echo "----------------------- Stage $stage end---------------------------";
fi
exit 1

if [ $stage -le 13 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  steps/get_prons.sh --cmd "$train_cmd" telugu_data/train telugu_data/lang_nosp telugu_exp/tri2
  date
  utils/dict_dir_add_pronprobs.sh --max-normalize true \
    telugu_data/local/dict_nosp telugu_exp/tri2/pron_counts_nowb.txt \
    telugu_exp/tri2/sil_counts_nowb.txt \
    telugu_exp/tri2/pron_bigram_counts_nowb.txt telugu_data/local/dict
  date
  echo "----------------------- Stage $stage end---------------------------";
fi

if [ $stage -le 14 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  utils/prepare_lang.sh telugu_data/local/dict "<unk>" telugu_data/local/lang telugu_data/lang
  date
  cp -rT telugu_data/lang telugu_data/lang_rescore
  cp telugu_data/lang_nosp/G.fst telugu_data/lang/
  cp telugu_data/lang_nosp_rescore/G.carpa telugu_data/lang_rescore/

  date
  utils/mkgraph.sh telugu_data/lang telugu_exp/tri2 telugu_exp/tri2/graph

  # for dset in dev test; do
  #   steps/decode.sh --nj $decode_nj --cmd "$decode_cmd"  --num-threads 4 \
  #     exp/tri2/graph data/${dset} exp/tri2/decode_${dset}
  #   steps/lmrescore_const_arpa.sh --cmd "$decode_cmd" data/lang data/lang_rescore \
  #      data/${dset} exp/tri2/decode_${dset} exp/tri2/decode_${dset}_rescore
  # done
  date
  echo "----------------------- Stage $stage end---------------------------";
fi

if [ $stage -le 15 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  steps/align_si.sh --nj $nj --cmd "$train_cmd" \
    telugu_data/train telugu_data/lang telugu_exp/tri2 telugu_exp/tri2_ali

  date
  steps/train_sat.sh --cmd "$train_cmd" \
    5000 100000 telugu_data/train telugu_data/lang telugu_exp/tri2_ali telugu_exp/tri3

  date
  utils/mkgraph.sh telugu_data/lang telugu_exp/tri3 telugu_exp/tri3/graph

  # for dset in dev test; do
  #   steps/decode_fmllr.sh --nj $decode_nj --cmd "$decode_cmd"  --num-threads 4 \
  #     exp/tri3/graph data/${dset} exp/tri3/decode_${dset}
  #   steps/lmrescore_const_arpa.sh --cmd "$decode_cmd" data/lang data/lang_rescore \
  #      data/${dset} exp/tri3/decode_${dset} exp/tri3/decode_${dset}_rescore
  # done
  date
  echo "----------------------- Stage $stage end---------------------------";
fi

if [ $stage -le 16 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  # this does some data-cleaning.  It actually degrades the GMM-level results
  # slightly, but the cleaned data should be useful when we add the neural net and chain
  # systems.  If not we'll remove this stage.
  local/run_cleanup_segmentation.sh
  date
  echo "----------------------- Stage $stage end---------------------------";
fi

if [ $stage -le 17 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  # This will only work if you have GPUs on your system (and note that it requires
  # you to have the queue set up the right way... see kaldi-asr.org/doc/queue.html)
  local/chain/run_tdnn.sh
  date
  echo "----------------------- Stage $stage end---------------------------";
fi

if [ $stage -le 18 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  # You can either train your own rnnlm or download a pre-trained one
  if $train_rnnlm; then
    # local/rnnlm/tuning/run_lstm_tdnn_a.sh
    local/rnnlm/tuning/tamil_run_lstm_tdnn_a.sh
    local/rnnlm/average_rnnlm.sh
  else
    local/ted_download_rnnlm.sh
  fi
  date
  echo "----------------------- Stage $stage end---------------------------";
fi

if [ $stage -le 19 ]; then
  echo "----------------------- Stage $stage begin---------------------------";
  date
  # Here we rescore the lattices generated at stage 17
  rnnlm_dir=telugu_exp/rnnlm_lstm_tdnn_a_averaged
  lang_dir=telugu_data/lang_chain
  ngram_order=4

  for dset in dev test; do
    data_dir=telugu_data/${dset}_hires
    decoding_dir=telugu_exp/chain_cleaned/tdnnf_1a/decode_${dset}
    suffix=$(basename $rnnlm_dir)
    output_dir=${decoding_dir}_$suffix

    rnnlm/lmrescore_pruned.sh \
      --cmd "$decode_cmd --mem 4G" \
      --weight 0.5 --max-ngram-order $ngram_order \
      $lang_dir $rnnlm_dir \
      $data_dir $decoding_dir \
      $output_dir
  done
  date
  echo "----------------------- Stage $stage end---------------------------";
fi


echo "$0: success."
exit 0
