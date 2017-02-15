
gen dtoloc=0
replace dtoloc=1 if dto_loc=="I"
replace dtoloc=2 if dto_loc=="II"
replace dtoloc=3 if dto_loc=="III"
replace dtoloc=4 if dto_loc=="IV"
replace dtoloc=5 if dto_loc=="V"
replace dtoloc=6 if dto_loc=="VI"
replace dtoloc=7 if dto_loc=="VII"
replace dtoloc=8 if dto_loc=="VIII"
replace dtoloc=9 if dto_loc=="IX"
replace dtoloc=10 if dto_loc=="X"
replace dtoloc=11 if dto_loc=="XI"
replace dtoloc=12 if dto_loc=="XII"
replace dtoloc=13 if dto_loc=="XIII"
replace dtoloc=14 if dto_loc=="XIV"
replace dtoloc=15 if dto_loc=="XV"
replace dtoloc=16 if dto_loc=="XVI"
replace dtoloc=17 if dto_loc=="XVII"
replace dtoloc=18 if dto_loc=="XVIII"
replace dtoloc=19 if dto_loc=="XIX"
replace dtoloc=20 if dto_loc=="XX"
replace dtoloc=21 if dto_loc=="XXI"
replace dtoloc=22 if dto_loc=="XXII"
replace dtoloc=23 if dto_loc=="XXIII"
replace dtoloc=24 if dto_loc=="XXIV"
replace dtoloc=25 if dto_loc=="XXV"
replace dtoloc=26 if dto_loc=="XXVI"
replace dtoloc=27 if dto_loc=="XXVII"
replace dtoloc=28 if dto_loc=="XXVIII"
replace dtoloc=29 if dto_loc=="XXIX"
replace dtoloc=30 if dto_loc=="XXX"
replace dtoloc=31 if dto_loc=="XXXI"
replace dtoloc=32 if dto_loc=="XXXII"
replace dtoloc=33 if dto_loc=="XXXIII"
replace dtoloc=34 if dto_loc=="XXXIV"
replace dtoloc=35 if dto_loc=="XXXV"
replace dtoloc=36 if dto_loc=="XXXVI"
replace dtoloc=37 if dto_loc=="XXXVII"
replace dtoloc=38 if dto_loc=="XXXVIII"
replace dtoloc=39 if dto_loc=="XXXIX"
replace dtoloc=40 if dto_loc=="XL"

move dtoloc dto_loc
drop dto_loc

gen orden=_n
sort dtoloc orden

by dtoloc: egen pan2=sum(pan)
by dtoloc: egen pri2=sum(pri)
by dtoloc: egen prd2=sum(prd)
by dtoloc: egen pt2=sum(pt)
by dtoloc: egen pvem2=sum(pvem)
by dtoloc: egen conver2=sum(conver)
by dtoloc: egen psn2=sum(psn)
by dtoloc: egen pas2=sum(pas)
by dtoloc: egen mp2=sum(mp)
by dtoloc: egen plm2=sum(plm)
by dtoloc: egen fc2=sum(fc)
by dtoloc: egen cc_012=sum(cc_01)
by dtoloc: egen cc_022=sum(cc_02)
by dtoloc: egen cc_032=sum(cc_03)
by dtoloc: egen cc_042=sum(cc_04)
by dtoloc: egen v_blan2=sum(v_blan)
by dtoloc: egen v_nul2=sum(v_nul)

