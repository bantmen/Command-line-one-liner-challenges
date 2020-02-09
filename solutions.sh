#!/bin/sh

sort < 001_count/problem/input.txt | uniq -c

rev < 002_last_paragraph/problem/input.txt | awk '/^$/{ exit 1; } {print $1}' | rev

comm -12 \
    <(sort 003_intersection/problem/input1.txt) \
    <(sort 003_intersection/problem/input2.txt)

awk '{sum += $1} END{print sum}' 004_sum/problem/input.txt

awk '!/^$/{print $1}' 005_no_blank_lines/problem/input.txt

lam \
    006_merge_2_files/problem/input1.txt \
    -s ',' \
    006_merge_2_files/problem/input2.txt

#grep -oiE '[^a-z]the[^a-z]' 007_word_count/problem/input.txt | awk '{print tolower($1)}' | less
grep -oiw the 007_word_count/problem/input.txt | wc -l

awk '
    {if (NR == 1) printf "%s", $1}
    {if (NR > 1) printf ",%s", $1}
    END{printf "\n"}' \
    008_join_with_commas/problem/input.txt

comm -23 \
    <(sort 009_subtraction/problem/input1.txt) \
    <(sort 009_subtraction/problem/input2.txt)

awk '{print length}' 010_longest_line/problem/input.txt | sort -n | tail -n1

comm -2 \
    <(sort 011_jaccard/problem/input1.txt) \
    <(sort 011_jaccard/problem/input2.txt)

jaccard() {
    echo $(comm -12 $1 $2 | wc -l) / $(cat $1 $2 | sort -u | wc -l) | bc -l
}
jaccard 011_jaccard/problem/input1.txt 011_jaccard/problem/input2.txt

# TODO: 12

#grep -w the 013_text_highlight/problem/input.txt

cat -n 014_uniq/problem/input.txt | sort --key=2 -un | sort --key=1 -n | awk '{print $2}'

