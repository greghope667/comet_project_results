{if (($3 < -8) && ($5 > 1.1) &&\
    (($6 > 0.10) && ($7 > 0.10) && ($6 > 0.40*$7) && ($7 > $6 * 0.40)) &&\
    ($10 == "maybeTransit")) print}