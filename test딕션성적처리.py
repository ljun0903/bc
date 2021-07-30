score_dict = { '김자바' : [5, 3] , '이합격' : [7,3], 'Harry':[2,6], 'Mike' : [1,8] }
# score_dict = { '김자바' : [90, 80] , '이합격' : [80,77], 'Harry':[63,77], 'Mike' : [82,34] }
print(score_dict.values())
print()

def score_average(f_dict) :
    eng_list =[]
    math_list =[]
    for data in f_dict.values() :
        eng_list.append(data[0])
        math_list.append(data[1])
    eng_avg = sum(eng_list) / len(eng_list)
    math_avg = sum(math_list) / len(math_list)
    return eng_avg, math_avg    

ret1,ret2 = score_average(score_dict)
print('영어평균 =', ret1)
print('수학평균 =', ret2)
