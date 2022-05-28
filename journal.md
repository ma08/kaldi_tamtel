### stage 2
```
sk5057@speech-rec-vm:~/kaldi/egs/tamil_telugu_proj/s5_r3$ ./run.sh 
/home/sk5057/kaldi/egs/tamil_telugu_proj/s5_r3/../../..
----------------------- Stage 1 begin: prepare data ---------------------------
/home/sk5057/kaldi/egs/tamil_telugu_proj/s5_r3/../../..
utils/validate_data_dir.sh: data/dev.orig/utt2spk has wrong format.
utils/validate_data_dir.sh: data/test.orig/utt2spk has wrong format.
cat: write error: Broken pipe
utils/validate_data_dir.sh: data/train.orig/utt2spk has wrong format.
----------------------- Stage 1 end: prepare data ---------------------------
----------------------- Stage 2 begin: prepare dict ---------------------------
Checking data/local/dict_nosp/silence_phones.txt ...
--> reading data/local/dict_nosp/silence_phones.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict_nosp/silence_phones.txt is OK

Checking data/local/dict_nosp/optional_silence.txt ...
--> reading data/local/dict_nosp/optional_silence.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict_nosp/optional_silence.txt is OK

Checking data/local/dict_nosp/nonsilence_phones.txt ...
--> reading data/local/dict_nosp/nonsilence_phones.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict_nosp/nonsilence_phones.txt is OK

Checking disjoint: silence_phones.txt, nonsilence_phones.txt
--> disjoint property is OK.

Checking data/local/dict_nosp/lexicon.txt
--> reading data/local/dict_nosp/lexicon.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict_nosp/lexicon.txt is OK

Checking data/local/dict_nosp/extra_questions.txt ...
--> data/local/dict_nosp/extra_questions.txt is empty (this is OK)
--> SUCCESS [validating dictionary directory data/local/dict_nosp]

----------------------- Stage 2 end: prepare dict ---------------------------

```
### stage 3 failure
sk5057@speech-rec-vm:~/kaldi/egs/tamil_telugu_proj/s5_r3$ ./run.sh 
/home/sk5057/kaldi/egs/tamil_telugu_proj/s5_r3/../../..
----------------------- Stage 3 begin: prepare lang ---------------------------
utils/prepare_lang.sh data/local/dict_nosp <unk> data/local/lang_nosp data/lang_nosp
/home/sk5057/kaldi/egs/tamil_telugu_proj/s5_r3/../../..
Checking data/local/dict_nosp/silence_phones.txt ...
--> reading data/local/dict_nosp/silence_phones.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict_nosp/silence_phones.txt is OK

Checking data/local/dict_nosp/optional_silence.txt ...
--> reading data/local/dict_nosp/optional_silence.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict_nosp/optional_silence.txt is OK

Checking data/local/dict_nosp/nonsilence_phones.txt ...
--> reading data/local/dict_nosp/nonsilence_phones.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict_nosp/nonsilence_phones.txt is OK

Checking disjoint: silence_phones.txt, nonsilence_phones.txt
--> disjoint property is OK.

Checking data/local/dict_nosp/lexicon.txt
--> reading data/local/dict_nosp/lexicon.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict_nosp/lexicon.txt is OK

Checking data/local/dict_nosp/extra_questions.txt ...
--> data/local/dict_nosp/extra_questions.txt is empty (this is OK)
--> SUCCESS [validating dictionary directory data/local/dict_nosp]

**Creating data/local/dict_nosp/lexiconp.txt from data/local/dict_nosp/lexicon.txt
fstaddselfloops data/lang_nosp/phones/wdisambig_phones.int data/lang_nosp/phones/wdisambig_words.int 
prepare_lang.sh: validating output directory
utils/validate_lang.pl data/lang_nosp
Checking existence of separator file
separator file data/lang_nosp/subword_separator.txt is empty or does not exist, deal in word case.
Checking data/lang_nosp/phones.txt ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/lang_nosp/phones.txt is OK

Checking words.txt: #0 ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/lang_nosp/words.txt is OK

Checking disjoint: silence.txt, nonsilence.txt, disambig.txt ...
--> silence.txt and nonsilence.txt are disjoint
--> silence.txt and disambig.txt are disjoint
--> disambig.txt and nonsilence.txt are disjoint
--> disjoint property is OK

Checking sumation: silence.txt, nonsilence.txt, disambig.txt ...
--> found no unexplainable phones in phones.txt

Checking data/lang_nosp/phones/context_indep.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 10 entry/entries in data/lang_nosp/phones/context_indep.txt
--> data/lang_nosp/phones/context_indep.int corresponds to data/lang_nosp/phones/context_indep.txt
export KALDI_ROOT=`pwd`/../../..
--> data/lang_nosp/phones/context_indep.csl corresponds to data/lang_nosp/phones/context_indep.txt
--> data/lang_nosp/phones/context_indep.{txt, int, csl} are OK

Checking data/lang_nosp/phones/nonsilence.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 1848 entry/entries in data/lang_nosp/phones/nonsilence.txt
--> data/lang_nosp/phones/nonsilence.int corresponds to data/lang_nosp/phones/nonsilence.txt
--> data/lang_nosp/phones/nonsilence.csl corresponds to data/lang_nosp/phones/nonsilence.txt
--> data/lang_nosp/phones/nonsilence.{txt, int, csl} are OK

Checking data/lang_nosp/phones/silence.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 10 entry/entries in data/lang_nosp/phones/silence.txt
--> data/lang_nosp/phones/silence.int corresponds to data/lang_nosp/phones/silence.txt
--> data/lang_nosp/phones/silence.csl corresponds to data/lang_nosp/phones/silence.txt
--> data/lang_nosp/phones/silence.{txt, int, csl} are OK

Checking data/lang_nosp/phones/optional_silence.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 1 entry/entries in data/lang_nosp/phones/optional_silence.txt
--> data/lang_nosp/phones/optional_silence.int corresponds to data/lang_nosp/phones/optional_silence.txt
--> data/lang_nosp/phones/optional_silence.csl corresponds to data/lang_nosp/phones/optional_silence.txt
--> data/lang_nosp/phones/optional_silence.{txt, int, csl} are OK

Checking data/lang_nosp/phones/disambig.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 2 entry/entries in data/lang_nosp/phones/disambig.txt
--> data/lang_nosp/phones/disambig.int corresponds to data/lang_nosp/phones/disambig.txt
--> data/lang_nosp/phones/disambig.csl corresponds to data/lang_nosp/phones/disambig.txt
--> data/lang_nosp/phones/disambig.{txt, int, csl} are OK

Checking data/lang_nosp/phones/roots.{txt, int} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 464 entry/entries in data/lang_nosp/phones/roots.txt
--> data/lang_nosp/phones/roots.int corresponds to data/lang_nosp/phones/roots.txt
--> data/lang_nosp/phones/roots.{txt, int} are OK

Checking data/lang_nosp/phones/sets.{txt, int} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 464 entry/entries in data/lang_nosp/phones/sets.txt
--> data/lang_nosp/phones/sets.int corresponds to data/lang_nosp/phones/sets.txt
--> data/lang_nosp/phones/sets.{txt, int} are OK

Checking data/lang_nosp/phones/extra_questions.{txt, int} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 9 entry/entries in data/lang_nosp/phones/extra_questions.txt
--> data/lang_nosp/phones/extra_questions.int corresponds to data/lang_nosp/phones/extra_questions.txt
--> data/lang_nosp/phones/extra_questions.{txt, int} are OK

Checking data/lang_nosp/phones/word_boundary.{txt, int} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 1858 entry/entries in data/lang_nosp/phones/word_boundary.txt
--> data/lang_nosp/phones/word_boundary.int corresponds to data/lang_nosp/phones/word_boundary.txt
--> data/lang_nosp/phones/word_boundary.{txt, int} are OK

Checking optional_silence.txt ...
--> reading data/lang_nosp/phones/optional_silence.txt
--> data/lang_nosp/phones/optional_silence.txt is OK

Checking disambiguation symbols: #0 and #1
--> data/lang_nosp/phones/disambig.txt has "#0" and "#1"
--> data/lang_nosp/phones/disambig.txt is OK

Checking topo ...

Checking word_boundary.txt: silence.txt, nonsilence.txt, disambig.txt ...
--> data/lang_nosp/phones/word_boundary.txt doesn't include disambiguation symbols
--> data/lang_nosp/phones/word_boundary.txt is the union of nonsilence.txt and silence.txt
--> data/lang_nosp/phones/word_boundary.txt is OK

Checking word-level disambiguation symbols...
--> data/lang_nosp/phones/wdisambig.txt exists (newer prepare_lang.sh)
Checking word_boundary.int and disambig.int
*** This script cannot continue because your path.sh or bash profile prints something: /home/sk5057/kaldi/egs/tamil_telugu_proj/s5_r3/../../..
*** Please fix that and try again.
prepare_lang.sh: error validating output

### Stage 3 success
```
sk5057@speech-rec-vm:~/kaldi/egs/tamil_telugu_proj/s5_r3$ ./run.sh 
----------------------- Stage 3 begin: prepare lang ---------------------------
utils/prepare_lang.sh data/local/dict_nosp <unk> data/local/lang_nosp data/lang_nosp
Checking data/local/dict_nosp/silence_phones.txt ...
--> reading data/local/dict_nosp/silence_phones.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict_nosp/silence_phones.txt is OK

Checking data/local/dict_nosp/optional_silence.txt ...
--> reading data/local/dict_nosp/optional_silence.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict_nosp/optional_silence.txt is OK

Checking data/local/dict_nosp/nonsilence_phones.txt ...
--> reading data/local/dict_nosp/nonsilence_phones.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict_nosp/nonsilence_phones.txt is OK

Checking disjoint: silence_phones.txt, nonsilence_phones.txt
--> disjoint property is OK.

Checking data/local/dict_nosp/lexicon.txt
--> reading data/local/dict_nosp/lexicon.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict_nosp/lexicon.txt is OK

Checking data/local/dict_nosp/lexiconp.txt
--> reading data/local/dict_nosp/lexiconp.txt
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/local/dict_nosp/lexiconp.txt is OK

Checking lexicon pair data/local/dict_nosp/lexicon.txt and data/local/dict_nosp/lexiconp.txt
--> lexicon pair data/local/dict_nosp/lexicon.txt and data/local/dict_nosp/lexiconp.txt match

Checking data/local/dict_nosp/extra_questions.txt ...
--> data/local/dict_nosp/extra_questions.txt is empty (this is OK)
--> SUCCESS [validating dictionary directory data/local/dict_nosp]

fstaddselfloops data/lang_nosp/phones/wdisambig_phones.int data/lang_nosp/phones/wdisambig_words.int 
prepare_lang.sh: validating output directory
utils/validate_lang.pl data/lang_nosp
Checking existence of separator file
separator file data/lang_nosp/subword_separator.txt is empty or does not exist, deal in word case.
Checking data/lang_nosp/phones.txt ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/lang_nosp/phones.txt is OK

Checking words.txt: #0 ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> data/lang_nosp/words.txt is OK

Checking disjoint: silence.txt, nonsilence.txt, disambig.txt ...
--> silence.txt and nonsilence.txt are disjoint
--> silence.txt and disambig.txt are disjoint
--> disambig.txt and nonsilence.txt are disjoint
--> disjoint property is OK

Checking sumation: silence.txt, nonsilence.txt, disambig.txt ...
--> found no unexplainable phones in phones.txt

Checking data/lang_nosp/phones/context_indep.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 10 entry/entries in data/lang_nosp/phones/context_indep.txt
--> data/lang_nosp/phones/context_indep.int corresponds to data/lang_nosp/phones/context_indep.txt
--> data/lang_nosp/phones/context_indep.csl corresponds to data/lang_nosp/phones/context_indep.txt
--> data/lang_nosp/phones/context_indep.{txt, int, csl} are OK

Checking data/lang_nosp/phones/nonsilence.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 1848 entry/entries in data/lang_nosp/phones/nonsilence.txt
--> data/lang_nosp/phones/nonsilence.int corresponds to data/lang_nosp/phones/nonsilence.txt
--> data/lang_nosp/phones/nonsilence.csl corresponds to data/lang_nosp/phones/nonsilence.txt
--> data/lang_nosp/phones/nonsilence.{txt, int, csl} are OK

Checking data/lang_nosp/phones/silence.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 10 entry/entries in data/lang_nosp/phones/silence.txt
--> data/lang_nosp/phones/silence.int corresponds to data/lang_nosp/phones/silence.txt
--> data/lang_nosp/phones/silence.csl corresponds to data/lang_nosp/phones/silence.txt
--> data/lang_nosp/phones/silence.{txt, int, csl} are OK

Checking data/lang_nosp/phones/optional_silence.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 1 entry/entries in data/lang_nosp/phones/optional_silence.txt
--> data/lang_nosp/phones/optional_silence.int corresponds to data/lang_nosp/phones/optional_silence.txt
--> data/lang_nosp/phones/optional_silence.csl corresponds to data/lang_nosp/phones/optional_silence.txt
--> data/lang_nosp/phones/optional_silence.{txt, int, csl} are OK

Checking data/lang_nosp/phones/disambig.{txt, int, csl} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 2 entry/entries in data/lang_nosp/phones/disambig.txt
--> data/lang_nosp/phones/disambig.int corresponds to data/lang_nosp/phones/disambig.txt
--> data/lang_nosp/phones/disambig.csl corresponds to data/lang_nosp/phones/disambig.txt
--> data/lang_nosp/phones/disambig.{txt, int, csl} are OK

Checking data/lang_nosp/phones/roots.{txt, int} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 464 entry/entries in data/lang_nosp/phones/roots.txt
--> data/lang_nosp/phones/roots.int corresponds to data/lang_nosp/phones/roots.txt
--> data/lang_nosp/phones/roots.{txt, int} are OK

Checking data/lang_nosp/phones/sets.{txt, int} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 464 entry/entries in data/lang_nosp/phones/sets.txt
--> data/lang_nosp/phones/sets.int corresponds to data/lang_nosp/phones/sets.txt
--> data/lang_nosp/phones/sets.{txt, int} are OK

Checking data/lang_nosp/phones/extra_questions.{txt, int} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 9 entry/entries in data/lang_nosp/phones/extra_questions.txt
--> data/lang_nosp/phones/extra_questions.int corresponds to data/lang_nosp/phones/extra_questions.txt
--> data/lang_nosp/phones/extra_questions.{txt, int} are OK

Checking data/lang_nosp/phones/word_boundary.{txt, int} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 1858 entry/entries in data/lang_nosp/phones/word_boundary.txt
--> data/lang_nosp/phones/word_boundary.int corresponds to data/lang_nosp/phones/word_boundary.txt
--> data/lang_nosp/phones/word_boundary.{txt, int} are OK

Checking optional_silence.txt ...
--> reading data/lang_nosp/phones/optional_silence.txt
--> data/lang_nosp/phones/optional_silence.txt is OK

Checking disambiguation symbols: #0 and #1
--> data/lang_nosp/phones/disambig.txt has "#0" and "#1"
--> data/lang_nosp/phones/disambig.txt is OK

Checking topo ...

Checking word_boundary.txt: silence.txt, nonsilence.txt, disambig.txt ...
--> data/lang_nosp/phones/word_boundary.txt doesn't include disambiguation symbols
--> data/lang_nosp/phones/word_boundary.txt is the union of nonsilence.txt and silence.txt
--> data/lang_nosp/phones/word_boundary.txt is OK

Checking word-level disambiguation symbols...
--> data/lang_nosp/phones/wdisambig.txt exists (newer prepare_lang.sh)
Checking word_boundary.int and disambig.int
--> generating a 95 word/subword sequence
--> resulting phone sequence from L.fst corresponds to the word sequence
--> L.fst is OK
--> generating a 45 word/subword sequence
--> resulting phone sequence from L_disambig.fst corresponds to the word sequence
--> L_disambig.fst is OK

Checking data/lang_nosp/oov.{txt, int} ...
--> text seems to be UTF-8 or ASCII, checking whitespaces
--> text contains only allowed whitespaces
--> 1 entry/entries in data/lang_nosp/oov.txt
--> data/lang_nosp/oov.int corresponds to data/lang_nosp/oov.txt
--> data/lang_nosp/oov.{txt, int} are OK

--> data/lang_nosp/L.fst is olabel sorted
--> data/lang_nosp/L_disambig.fst is olabel sorted
--> SUCCESS [validating lang directory data/lang_nosp]
----------------------- Stage 3 end: prepare lang ---------------------------
```


### stage 6 failure
```
sk5057@speech-rec-vm:~/kaldi/egs/tamil_telugu_proj/s5_r3$ ./run.sh 
----------------------- Stage 6 begin---------------------------
steps/make_mfcc.sh --nj 30 --cmd run.pl data/test
steps/make_mfcc.sh: no such file data/test/wav.scp

```

```
sk5057@speech-rec-vm:~/kaldi/egs/tamil_telugu_proj/s5_r3$ ./run.sh
----------------------- Stage 6 begin---------------------------
steps/make_mfcc.sh --nj 30 --cmd run.pl data/test
utils/validate_data_dir.sh: data/test/utt2spk has wrong format.
steps/make_mfcc.sh [info]: segments file exists: using that.
run.pl: 30 / 30 failed, log is in data/test/log/make_mfcc_test.*.log

```

removed ! in validate_data_dir

sk5057@speech-rec-vm:~/kaldi/egs/tamil_telugu_proj/s5_r3$ ./run.sh 
----------------------- Stage 6 begin---------------------------
steps/make_mfcc.sh --nj 30 --cmd run.pl data/test
file data/test/utt2spk has invalid newline at -e line 1, <> line 17570.

removed ! in validate_data_dir

removed a bunch of ! ????


```
sk5057@speech-rec-vm:~/kaldi/egs/tamil_telugu_proj/s5_r3$ ./run.sh
----------------------- Stage 6 begin---------------------------
steps/make_mfcc.sh --nj 30 --cmd run.pl data/test
utils/validate_data_dir.sh: Please do not use tilde (~) in your wav.scp.
```

Replace tilde in plae

sk5057@speech-rec-vm:~/kaldi/egs/tamil_telugu_proj/s5_r3$ ./run.sh 
----------------------- Stage 6 begin---------------------------
steps/make_mfcc.sh --nj 30 --cmd run.pl data/test
Bad line in segments file mcvspeaker132-common_voice_ta_27638650 mcvspeaker132-common_voice_ta_27638650 0.0 6.624000440203 000440203 0.0 6.77
utils/validate_data_dir.sh: badly formatted segments file


sk5057@speech-rec-vm:~/asr_project/git_repo/dataset_related$ python3 merge_datasets.py 
2022-05-09 02:38:21.143499 Running on asriitm_tamil train spk2utt
2022-05-09 02:38:21.146445 Running on mozillacv_tamil train spk2utt
2022-05-09 02:38:21.157720 Running on microsoft_tamil train spk2utt
2022-05-09 02:38:21.166662 Running on openslr_tamil train spk2utt
2022-05-09 02:38:21.215551 Running on asriitm_tamil train segments
2022-05-09 02:38:21.234123 Running on mozillacv_tamil train segments
2022-05-09 02:38:21.248347 Running on microsoft_tamil train segments
2022-05-09 02:38:21.256414 Running on openslr_tamil train segments
2022-05-09 02:38:21.277598 Running on asriitm_tamil train utt2dur
2022-05-09 02:38:21.287890 Running on mozillacv_tamil train utt2dur
2022-05-09 02:38:21.295441 Running on microsoft_tamil train utt2dur
2022-05-09 02:38:21.300106 Running on openslr_tamil train utt2dur
2022-05-09 02:38:21.318911 Running on asriitm_tamil train text
2022-05-09 02:38:21.405552 Running on mozillacv_tamil train text
2022-05-09 02:38:21.445981 Running on microsoft_tamil train text
2022-05-09 02:38:21.476110 Running on openslr_tamil train text
2022-05-09 02:38:21.553225 Running on asriitm_tamil train utt2spk
2022-05-09 02:38:21.566481 Running on mozillacv_tamil train utt2spk
2022-05-09 02:38:21.576333 Running on microsoft_tamil train utt2spk
2022-05-09 02:38:21.582578 Running on openslr_tamil train utt2spk
2022-05-09 02:38:21.587728 Running on asriitm_tamil train wav.scp
2022-05-09 02:38:21.609448 Running on mozillacv_tamil train wav.scp
2022-05-09 02:38:21.629602 Running on microsoft_tamil train wav.scp
2022-05-09 02:38:21.646120 Running on openslr_tamil train wav.scp
2022-05-09 02:38:21.650491 Running on asriitm_tamil dev spk2utt
2022-05-09 02:38:21.651223 Running on mozillacv_tamil dev spk2utt
2022-05-09 02:38:21.655126 Running on microsoft_tamil dev spk2utt
2022-05-09 02:38:21.655482 Running on openslr_tamil dev spk2utt
2022-05-09 02:38:21.656283 Running on asriitm_tamil dev segments
2022-05-09 02:38:21.658029 Running on mozillacv_tamil dev segments
2022-05-09 02:38:21.665773 Running on microsoft_tamil dev segments
2022-05-09 02:38:21.666154 Running on openslr_tamil dev segments
2022-05-09 02:38:21.666757 Running on asriitm_tamil dev utt2dur
2022-05-09 02:38:21.667508 Running on mozillacv_tamil dev utt2dur
2022-05-09 02:38:21.670811 Running on microsoft_tamil dev utt2dur
2022-05-09 02:38:21.670994 Running on openslr_tamil dev utt2dur
2022-05-09 02:38:21.672282 Running on asriitm_tamil dev text
2022-05-09 02:38:21.676620 Running on mozillacv_tamil dev text
2022-05-09 02:38:21.688586 Running on microsoft_tamil dev text
2022-05-09 02:38:21.689199 Running on openslr_tamil dev text
2022-05-09 02:38:21.690145 Running on asriitm_tamil dev utt2spk
2022-05-09 02:38:21.691020 Running on mozillacv_tamil dev utt2spk
2022-05-09 02:38:21.694232 Running on microsoft_tamil dev utt2spk
2022-05-09 02:38:21.694447 Running on openslr_tamil dev utt2spk
2022-05-09 02:38:21.695164 Running on asriitm_tamil dev wav.scp
2022-05-09 02:38:21.695407 Running on mozillacv_tamil dev wav.scp
2022-05-09 02:38:21.703402 Running on microsoft_tamil dev wav.scp
2022-05-09 02:38:21.703828 Running on openslr_tamil dev wav.scp
2022-05-09 02:38:21.704613 Running on asriitm_tamil test spk2utt
2022-05-09 02:38:21.705299 Running on mozillacv_tamil test spk2utt
2022-05-09 02:38:21.708491 Running on microsoft_tamil test spk2utt
2022-05-09 02:38:21.709172 Running on openslr_tamil test spk2utt
2022-05-09 02:38:21.709915 Running on asriitm_tamil test segments
2022-05-09 02:38:21.711078 Running on mozillacv_tamil test segments
2022-05-09 02:38:21.717203 Running on microsoft_tamil test segments
2022-05-09 02:38:21.717925 Running on openslr_tamil test segments
2022-05-09 02:38:21.718542 Running on asriitm_tamil test utt2dur
2022-05-09 02:38:21.719307 Running on mozillacv_tamil test utt2dur
2022-05-09 02:38:21.722477 Running on microsoft_tamil test utt2dur
2022-05-09 02:38:21.722952 Running on openslr_tamil test utt2dur
2022-05-09 02:38:21.724289 Running on asriitm_tamil test text
2022-05-09 02:38:21.727971 Running on mozillacv_tamil test text
2022-05-09 02:38:21.740236 Running on microsoft_tamil test text
2022-05-09 02:38:21.744020 Running on openslr_tamil test text
2022-05-09 02:38:21.745094 Running on asriitm_tamil test utt2spk
2022-05-09 02:38:21.745343 Running on mozillacv_tamil test utt2spk
2022-05-09 02:38:21.748289 Running on microsoft_tamil test utt2spk
2022-05-09 02:38:21.748920 Running on openslr_tamil test utt2spk
2022-05-09 02:38:21.749746 Running on asriitm_tamil test wav.scp
2022-05-09 02:38:21.750006 Running on mozillacv_tamil test wav.scp
2022-05-09 02:38:21.757167 Running on microsoft_tamil test wav.scp
2022-05-09 02:38:21.758728 Running on openslr_tamil test wav.scp
2022-05-09 02:38:21.759219 finished


sk5057@speech-rec-vm:~/kaldi/egs/tamil_telugu_proj/s5_r3/db$ git diff combined_transcription/dev/utt2spk
diff --git a/combined_transcription/dev/utt2spk b/combined_transcription/dev/utt2spk
index 4cdbd4d..18c8410 100644
--- a/combined_transcription/dev/utt2spk
+++ b/combined_transcription/dev/utt2spk
@@ -2948,6 +2948,7 @@ cbe_00214_long_00378_tam_0010 cbe_00214
 cbe_00214_long_00378_tam_0011 cbe_00214
 cbe_00214_long_00378_tam_0012 cbe_00214
 cbe_00214_long_00378_tam_0013 cbe_00214
+
 mcvspeaker031-common_voice_ta_24959711 mcvspeaker031
 mcvspeaker031-common_voice_ta_24959713 mcvspeaker031
 mcvspeaker031-common_voice_ta_24959750 mcvspeaker031
@@ -14420,7 +14421,8 @@ mcvspeaker443-common_voice_ta_21445221 mcvspeaker443
 mcvspeaker443-common_voice_ta_21445222 mcvspeaker443
 mcvspeaker443-common_voice_ta_21445233 mcvspeaker443
 mcvspeaker443-common_voice_ta_21445251 mcvspeaker443
-mcvspeaker443-common_voice_ta_21445255 mcvspeaker443000510018 000510018
+mcvspeaker443-common_voice_ta_21445255 mcvspeaker443
+000510018 000510018
 TA0646-TA0648_1-B.335 TA0646-TA0648_1-B.335
 000520332 000520332
 TA0613-TA0615_2-B.113 TA0613-TA0615_2-B.113
@@ -14810,7 +14812,8 @@ TA0498-TA0500_1-A.378 TA0498-TA0500_1-A.378
 TA0701-TA0702_2-B.270 TA0701-TA0702_2-B.270
 000560454 000560454
 TA0395-TA0396_1-B.232 TA0395-TA0396_1-B.232
-TA0341-TA0342_2-B.310 TA0341-TA0342_2-B.310taf_00008_00174260673 taf_00008
+TA0341-TA0342_2-B.310 TA0341-TA0342_2-B.310
+taf_00008_00174260673 taf_00008
 taf_00008_00326741737 taf_00008
 taf_00008_01305524612 taf_00008




 ## Stage 13

 ```
 sort: write failed: 'standard output': Broken pipe
sort: write error
 ```
https://stackoverflow.com/a/46203242/3465519

 Nothing to worry about regarding the above error


 https://git-lfs.github.com/

 tried above and taking lot of time

 ```
 sk5057@speech-rec-vm:~/kaldi/egs/tamil_telugu_proj/s5_r3/db$ cp -R data data_after_stage13
 ```


## Stage 14
```
 nohup ./run.sh > logs/stage14.log 2>&1 &
 tail -f logs/stage14.log
```

 forgot to comment decoding part, above folder came in handy for backup

```
 sk5057@speech-rec-vm:~/kaldi/egs/tamil_telugu_proj/s5_r3/db$ du -s data --block-size=G
15G	data

sk5057@speech-rec-vm:~/kaldi/egs/tamil_telugu_proj/s5_r3$ du -s db --block-size=G
124G	db

```

## Stage 15
forgot to change stage number when running. Did that mess up with some folders/data?


```
 nohup ./run.sh > logs/stage15.log 2>&1 &
 tail -f logs/stage15.log
```

```
sk5057@speech-rec-vm:~/kaldi/egs/tamil_telugu_proj/s5_r3$ cp -R exp/ exp_after_stage15
```

## Stage 15
```
 nohup ./run.sh > logs/stage16.log 2>&1 &
 tail -f logs/stage16.log
```

## Stage 16 - Should this stage be skipped?


## Stage 17
 apt install nvidia-cuda-toolkit

https://kaldi-asr.org/doc/cudamatrix.html
 If you want to tell whether Kaldi has been configured to use CUDA, you can grep for CUDATKDIR in kaldi.mk; if the string appears, then it has been configured to use CUDA.

 ```
sk5057@speech-rec-vm:~/kaldi/src$ ./configure 
Configuring KALDI to use MKL.
Backing up kaldi.mk to kaldi.mk.bak ...
Checking compiler c++ ...
Checking OpenFst library in /home/sk5057/kaldi/tools/openfst-1.7.2 ...
Checking cub library in /home/sk5057/kaldi/tools/cub-1.8.0 ...
Performing OS specific configuration ...
On Linux: Checking for linear algebra header files ...
Configuring MKL library directory: Found /opt/intel/mkl/lib/intel64
MKL libs MKL_LDLIBS = -L/opt/intel/mkl/lib/intel64 -Wl,-rpath=/opt/intel/mkl/lib/intel64 -l:libmkl_intel_lp64.so -l:libmkl_core.so -l:libmkl_sequential.so -ldl -lpthread -lm.
MKL compile flags MKL_CXXFLAGS = -I/opt/intel/mkl/include.
*** MKL self-reported version:
Intel(R) Math Kernel Library Version 2020.0.0 Product Build 20191122 for Intel(R) 64 architecture applications
Successfully configured for Linux with MKL libraries found in /opt/intel/mkl
***configure failed: CUDA 9_1 does not support c++ (g++-7).
                 You need g++ < 7.0. ***

 ```
root@speech-rec-vm:/usr/lib/nvidia-cuda-toolkit/bin# cd /usr/bin/
root@speech-rec-vm:/usr/bin# mv g++ g++_backup7.5
root@speech-rec-vm:/usr/bin# mv gcc gcc_backup7.5


sudo ln -s /usr/bin/g++-6 g++
sudo ln -s /usr/bin/gcc-6 gcc


Editing VM instance "speech-rec-vm" failed. Error: Instances with guest accelerators do not support live migration. 

https://cloud.google.com/compute/docs/instances/setting-instance-scheduling-options#updatingoption

host maintenance -> temrinate

```
 nohup ./run.sh > logs/stage17.log 2>&1 &
 tail -f logs/stage17.log

```

```
utils/validate_data_dir.sh: Error: in data/dev_hires, utterance-ids extracted from utt2spk and features
utils/validate_data_dir.sh: differ, partial diff is:
--- /tmp/kaldi.5WDS/utts	2022-05-22 14:46:07.588777681 +0000
+++ /tmp/kaldi.5WDS/utts.feats	2022-05-22 14:46:08.388777291 +0000
@@ -14814,43 +14814 @@
 mcvspeaker543-common_voice_ta_26771613
-taf_00008_00174260673
-taf_00008_00326741737
...
[Lengths are /tmp/kaldi.5WDS/utts=14856 versus /tmp/kaldi.5WDS/utts.feats=14814]
```


```
sk5057@speech-rec-vm:~/kaldi/egs/wsj/s5/utils$ git diff .
diff --git a/egs/wsj/s5/utils/copy_data_dir.sh b/egs/wsj/s5/utils/copy_data_dir.sh
index 9fd420c42..02ff5ff06 100755
--- a/egs/wsj/s5/utils/copy_data_dir.sh
+++ b/egs/wsj/s5/utils/copy_data_dir.sh
@@ -142,4 +142,5 @@ done
 [ ! -f $srcdir/feats.scp ] && validate_opts="$validate_opts --no-feats"
 [ ! -f $srcdir/text ] && validate_opts="$validate_opts --no-text"
 
+utils/fix_data_dir.sh $destdir
 utils/validate_data_dir.sh $validate_opts $destdir
```
