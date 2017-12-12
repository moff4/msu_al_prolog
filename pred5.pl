% iii iio ioi oii ooi
delete_one(E,[E|T],T).
delete_one(E,[X|T],[X|T1]):-delete_one(E,T,T1).
