# -*- coding: utf-8 -*-
# <nbformat>3.0</nbformat>

# <codecell>

data = open("D:/0 Stern MSBA/0.2 Capstone/ICPSR_35036/DS0001/35036-0001-Data.txt/da35036-0001.txt","r")
newfile = open("D:/0 Stern MSBA/0.2 Capstone/ICPSR_35036/DS0001/35036-0001-Data.txt/data_childabduction.txt","w")

# <codecell>

lines=0
count=0

for line in data:
    if (line[360:362]=="100" or line[357:359]=="100" or line[353:356]=="100") and (line[818]==" " or line[818]=="1") and (line[822]==" " or line[822]=="1" or line[822]=="-") and (line[826]==" " or line[826]=="1" or line[826]=="-"):
        newfile.write(line)
        lines = lines + 1
    count=count+1

print count    
print lines

# <codecell>

data.close()
newfile.close()

# <codecell>

data = open("D:/0 Stern MSBA/0.2 Capstone/ICPSR_35036/DS0001/35036-0001-Data.txt/data_childabduction.txt","r")

for i in range(1,500):
    line = data.readline()
    
for i in range(1,10):
    line = data.readline()
    print i
    print "Characters in entry: %s" % (len(line))
    print "Single entry: %s" % (line)
    
    print "State abbreviation, chars 107-108: %s" % (line[106:108])
    print "1st UCR crime code, chars 354-356: %s" % (line[353:356])
    print "1st victim age, chars 819-822: %s" % (line[818:822])
    print "Relationship of victim to offender, chars 909-910: %s" % (line[908:910])
    print "\n"
    
data.close()

# <codecell>

data = open("D:/0 Stern MSBA/0.2 Capstone/ICPSR_35036/DS0001/35036-0001-Data.txt/data_childabduction.txt","r")

SEGMENT = []
STATE = []
ORI = []
INCNUM = []
INCDATE = []
B1006 = []
B1007 = []
B1009 = []
B1010 = []
B1011 = []
B2005 = []
B2006 = []
B3024 = []
V1006 = []
V1007 = []
V20061 = []
V20062 = []
V20063 = []
V20071 = []
V20072 = []
V20073 = []
V20111 = []
V20171 = []
V20172 = []
V40181 = []
V40182 = []
V40183 = []
V40191 = []
V40192 = []
V40193 = []
V40201 = []
V40202 = []
V40203 = []
V40211 = []
V40212 = []
V40213 = []
V40221 = []
V40222 = []
V40223 = []
V40231 = []
V40232 = []
V40261 = []
V40262 = []
V40263 = []
V40321 = []
V40322 = []
V40323 = []
V40341 = []
V40342 = []
V40343 = []
V40361 = []
V40362 = []
V40363 = []
V50071 = []
V50072 = []
V50073 = []
V50081 = []
V50082 = []
V50083 = []
V50091 = []
V50092 = []
V50093 = []
V60081 = []
V60082 = []
V60091 = []
V60092 = []
V60111 = []
V60112 = []






lines=0
for line in data:
    SEGMENT.append(line[0:2])
    STATE.append(line[2:4])
    ORI.append(line[4:13])
    INCNUM.append(line[13:25])
    INCDATE.append(line[25:33])
    B1006.append(line[68:76])
    B1007.append(line[76:106])
    B1009.append(line[108:110])
    B1010.append(line[110:112])
    B1011.append(line[112:114])
    B2005.append(line[145:154])
    B2006.append(line[154:157])
    B3024.append(line[309:312])
    V1006.append(line[324:326])
    V1007.append(line[326:328])
    V20061.append(line[353:356])
    V20062.append(line[356:359])
    V20063.append(line[359:362])
    V20071.append(line[362:364])
    V20072.append(line[364:366])
    V20073.append(line[366:368])
    V20111.append(line[386:388])
    V20171.append(line[422:425])
    V20172.append(line[425:428])
    V40181.append(line[818:822])
    V40182.append(line[822:826])
    V40183.append(line[826:830])
    V40191.append(line[830:832])
    V40192.append(line[832:834])
    V40193.append(line[834:836])
    V40201.append(line[836:838])
    V40202.append(line[838:840])
    V40203.append(line[840:842])
    V40211.append(line[842:844])
    V40212.append(line[844:846])
    V40213.append(line[846:848])
    V40221.append(line[848:850])
    V40222.append(line[850:852])
    V40223.append(line[852:854])
    V40231.append(line[854:856])
    V40232.append(line[856:858])
    V40261.append(line[872:874])
    V40262.append(line[874:876])
    V40263.append(line[876:878])
    V40321.append(line[908:910])
    V40322.append(line[910:912])
    V40323.append(line[912:914])
    V40341.append(line[920:922])
    V40342.append(line[922:924])
    V40343.append(line[924:926])
    V40361.append(line[932:934])
    V40362.append(line[934:936])
    V40363.append(line[936:938])
    V50071.append(line[1028:1030])
    V50072.append(line[1030:1032])
    V50073.append(line[1032:1034])
    V50081.append(line[1034:1036])
    V50082.append(line[1036:1038])
    V50083.append(line[1038:1040])
    V50091.append(line[1040:1042])
    V50092.append(line[1042:1044])
    V50093.append(line[1044:1046])
    V60081.append(line[1088:1096])
    V60082.append(line[1096:1104])
    V60091.append(line[1112:1114])
    V60092.append(line[1114:1116])
    V60111.append(line[1124:1127])
    V60112.append(line[1127:1130])

    lines = lines + 1
    
print lines
print V40181[1:5]

data.close()


# <codecell>

# For all child crime - new fields 

merge = zip(SEGMENT, STATE, ORI, INCNUM, INCDATE, B1006, B1007, B1009, B1010, B1011, B2005, B2006, B3024, V1006, V1007, V20061, V20062, 
            V20063, V20071, V20072, V20073, V20111, V20171, V20172, V40181, V40182, V40183, V40191, V40192, V40193, V40201, V40202, 
            V40203, V40211, V40212, V40213, V40221, V40222, V40223, V40231, V40232, V40261, V40262, V40263, V40321, V40322, V40323, 
            V40341, V40342, V40343, V40361, V40362, V40363,
            V50071, V50072, V50073, V50081, V50082, V50083, V50091, V50092, V50093, V60081, V60082, V60091, V60092,
            V60111, V60112)

print merge[1]

# <codecell>

# create year only file

import csv

end = len(STATE)
print end

with open("D:/0 Stern MSBA/0.2 Capstone/ICPSR_35036/DS0001/35036-0001-Data.txt/data_final.csv",'wb') as output:
    cw = csv.writer(output, lineterminator='\n')
    for val in range(end):
        cw.writerow(list(merge[val]))
    

# <codecell>

# append to common file
import csv

end = len(STATE)
print end

with open("D:/0 Stern MSBA/0.2 Capstone/DS0001/data_final.csv",'a') as output:
    cw = csv.writer(output, lineterminator='\n')
    for val in range(end):
        cw.writerow(list(merge[val]))

# <codecell>

# Validation that all years are included in final file

data = open("D:/0 Stern MSBA/0.2 Capstone/DS0001/data_final.csv","r")

count=0
for line in data:
    count=count+1
print count 

data.close()

# <codecell>

