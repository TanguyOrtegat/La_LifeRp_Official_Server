-------------------------------------------------
--  SCRIPT MADE BY MADRIAX FOR GTARPFRANCE     --
-------------------------------------------------

local displayApartBlips = true --SET TO TRUE IF YOU WANT TO ADD BLIPS FOR APPARTMENTS

local id = 0
local nom = ""
local nb = 0
local remitem = 0
local envoi = 0
local recois = 0
local additem = 0
local waittemp = 0

local interiors = {
    [1] = { ["price"] = 1500000, ["xe"] = -1910.7265625, ["ye"] = -576.919189453125, ["ze"] = 19.0969314575195, ["he"] = 0.00, ["xo"] = -1910.099609375, ["yo"] = -574.97265625, ["zo"] = 19.0956039428711, ["ho"] = 0.00, ["xc"] = -1905.1245117188, ["yc"] = -570.59210205078, ["zc"] = 19.097215652466, ["hc"] = 0.000, ["name"] = 'Great Ocean Rte Office'},
    [2] = { ["price"] = 3000000, ["xe"] = -269.457214355469, ["ye"] = -955.855529785156, ["ze"] = 31.2231330871582, ["he"] = 0.00, ["xo"] = -270.538421630859, ["yo"] = -940.73974609375, ["zo"] = 92.5109481811523, ["ho"] = 0.00, ["xc"] = -273.08609008789, ["yc"] = -949.53454589844, ["zc"] = 92.519584655762, ["hc"] = 0.000, ["name"] = '3 Alta Street'},
    [3] = { ["price"] = 2900000, ["xe"] = -44.6460037231445, ["ye"] = -587.163024902344, ["ze"] = 38.1613159179688, ["he"] = 0.00, ["xo"] = -30.8175601959229, ["yo"] = -595.315246582031, ["zo"] = 80.030891418457, ["ho"] = 0.00, ["xc"] = -11.545338630676, ["yc"] = -598.25274658203, ["zc"] = 79.430229187012, ["hc"] = 0.000, ["name"] = '4 INTEGRITY apt:1'},
    [4] = { ["price"] = 2910000, ["xe"] = -43.9314346313477, ["ye"] = -584.379028320313, ["ze"] = 38.1618614196777, ["he"] = 0.00, ["xo"] = -18.1004009246826, ["yo"] = -590.620544433594, ["zo"] = 90.1148223876953, ["ho"] = 0.00, ["xc"] = -26.838409423828, ["yc"] = -588.61120605469, ["zc"] = 90.123252868652, ["hc"] = 0.000, ["name"] = '4 INTEGRITY apt:2'},
    [5] = { ["price"] = 3020000, ["xe"] = -467.08148193359, ["ye"] = -678.97357177734, ["ze"] = 32.713237762451, ["he"] = 0.00, ["xo"] = -466.607604980469, ["yo"] = -708.706115722656, ["zo"] = 77.0869216918945, ["ho"] = 0.00, ["xc"] = -467.79638671875, ["yc"] = -699.92169189453, ["zc"] = 77.09529876709, ["hc"] = 0.000, ["name"] = '7302 San Andreas'},
    [6] = { ["price"] = 3800000, ["xe"] = 119.249359130859, ["ye"] = 564.305969238281, ["ze"] = 183.96142578125, ["he"] = 0.00, ["xo"] = 117.411087036133, ["yo"] = 559.382934570313, ["zo"] = 184.30485534668, ["ho"] = 0.00, ["xc"] = 119.19569396973, ["yc"] = 567.23858642578, ["zc"] = 176.6971282959, ["hc"] = 0.000, ["name"] = '1 Whispymound Drive'},
    [7] = { ["price"] = 3600000, ["xe"] = 374.177398681641, ["ye"] = 427.730651855469, ["ze"] = 145.684204101563, ["he"] = 0.00, ["xo"] = 373.5234375, ["yo"] = 423.222930908203, ["zo"] = 145.90788269043, ["ho"] = 0.00, ["xc"] = 377.72708129883, ["yc"] = 429.98013305664, ["zc"] = 138.30012512207, ["hc"] = 0.000, ["name"] = '1 North Conker Avenue'},
    [8] = { ["price"] = 4200000, ["xe"] = -174.349594116211, ["ye"] = 502.55615234375, ["ze"] = 137.42024230957, ["he"] = 0.00, ["xo"] = -174.111358642578, ["yo"] = 497.260223388672, ["zo"] = 137.661056518555, ["ho"] = 0.00, ["xc"] = -175.29309082031, ["yc"] = 492.77722167969, ["zc"] = 130.04368591309, ["hc"] = 0.000, ["name"] = '3655 Wild Oats Drive'},
    [9] = { ["price"] = 4000000, ["xe"] = 346.176666259766, ["ye"] = 440.199554443359, ["ze"] = 148.08430480957, ["he"] = 0.00, ["xo"] = 341.693542480469, ["yo"] = 437.470153808594, ["zo"] = 149.387069702148, ["ho"] = 0.00, ["xc"] = 337.02801513672, ["yc"] = 437.22332763672, ["zc"] = 141.77081298828, ["hc"] = 0.000, ["name"] = '2 North Conker Avenue'},
    [10] = { ["price"] = 3500000, ["xe"] = -1443.81750488281, ["ye"] = -536.080017089844, ["ze"] = 34.7401390075684, ["he"] = 0.00, ["xo"] = -1452.4449462891, ["yo"] = -540.12640380859, ["zo"] = 74.039436340332, ["ho"] = 0.00, ["xc"] = -1466.2700195313, ["yc"] = -527.17639160156, ["zc"] = 73.443649291992, ["hc"] = 0.000, ["name"] = 'Prosperity Suits 1'},
    [11] = { ["price"] = 3599999, ["xe"] = -1450.7607421875, ["ye"] = -540.988159179688, ["ze"] = 34.7401390075684, ["he"] = 0.00, ["xo"] = -1450.5263671875, ["yo"] = -525.1552734375, ["zo"] = 69.5566940307617, ["ho"] = 0.00, ["xc"] = -1457.4157714844, ["yc"] = -530.98254394531, ["zc"] = 69.565299987793, ["hc"] = 0.000, ["name"] = 'Prosperity Suits 2'},
    [12] = { ["price"] = 3500000, ["xe"] = -1447.42456054688, ["ye"] = -537.894348144531, ["ze"] = 34.7402763366699, ["he"] = 0.00, ["xo"] = -1450.3311767578, ["yo"] = -525.12609863281, ["zo"] = 56.926513671875, ["ho"] = 0.00, ["xc"] = -1456.6905517578, ["yc"] = -531.12316894531, ["zc"] = 56.936767578125, ["hc"] = 0.000, ["name"] = 'Prosperity Suits 3'},
    [13] = { ["price"] = 3500000, ["xe"] = -909.29852294922, ["ye"] = -380.98092651367, ["ze"] = 38.961338043213, ["he"] = 0.00, ["xo"] = -912.898193359375, ["yo"] = -365.340240478516, ["zo"] = 114.274772644043, ["ho"] = 0.00, ["xc"] = -928.49481201172, ["yc"] = -377.36541748047, ["zc"] = 113.6741027832, ["hc"] = 0.000, ["name"] = 'Movie Star Way apt:1'},
    [14] = { ["price"] = 4000000, ["xe"] = -933.16296386719, ["ye"] = -384.10470581055, ["ze"] = 38.961315155029, ["he"] = 0.00, ["xo"] = -907.419128417969, ["yo"] = -371.880340576172, ["zo"] = 109.44034576416, ["ho"] = 0.00, ["xc"] = -914.86328125, ["yc"] = -376.52279663086, ["zc"] = 109.44886016846, ["hc"] = 0.000, ["name"] = 'Movie Star Way apt:2'},
    [15] = { ["price"] = 3500000, ["xe"] = -935.95709228516, ["ye"] = -378.77102661133, ["ze"] = 38.961292266846, ["he"] = 0.00, ["xo"] = -922.5458984375, ["yo"] = -379.319671630859, ["zo"] = 85.4805603027344, ["ho"] = 0.00, ["xc"] = -915.03698730469, ["yc"] = -374.42596435547, ["zc"] = 85.489181518555, ["hc"] = 0.000, ["name"] = 'Movie Star Way apt:3'},
    [16] = { ["price"] = 3800000, ["xe"] = -906.40924072266, ["ye"] = -451.60464477539, ["ze"] = 39.605278015137, ["he"] = 0.00, ["xo"] = -907.26611328125, ["yo"] = -454.278350830078, ["zo"] = 126.534423828125, ["ho"] = 0.00, ["xc"] = -899.81188964844, ["yc"] = -448.90805053711, ["zc"] = 126.54287719727, ["hc"] = 0.000, ["name"] = 'Movie Star Way apt:4'},
    [17] = { ["price"] = 3700000, ["xe"] = -908.83648681641, ["ye"] = -446.0553894043, ["ze"] = 39.605278015137, ["he"] = 0.00, ["xo"] = -890.076171875, ["yo"] = -452.320587158203, ["zo"] = 95.4610977172852, ["ho"] = 0.00, ["xc"] = -894.59118652344, ["yc"] = -444.65994262695, ["zc"] = 95.469818115234, ["hc"] = 0.000, ["name"] = 'Movie Star Way apt:5'},
    [18] = { ["price"] = 3600000, ["xe"] = -914.38677978516, ["ye"] = -443.35025024414, ["ze"] = 39.605278015137, ["he"] = 0.00, ["xo"] = -890.076171875, ["yo"] = -452.320587158203, ["zo"] = 95.4610977172852, ["ho"] = 0.00, ["xc"] = -898.65472412109, ["yc"] = -440.93392944336, ["zc"] = 121.61570739746, ["hc"] = 0.000, ["name"] = 'Movie Star Way apt:6'},
    [19] = { ["price"] = 3000000, ["xe"] = -770.41326904297, ["ye"] = 318.92639160156, ["ze"] = 85.662643432617, ["he"] = 0.00, ["xo"] = -782.1015625, ["yo"] = 325.28982543945, ["zo"] = 223.25762939453, ["ho"] = 0.00, ["xc"] = -773.14025878906, ["yc"] = 326.33673095703, ["zc"] = 223.26606750488 , ["hc"] = 0.000, ["name"] = 'Eclipse apt: 1'},
    [20] = { ["price"] = 3050000, ["xe"] = -774.04925537109, ["ye"] = 317.85415649414, ["ze"] = 85.662628173828, ["he"] = 0.00, ["xo"] = -774.52435302734, ["yo"] = 332.71438598633, ["zo"] = 160.00144958496, ["ho"] = 0.00, ["xc"] = -783.65307617188, ["yc"] = 331.42367553711, ["zc"] = 160.01020812988, ["hc"] = 0.000, ["name"] = 'Eclipse apt: 2'},
    [21] = { ["price"] = 2950000, ["xe"] = -777.325866699, ["ye"] = 318.451171875, ["ze"] = 85.662651062012, ["he"] = 0.00, ["xo"] = -781.86773681641, ["yo"] = 325.28396606445, ["zo"] = 176.80378723145, ["ho"] = 0.00, ["xc"] = -772.48773193359, ["yc"] = 326.17742919922, ["zc"] = 176.81239318848, ["hc"] = 0.000, ["name"] = 'Eclipse apt: 3'},
    [22] = { ["price"] = 3000000, ["xe"] = -769.51983642578, ["ye"] = 315.58416748047, ["ze"] = 85.662658691406, ["he"] = 0.00, ["xo"] = -784.95989990234, ["yo"] = 323.68161010742, ["zo"] = 211.99723815918, ["ho"] = 0.00, ["xc"] = -765.63299560547, ["yc"] = 327.82583618164, ["zc"] = 211.39657592773, ["hc"] = 0.000, ["name"] = 'Eclipse apt: 4'},
    [23] = { ["price"] = 1400000, ["xe"] = -3093.06884765625, ["ye"] = 349.211853027344, ["ze"] = 7.53054094314575, ["he"] = 0.00, ["xo"] = -3094.15478515625, ["yo"] = 339.901702880859, ["zo"] = 10.8038291931152, ["ho"] = 0.00, ["xc"] = -3103.201171875, ["yc"] = 351.52017211914, ["zc"] = 10.911939620972, ["hc"] = 0.000, ["name"] = '1 Great Ocean Rte'},
    [24] = { ["price"] = 1450000, ["xe"] = -3100.38256835938, ["ye"] = 360.864776611328, ["ze"] = 7.59101963043213, ["he"] = 0.00, ["xo"] = -3094.47314453125, ["yo"] = 340.733428955078, ["zo"] = 14.4392118453979, ["ho"] = 0.00, ["xc"] = -3103.13671875, ["yc"] = 346.45755004883, ["zc"] = 14.440872192383, ["hc"] = 0.000, ["name"] = '2 Great Ocean Rte'},
    [25] = { ["price"] = 1500000, ["xo"] = 266.35906982422, ["yo"] = -1007.0491333008, ["zo"] = -100.94031524658, ["ho"] = 0.00, ["xe"] = -132.3464050293, ["ye"] = -1462.6171875, ["ze"] = 36.992130279541, ["he"] = 0.00, ["xc"] = 259.45571899414, ["yc"] = -1004.0234985352, ["zc"] = -99.008567810059, ["hc"] = 0.000, ["name"] = 'Carson Ave Apartement'},
    [26] = { ["price"] = 3000000, ["xo"] = 346.85025024414, ["yo"] = -1011.7003173828, ["zo"] = -99.196228027344, ["ho"] = 0.00, ["xe"] = -1091.5382080078, ["ye"] = -1145.1306152344, ["ze"] = 2.1585977077484, ["he"] = 0.00, ["xc"] = 350.8405456543, ["yc"] = -993.61340332031, ["zc"] = -99.196281433105, ["hc"] = 0.000, ["name"] = 'Invention Court Apartement'},
    [27] = { ["price"] = 2910000, ["xe"] = -46.053665161133, ["ye"] = -590.83404541016, ["ze"] = 38.160980224609, ["he"] = 0.00, ["xo"] = -24.816530227661, ["yo"] = -607.74127197266, ["zo"] = 100.2328414917, ["ho"] = 0.00, ["xc"] = -22.663204193115, ["yc"] = -599.18334960938, ["zc"] = 100.24121856689, ["hc"] = 0.000, ["name"] = '4 INTEGRITY apt:3'},
    [28] = { ["price"] = 500000, ["xo"] = 151.41857910156, ["yo"] = -1007.4624023438, ["zo"] = -99.000007629395, ["ho"] = 0.00, ["xe"] = 310.10595703125, ["ye"] = -208.19564819336, ["ze"] = 58.019241333008, ["he"] = 0.00, ["xc"] = 151.79954528809, ["yc"] = -1001.2631225586, ["zc"] = -99.000022888184, ["hc"] = 0.000, ["name"] = 'Motel Room'},
    [29] = { ["price"] = 10000, ["xe"] = -277.95172119141, ["ye"] = -936.53070068359, ["ze"] = 92.510902404785, ["he"] = 0.00, ["xo"] = -269.14294433594, ["yo"] = -948.38970947266, ["zo"] = 130.61787414551, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Acces au toit 1'},
    [30] = { ["price"] = 10000, ["xe"] = -17.658882141113, ["ye"] = -611.86480712891, ["ze"] = 100.2328338623, ["he"] = 0.00, ["xo"] = -36.797550201416, ["yo"] = -598.90106201172, ["zo"] = 106.32261657715, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Acces au toit 2'},
    [31] = { ["price"] = 10000, ["xe"] = -28.897096633911, ["ye"] = -597.73864746094, ["ze"] = 80.030853271484, ["he"] = 0.00, ["xo"] = -39.247344970703, ["yo"] = -614.38104248047, ["zo"] = 35.268928527832, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] =0, ["hc"] = 0.000, ["name"] = 'Stationnement'},
    [32] = { ["price"] = 10000, ["xe"] = -14.221579551697, ["ye"] = -583.31018066406, ["ze"] = 90.114814758301, ["he"] = 0.00, ["xo"] = -38.796272277832, ["yo"] = -597.47143554688, ["zo"] = 106.32269287109, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Acces au toit 4'},
    [33] = { ["price"] = 10000, ["xe"] = -458.62884521484, ["ye"] = -709.83508300781, ["ze"] = 77.086891174316, ["he"] = 0.00, ["xo"] = -458.71527099609, ["yo"] = -705.70367431641, ["zo"] = 81.186462402344, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Acces au toit 5'},
    [34] = { ["price"] = 10000, ["xe"] = -1454.0495605469, ["ye"] = -536.36395263672, ["ze"] = 74.044250488281, ["he"] = 0.00, ["xo"] = -1451.1939697266, ["yo"] = -541.16760253906, ["zo"] = 85.072975158691, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Acces au toit 10'},
    [35] = { ["price"] = 10000, ["xe"] = -1454.9125976563, ["ye"] = -517.08996582031, ["ze"] = 69.556602478027, ["he"] = 0.00, ["xo"] = -1472.6486816406, ["yo"] = -539.77087402344, ["zo"] = 85.072959899902, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Acces au toit 11'},
    [36] = { ["price"] = 10000, ["xe"] = -1454.7541503906, ["ye"] = -516.96325683594, ["ze"] = 56.928993225098, ["he"] = 0.00, ["xo"] = -1454.0168457031, ["yo"] = -564.38500976563, ["zo"] = 85.072952270508, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Acces au toit 12'},
    [37] = { ["price"] = 10000, ["xe"] = -1453.2266845703, ["ye"] = -537.66180419922, ["ze"] = 74.044258117676, ["he"] = 0.00, ["xo"] = -1454.9431152344, ["yo"] = -513.74450683594, ["zo"] = 31.58180809021, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Stationnement 10'},
    [38] = { ["price"] = 10000, ["xe"] = -1454.0893554688, ["ye"] = -518.44799804688, ["ze"] = 69.556587219238, ["he"] = 0.00, ["xo"] = -1456.5172119141, ["yo"] = -514.22381591797, ["zo"] = 31.581815719604, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Stationnement 11'},
    [39] = { ["price"] = 10000, ["xe"] = -1454.0926513672, ["ye"] = -518.27886962891, ["ze"] = 56.928985595703, ["he"] = 0.00, ["xo"] = -1457.7149658203, ["yo"] = -515.21636962891, ["zo"] = 31.581815719604, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Stationnement 12'},
    [40] = { ["price"] = 10000, ["xe"] = -915.53393554688, ["ye"] = -365.1467590332, ["ze"] = 114.27466583252, ["he"] = 0.00, ["xo"] = -889.443298339844, ["yo"] = -333.081909179688, ["zo"] = 34.6838188171387, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Stationnement 13'},
    [41] = { ["price"] = 10000, ["xe"] = -909.74792480469, ["ye"] = -365.06094360352, ["ze"] = 109.44027709961, ["he"] = 0.00, ["xo"] = -901.707275390625, ["yo"] = -339.162506103516, ["zo"] = 34.6806182861328, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Stationnement 14'},
    [42] = { ["price"] = 10000, ["xe"] = -920.32763671875, ["ye"] = -386.32382202148, ["ze"] = 85.480560302734, ["he"] = 0.00, ["xo"] = -894.848999023438, ["yo"] = -353.67626953125, ["zo"] = 34.6796798706055, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Stationnement 15'},
    [43] = { ["price"] = 10000, ["xe"] = -917.06323242188, ["ye"] = -365.89471435547, ["ze"] = 114.27461242676, ["he"] = 0.00, ["xo"] = -903.64514160156, ["yo"] = -367.97891235352, ["zo"] = 136.28205871582, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Helipad 13'},
    [44] = { ["price"] = 10000, ["xe"] = -910.62933349609, ["ye"] = -363.21365356445, ["ze"] = 109.44027709961, ["he"] = 0.00, ["xo"] = -903.01666259766, ["yo"] = -369.52191162109, ["zo"] = 136.28205871582, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Helipad 14'},
    [45] = { ["price"] = 10000, ["xe"] = -919.50299072266, ["ye"] = -387.98355102539, ["ze"] = 85.480476379395, ["he"] = 0.00, ["xo"] = -901.83038330078, ["yo"] = -372.00057983398, ["zo"] = 136.2822265625, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Helipad 15'},
    [46] = { ["price"] = 10000, ["xe"] = -905.15905761719, ["ye"] = -460.85864257813, ["ze"] = 126.53440093994, ["he"] = 0.00, ["xo"] = -844.50482177734, ["yo"] = -391.58044433594, ["zo"] = 31.471687316895, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Stationnement 16'},
    [47] = { ["price"] = 10000, ["xe"] = -883.50775146484, ["ye"] = -450.45770263672, ["ze"] = 95.461097717285, ["he"] = 0.00, ["xo"] = -837.44952392578, ["yo"] = -405.51617431641, ["zo"] = 31.471698760986, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Stationnement 17'},
    [48] = { ["price"] = 10000, ["xe"] = -893.08483886719, ["ye"] = -429.58871459961, ["ze"] = 121.60707092285, ["he"] = 0.00, ["xo"] = -828.02661132813, ["yo"] = -382.67126464844, ["zo"] = 31.473476409912, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Stationnement 18'},
    [49] = { ["price"] = 10000, ["xe"] = -904.12817382813, ["ye"] = -463.06707763672, ["ze"] = 126.53450012207, ["he"] = 0.00, ["xo"] = -909.01501464844, ["yo"] = -445.08386230469, ["zo"] = 168.11875915527, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Acces au toit 16'},
    [50] = { ["price"] = 10000, ["xe"] = -881.22607421875, ["ye"] = -449.20745849609, ["ze"] = 95.461097717285, ["he"] = 0.00, ["xo"] = -889.21789550781, ["yo"] = -444.14450073242, ["zo"] = 168.11880493164, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Acces au toit 17'},
    [51] = { ["price"] = 10000, ["xe"] = -894.26928710938, ["ye"] = -427.10705566406, ["ze"] = 121.60707092285, ["he"] = 0.00, ["xo"] = -907.85760498047, ["yo"] = -447.83670043945, ["zo"] = 168.11880493164, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Acces au toit 18'},
    [52] = { ["price"] = 10000, ["xe"] = -783.13690185547, ["ye"] = 316.01416015625, ["ze"] = 223.25764465332, ["he"] = 0.00, ["xo"] = -801.635070800784, ["yo"] = 334.64776611328, ["zo"] = 230.63687133789, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Acces au toit 19'},
    [53] = { ["price"] = 10000, ["xe"] = -772.99792480469, ["ye"] = 340.4765625, ["ze"] = 160.00144958496, ["he"] = 0.00, ["xo"] = -755.56420898438, ["yo"] = 332.45803833008, ["zo"] = 230.63684082031, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Acces au toit 20'},
    [54] = { ["price"] = 10000, ["xe"] = -782.92132568359, ["ye"] = 316.13610839844, ["ze"] = 176.8038482666, ["he"] = 0.00, ["xo"] = -755.25146484375, ["yo"] = 334.50823974609, ["zo"] = 230.63687133789, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Acces au toit 21'},
    [55] = { ["price"] = 10000, ["xe"] = -780.82940673828, ["ye"] = 322.45260620117, ["ze"] = 211.99723815918, ["he"] = 0.00, ["xo"] = -755.23834228516, ["yo"] = 336.20803833008, ["zo"] = 230.63687133789, ["ho"] = 0.00, ["xc"] = 0, ["yc"] = 0, ["zc"] = 0, ["hc"] = 0.000, ["name"] = 'Acces au toit 22'},
    [56] = { ["price"] = 10000, ["xe"] = 1394.48278808594, ["ye"] = 1141.74035644531, ["ze"] = 114.606857299805, ["he"] = 0.000, ["xo"] = 1397.33056640625, ["yo"] = 1142.05017089844, ["zo"] = 114.333587646484, ["ho"] = 0.000, ["xc"] = 1398.4145507813, ["yc"] = 1164.1166992188, ["zc"] = 114.33358764648, ["hc"] = 0.000, ["name"] = 'La Fuente Blanca (gang)'},
    [57] = { ["price"] = 100000000, ["xe"] = 1929.818359375, ["ye"] = 4635.51953125, ["ze"] = 40.4547843933105, ["he"] = 0.00, ["xo"] = 1930.04479980469, ["yo"] = 4633.390625, ["zo"] = 40.4920272827148, ["ho"] = 0.00, ["xc"] = 1925.5310058594, ["yc"] = 4614.69921875, ["zc"] = 40.452339172363, ["hc"] = 0.000, ["name"] = 'Aerodrome'},
    [58] = { ["price"] = 100000000, ["xe"] = 837.951599121094, ["ye"] = -1375.06799316406, ["ze"] = 26.3081645965576, ["he"] = 0.00, ["xo"] = 833.578125, ["yo"] = -1379.69384765625, ["zo"] = 26.3136196136475, ["ho"] = 0.00, ["xc"] = 1397.33056640625, ["yc"] = 1142.05017089844, ["zc"] = 114.333587646484, ["hc"] = 0.000, ["name"] = 'Grange Centre Ville'},
    [59] = { ["price"] = 10000, ["xe"] = 896.16186523438, ["ye"] = -144.85054016113, ["ze"] = 76.785697937012, ["he"] = 0.00, ["xo"] = 207.32164001465, ["yo"] = -1018.3356323242, ["zo"] = -98.999938964844, ["ho"] = 0.00, ["xc"] = 191.24998474121, ["yc"] = -1024.1374511719, ["zc"] = -99.0, ["hc"] = 0.000, ["name"] = 'Taxi Garage'},
    [60] = { ["price"] = 10000, ["xe"] = 495.78540039063, ["ye"] = -1340.8732910156, ["ze"] = 29.312074661255, ["he"] = 0.00, ["xo"] = 179.07743835449, ["yo"] = -1000.2747192383, ["zo"] = -98.999900817871, ["ho"] = 0.00, ["xc"] = 177.4048614502, ["yc"] =  -999.69030761719, ["zc"] = -98.999969482422, ["hc"] = 0.000, ["name"] = 'Remorqueur Garage'},
    [61] = { ["price"] = 100000000, ["xo"] = 211.90432739258, ["yo"] = -999.05670166016, ["zo"] = -98.999908447266, ["ho"] = 0.00, ["xe"] = -1215.3857421875, ["ye"] = 342.91543579102, ["ze"] = 71.148971557617, ["he"] = 0.00, ["xc"] = 190.78186035156, ["yc"] = 1002.2977294922, ["zc"] = -98.999969482422, ["hc"] = 0.000, ["name"] = 'Garage Pro'},
    [62] = { ["price"] = 100000000, ["xo"] = 240.52366638184, ["yo"] = -1004.8325195313, ["zo"] = -98.999946594238, ["ho"] = 0.00, ["xe"] = -1371.1285400391, ["ye"] = -460.11590576172, ["ze"] = 34.477592468262, ["he"] = 0.00, ["xc"] = 231.34808349609, ["yc"] = -976.16906738281, ["zc"] = -98.999893188477, ["hc"] = 0.000, ["name"] = 'Garage Hight End'},
    [63] = { ["price"] = 100000000, ["xe"] = -1388.3294677734, ["ye"] = -585.99084472656, ["ze"] = 30.216510772705, ["he"] = 0.00, ["xo"] = -1387.6918945313, ["yo"] = -588.65740966797, ["zo"] = 30.319532394409, ["ho"] = 0.00, ["xc"] = -1381.8791503906, ["yc"] = -632.66778564453, ["zc"] = 30.819561004639, ["hc"] = 0.000, ["name"] = 'Bahama Club Entreprise (gang)'},
    [64] = { ["price"] = 100000000, ['xe'] = 11.3801612854, ['ye'] = -667.50433349609, ['ze'] = 33.44881439209, ["he"] = 0.00,['xo'] = 2.5890462398529, ['yo'] = -703.03387451172, ['zo'] = 16.13102722168, ["ho"] = 0.00,['xc'] = 252.90348815918, ['yc'] = 225.5701751709, ['zc'] = 101.87576293945, ["hc"] = 0.00,  ["name"] = 'LaGarda Dantes acces' },
    [65] = { ["price"] = 100000000, ['xe'] = 8.5025720596313, ['ye'] = -667.66088867188, ['ze'] = 33.449642181396, ["he"] = 0.00,['xo'] = -0.49346095323563, ['yo'] = -701.73095703125, ['zo'] = 16.131042480469, ["ho"] = 0.00,['xc'] = 255.2784576416, ['yc'] = 224.60527038574, ['zc'] = 101.8756942749, ["hc"] = 0.00,  ["name"] = 'LaGarda Darwish acces' },
	[66] = { ["price"] = 100000000, ["xe"] = -2290.1474609375, ["ye"] = 7998.083984375, ["ze"] = 1315.0134277344, ["he"] = 0.00, ["xo"] = -2292.4743652344, ["yo"] = 7993.9086914063, ["zo"] = 873.53247070313, ["ho"] = 0.00, ["xc"] = -344.76776123047, ["yc"] = -124.76931762695, ["zc"] = 39.009658813477, ["hc"] = 0.000, ["name"] = 'LSCustom Coffre 1/5'},
    [67] = { ["price"] = 100000000, ['xe'] = -2289.80859375, ['ye'] = 7998.001953125, ['ze'] = 1209.5228271484, ["he"] = 0.00,['xo'] = -2292.75390625, ['yo'] = 7991.6401367188, ['zo'] = 762.01226806641, ["ho"] = 0.00,['xc'] = -1141.5, ['yc'] = -2005.6994628906, ['zc'] = 13.180261611938, ["hc"] = 0.00,  ["name"] = 'LSCustom Coffre 2/5' },
    [68] = { ["price"] = 100000000, ['xe'] = -2291.2082519531, ['ye'] = 7996.046875, ['ze'] = 994.78265380859, ["he"] = 0.00,['xo'] = -2292.5600585983, ['yo'] = 7989.0771484375, ['zo'] = 645.17755126953, ["ho"] = 0.00,['xc'] = 725.61590576172, ['yc'] = -1066.7745361328, ['zc'] = 28.311010360718, ["hc"] = 0.00,  ["name"] = 'LSCustom Coffre 3/5' },
    [69] = { ["price"] = 100000000, ['xe'] = 1026.0834960938,  ['ye'] = -3016.1506347656, ['ze'] = -32.993156433105,['xo'] = 1058.7902832031, ['yo'] = -3138.4250488281, ['zo'] = -32.993156433105,['xc'] = 998.01782226563, ['yc'] = -3200.7097167969, ['zc'] = -38.993160247803, ["name"] = 'TheLost' },
    [70] = { ["price"] = 100000000, ['xe'] = 1052.6751708984, ['ye'] = -35.938674926758, ['ze'] = 59.845184326172,['xo'] = 976.87249755859, ['yo'] = -104.18993377686, ['zo'] = 59.845184326172 ,['xc'] = 976.78576660156, ['yc'] = -104.14051818848, ['zc'] = 74.845184326172,["name"] = 'asso'},
    [71] = { ["price"] = 100000000, ['xe'] = 81026.0834960938,  ['ye'] = -83016.1506347656, ['ze'] = -32.993156433105,['xo'] = 81058.7902832031, ['yo'] = -83138.4250488281, ['zo'] = -32.993156433105,['xc'] = 1044.4772949219, ['yc'] = -3194.9265136719, ['zc'] = -38.15816116333,["name"] = 'Redneck black Coffre'},
    [72] = { ["price"] = 100000000, ['xe'] = 1332.6390380859, ['ye'] = 4325.42578125, ['ze'] = 38.086376190186,['xo'] = 1087.3833007813, ['yo'] = -3099.322265625, ['zo'] = -38.99995803833 , ['xc'] = 1101.6062011719, ['yc'] = -3101.74609375, ['zc'] = -38.999965667725 ,["name"] = 'Redneck Coffre'},
    [73] = { ["price"] = 100000000, ['xe'] = 2052.6751708984, ['ye'] = -2235.938674926758, ['ze'] = 2259.845184326172,['xo'] = 22976.87249755859, ['yo'] = -2104.18993377686, ['zo'] = 2259.845184326172 ,["xc"] = -1559.2835693359, ["yc"] = -570.54168701172, ["zc"] = 108.52300262451, ["hc"] = 0.000, ["name"] = 'Bureau du Maire'},
    [73] = { ["price"] = 100000000, ['xe'] = 3052.6751708984, ['ye'] = -3235.938674926758, ['ze'] = 3259.845184326172,['xo'] = 32976.87249755859, ['yo'] = -3104.18993377686, ['zo'] = 3259.845184326172 ,['xc'] = -224.28187561035, ['yc'] = -1320.5544433594, ['zc'] = 30.890378952026,["name"] = 'benny Coffre'},
}

local agent = {
    [1] = { ["price"] = 1, ["xe"] = -862.91564941406, ["ye"] = -254.80685424805, ["ze"] = 40.038547515869, ["he"] = 0.00, ["xo"] = -1387.6918945313, ["yo"] = -588.65740966797, ["zo"] = 30.319532394409, ["ho"] = 0.00, ["xc"] = -1381.8791503906, ["yc"] = -632.66778564453, ["zc"] = 30.819561004639, ["hc"] = 0.000, ["name"] = 'Agent Imobilier'},
}

local lang = 'fr'

local txt = {
  ['fr'] = {
        ['fermermenu'] = 'Fermer le menu',
        ['sonner'] = 'Sonner à la porte',
        ['gohome'] = 'Rentrer chez soi',
        ['vendre'] = 'Revendre l\'appartement',
        ['acheter'] = 'Acheter l\'appartement',
        ['visiter'] = 'Visiter l\'appartement',
        ['menu'] = 'Appuyez sur ~g~E~s~ pour ouvrir le menu',
        ['soon'] = 'Cette fonctionnalité arrivera bientot',
        ['exit'] = 'Sortir',
        ['retirerargent'] = 'Retirer de l\'argent propre',
        ['retirersale'] = 'Retirer de l\'argent sale',
        ['deposerargent'] = 'Deposer de l\'argent propre',
        ['deposersale'] = 'Deposer de l\'argent sale'
  },

    ['en'] = {
        ['fermermenu'] = 'Close menu',
        ['sonner'] = 'Ring the doorbell',
        ['gohome'] = 'Go to home',
        ['vendre'] = 'Sell apartment',
        ['acheter'] = 'Buy apartment',
        ['visiter'] = 'Visit the apartment',
        ['menu'] = 'Press ~g~E~s~ to open menu',
        ['soon'] = 'This functionality will come soon',
        ['exit'] = 'Exit',
        ['retirerargent'] = 'Withdraw clean money',
        ['retirersale'] = 'Withdraw dirty money',
        ['deposerargent'] = 'Deposit clean money',
        ['deposersale'] = 'Deposit dirty money'
    }
}

local entrer = false
local isBuy = 0
local money = 0
local dirtymoney = 0
local depositcash = false
local depositdirtycash = false
local depositapart = ""
local target = 0
local islock = 0
local isClick = false
local freeze = false

User = {
    Spawned = false,
    Loaded = false,
    group = "0",
    permission_level = 0,
    money = 0,
    dirtymoney = 0,
    job = 0,
    subjob = 0,
    police = 0,
    enService = 0,
    nom = "",
    prenom = "",
    vehicle = "",
    identifier = nil,
    telephone = "",
    gender = ""
}

local item = {

}

local user_item = {

}

distance = 50.5999 -- distance to draw
timer = 0
current_int = 0


RegisterNetEvent("apart:islock")
AddEventHandler("apart:islock", function(lock)
  islock = lock
end)

RegisterNetEvent("apart:isBuy")
AddEventHandler("apart:isBuy", function()
  isBuy = 1
end)

RegisterNetEvent("apart:isNotBuy")
AddEventHandler("apart:isNotBuy", function()
  isBuy = 0
end)

RegisterNetEvent("apart:isMine")
AddEventHandler("apart:isMine", function()
  isBuy = 2
end)

RegisterNetEvent("apart:getCash")
AddEventHandler("apart:getCash", function(moneyparm, dirtymoneyparm)
  money = moneyparm
  dirtymoney = dirtymoneyparm
end)

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
        N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end

function SetBlipTradeImo(id, text, color, scale, x, y, z)
    local Blip = AddBlipForCoord(x, y, z)

    SetBlipSprite(Blip, id)
    SetBlipColour(Blip, color)
    SetBlipScale(Blip, scale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(Blip)
    SetBlipAsShortRange(Blip,true)
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end

function drawNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

AddEventHandler("apart:MenuInsideAppartement", function()
  VMenu.curItem = 1
    VMenu.ResetMenu(24, "", "default")
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < 1.699 then
            TriggerServerEvent("apart:getCash", interiors[i].name)
            TriggerServerEvent("apart:getAppart", interiors[i].name)
            TriggerServerEvent("apart:getlock", interiors[i].name)
      Wait(300)
            if isBuy == 2 then
                --print(money)
                --print(dirtymoney)
                        VMenu.AddFunc(24,"Vérouiller/Dévérouiller","apart:lock",{interiors[i].name},"Vérouiller/Dévérouiller")
                VMenu.AddFunc(24,txt[lang]['exit'],"apart:Exit",{},"Sortir")
            elseif islock == 0 or isBuy == 0 then
                VMenu.AddFunc(24,txt[lang]['exit'],"apart:Exit",{},"Sortir")
            end
            VMenu.AddFunc(24,txt[lang]['fermermenu'],"apart:CloseMenu",{},"Sortir")
        else
        end
    end
end)

AddEventHandler("apart:MenuCache",function()
    --TriggerEvent("vmenu:toggleMenu")
  VMenu.curItem = 1
    VMenu.ResetMenu(25, "", "default")
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xc,interiors[i].yc,interiors[i].zc, true) < 2.099 then
            TriggerServerEvent("apart:getCash", interiors[i].name)
                  TriggerServerEvent("apart:getAppart", interiors[i].name)
            Wait(750)
            if isBuy == 2 or (isBuy == 1 and User.police > 3) then
                --print(money)
                --print(dirtymoney)
                        VMenu.AddFunc(25,"Argent propre: " .. money .. " $","apart:privetimuseless",{},"Rien")
                VMenu.AddFunc(25,"Argent sale: " .. dirtymoney .." $","apart:privetimuseless",{},rien)
                VMenu.AddFunc(25,txt[lang]['deposerargent'],"apart:deposerargent",{interiors[i].name},"Déposer")
                VMenu.AddFunc(25,txt[lang]['deposersale'],"apart:deposersale",{interiors[i].name},"Déposer")
                VMenu.AddFunc(25,txt[lang]['retirerargent'],"apart:retirerargent",{interiors[i].name},"Retirer")
                VMenu.AddFunc(25,txt[lang]['retirersale'],"apart:retirersale",{interiors[i].name},"Retirer")
                VMenu.AddFunc(25,"Ajouter un item","apart:Madditem",{},"Déposer")
                VMenu.AddFunc(25,"Retirer un item","apart:Mremitem",{},"Retirer")
            end
                VMenu.AddFunc(25,"Fermer le menu","apart:CloseMenu",{},"Fermer")
        else
--          TriggerEvent("apart:CloseMenu")
        end

    end
end)

AddEventHandler("apart:Mremitem",function(target)
    VMenu.ResetMenu(25, "", "default")
    VMenu.curItem = 1
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xc,interiors[i].yc,interiors[i].zc, true) < 2.099 then
            TriggerServerEvent("apart:getitem", interiors[i].name)
              Wait(750)
                for j=1,#item do
                    if (tonumber(item[j].valeur) > 0) then
                        VMenu.AddFunc(25,tostring(item[j].libelle).." "..":".." "..tostring(item[j].valeur),"removeitem",{j,interiors[i].name,item[j].valeur},"Retirer")
                    end
                end
                  VMenu.AddFunc(25,"Retour","apart:MenuCache",{},"Retour")
            VMenu.AddFunc(25,txt[lang]['fermermenu'],"apart:CloseMenu",{},"Fermer")
        end
    end
end)

AddEventHandler("removeitem",function(target,iditem,nom,qty)
    TriggerEvent("apart:CloseMenu")
    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
    envoi = 1
    Citizen.Trace(qty)
    id = iditem
    nb = qty
    nomApart = nom
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if envoi == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				envoi = 0
			elseif UpdateOnscreenKeyboard() == 1 then
				local txt = GetOnscreenKeyboardResult()
				if (string.len(txt) > 0) and (string.match(txt, '%d+')) then -- BEAU REGEX PATTERN EN LUA PARCE QUE C'EST PAUVRE
					txt = tonumber(txt)
					if nb >= txt then
						if txt > 0 then
							remitem = txt
							envoi = 2
						else
							TriggerEvent("itinerance:notif", "~r~ Vous devez entrer un nombre positif")
							envoi = 0
							nb = 0
						end
					else
						TriggerEvent("itinerance:notif", "~r~ Il n'y as pas assez de cet item dans le coffre")
						envoi = 0
						nb = 0
					end
				else
					TriggerEvent("itinerance:notif", "~r~ Entrer un montant valide")
					envoi = 0
					nb = 0
				end
			elseif UpdateOnscreenKeyboard() == 2 then
				envoi = 0
				nb = 0
			end
		end
		if envoi == 2 then
			TriggerEvent('apart:remitem')
			envoi = 0
			nb = 0
		end
	end
end)

AddEventHandler("apart:Madditem",function()
    VMenu.ResetMenu(25, "", "default")
    VMenu.curItem = 1
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xc,interiors[i].yc,interiors[i].zc, true) < 2.099 then
            TriggerServerEvent("apart:user_getitem", interiors[i].name)
              Wait(750)
                for j=1, #item do
                    if (tonumber(item[j].valeur) > 0) then
                        VMenu.AddFunc(25,tostring(item[j].libelle).." "..":".." "..tostring(item[j].valeur),"additem",{j,interiors[i].name,item[j].valeur},"Retirer")
                    end
                end
            VMenu.AddFunc(25,"Retour","apart:MenuCache",{},"Retour")
            VMenu.AddFunc(25,txt[lang]['fermermenu'],"apart:CloseMenu",{},"Fermer")
        end
    end
end)

AddEventHandler("additem",function(target,iditem,nom,qty)
    TriggerEvent("apart:CloseMenu")
    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
    recois = 1
    Citizen.Trace(qty)
    id = iditem
    nb = qty
    nomApart = nom
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if recois == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				recois = 0
			elseif UpdateOnscreenKeyboard() == 1 then
				local txt = GetOnscreenKeyboardResult()
				if (string.len(txt) > 0) and (string.match(txt, '%d+')) then -- BEAU REGEX PATTERN EN LUA PARCE QUE C'EST PAUVRE
					txt = tonumber(txt)
					if nb >= txt then
						if txt > 0 then
							additem = txt
							recois = 2
						else
							TriggerEvent("itinerance:notif", "~r~ Vous devez entrer un nombre positif")
							recois = 0
							nb = 0
						end
					else
						TriggerEvent("itinerance:notif", "~r~ Vous n'avez pas de cet item sur vous")
						recois = 0
						nb = 0
					end
				else
					TriggerEvent("itinerance:notif", "~r~ Entrer un nombre valide")
					recois = 0
					nb = 0
				end
			elseif UpdateOnscreenKeyboard() == 2 then
				recois = 0
				nb = 0
			end
		end
		if recois == 2 then
			TriggerEvent('apart:additem')
			recois = 0
			nb = 0
		end
	end
end)

AddEventHandler("apart:additem",function()
  TriggerServerEvent("apart:additem_s",id,nomApart,additem)
  --TriggerEvent("player:receiveItem", tonumber(id), 1)

  Wait(100)
  item = tonumber(id)
  TriggerEvent("player:looseItem", tonumber(id), additem)
  waittemp =  waittemp + (additem*100)
    TriggerEvent("itinerance:notif","Vous devez attendre "..(waittemp/100).." secondes avant de pouvoir bouger.")
  while (waittemp>0) do
      DisableAllControlActions(0)
      waittemp = waittemp-1
      Wait(0)
  end
end)

AddEventHandler("apart:remitem",function()
  --TriggerEvent("player:receiveItem", tonumber(id), 1)
  Wait(100)
  Citizen.Trace(id)
  if (ITEMS[tonumber(id)].quantity + remitem <=60) then
  TriggerServerEvent("apart:remitem_s",id,nomApart,remitem)
  TriggerEvent("inventory:giveItem_f", tonumber(id), remitem)
  waittemp = waittemp + (remitem*100)
  TriggerEvent("itinerance:notif","Vous devez attendre "..(waittemp/100).." secondes avant de pouvoir bouger.")
  while (waittemp>0) do
      DisableAllControlActions(0)
      waittemp = waittemp-1
      Wait(0)
  end
  else
      TriggerEvent("itinerance:notif", "~r~Vous n'avez pas assez d'espace sur vous")
  end
end)

AddEventHandler("apart:lock",function(target,nom)
    TriggerServerEvent("apart:lock_s", nom)
--    TriggerEvent("apart:CloseMenu")
end)

AddEventHandler("apart:privetimuseless",function()
end)

AddEventHandler("apart:deposerargent",function(target,apart)
    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
    while UpdateOnscreenKeyboard() == 0 do
        DisableAllControlActions(0)
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        local txt = GetOnscreenKeyboardResult()
        if (string.len(txt) > 0) then
            TriggerServerEvent("apart:depositcash", txt, apart)
            Wait(800)
           TriggerEvent("apart:MenuCache")
        end
    end
end)

AddEventHandler("apart:deposersale",function(target,apart)
    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
    while UpdateOnscreenKeyboard() == 0 do
        DisableAllControlActions(0)
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        local txt = GetOnscreenKeyboardResult()
        if (string.len(txt) > 0) then
            TriggerServerEvent("apart:depositdirtycash", txt, apart)
            Wait(800)
            TriggerEvent("apart:MenuCache")
        end
    end
end)

AddEventHandler("apart:retirerargent",function(target,apart)
    --print("coucou")
    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
    while UpdateOnscreenKeyboard() == 0 do
        DisableAllControlActions(0)
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        local txt = GetOnscreenKeyboardResult()
        if (string.len(txt) > 0) then
            --print("ok c bon")
            TriggerServerEvent("apart:takecash", txt, apart)
      Wait(800)
      TriggerEvent("apart:MenuCache")
        end
    end
end)

AddEventHandler("apart:retirersale",function(target,apart)
    DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
    while UpdateOnscreenKeyboard() == 0 do
        DisableAllControlActions(0)
        Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
        local txt = GetOnscreenKeyboardResult()
        if (string.len(txt) > 0) then
            TriggerServerEvent("apart:takedirtycash", txt, apart)
      Wait(800)
      TriggerEvent("apart:MenuCache")
        end
    end
end)

AddEventHandler("apart:Exit",function()
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < 1.599 then
            if timer == 0 then
                TriggerEvent("apart:CloseMenu")
                DoScreenFadeOut(1000)
                while IsScreenFadingOut() do Citizen.Wait(0) end
                NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
                Wait(1000)
                SetEntityCoords(GetPlayerPed(-1), interiors[i].xe,interiors[i].ye,interiors[i].ze)
                SetEntityHeading(GetPlayerPed(-1), interiors[i].ho)
                NetworkFadeInEntity(GetPlayerPed(-1), 0)
                Wait(1000)
                current_int = i
                timer = 5
                SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
                DoScreenFadeIn(1000)
                --Menu.hidden = true
                while IsScreenFadingIn() do Citizen.Wait(0) end
            end
        end
    end
end)

AddEventHandler("apart:EExit",function()
    for i=1, #extrat do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), extrat[i].xo,extrat[i].yo,extrat[i].zo, true) < 1.599 then
            if timer == 0 then
                TriggerEvent("apart:CloseMenu")
                DoScreenFadeOut(1000)
                while IsScreenFadingOut() do Citizen.Wait(0) end
                NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
                Wait(1000)
                SetEntityCoords(GetPlayerPed(-1), extrat[i].xe,extrat[i].ye,extrat[i].ze)
                SetEntityHeading(GetPlayerPed(-1), extrat[i].ho)
                NetworkFadeInEntity(GetPlayerPed(-1), 0)
                Wait(1000)
                current_int = i
                timer = 5
                SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
                DoScreenFadeIn(1000)
                Menu.hidden = true
                while IsScreenFadingIn() do Citizen.Wait(0) end
            end
        end
    end
end)

AddEventHandler("apart:MenuAppartement",function()
  VMenu.curItem = 1
    VMenu.ResetMenu(23, "", "default")
--  Menu.hidden = false
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
            TriggerServerEvent("apart:getAppart", interiors[i].name)
            TriggerServerEvent("apart:getlock", interiors[i].name)
                  Wait(1000)
            if isBuy == 1 and islock == 0 then
                VMenu.AddFunc(23,'entrer',"apart:Visiter",{},"Visiter")
            elseif isBuy == 1 and islock == 1 then
                VMenu.AddFunc(23,'Apartement Vérouiller',"apart:CloseMenu",{},"Apartement")
            elseif isBuy == 2 then
                VMenu.AddFunc(23,txt[lang]['gohome'],"apart:Visiter",{},"Visiter")
                VMenu.AddFunc(23,txt[lang]['vendre'],"apart:Vendre",{},"Visiter")
                VMenu.AddFunc(23,"Vérouiller/Dévérouiller","apart:lock",{interiors[i].name},"Vérouiller/Dévérouiller")
            else
                    VMenu.AddSep(23, "Prix : "..interiors[i].price)
                VMenu.AddFunc(23,txt[lang]['acheter'],"apart:Acheter",{},"Visiter")
                VMenu.AddFunc(23,txt[lang]['visiter'],"apart:Visiter",{},"Acheter")
            end
            VMenu.AddFunc(23,txt[lang]['fermermenu'],"apart:CloseMenu",{},"Fermer")
        else
            --CloseMenu()
      --ClearMenu()
        end
    end

end)

function EMenuAppartement(i)
  VMenu.curItem = 1
    VMenu.ResetMenu(23, "", "default")
--  Menu.hidden = false
    for i=1, #extrat do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), extrat[i].xe,extrat[i].ye,extrat[i].ze, true) < 1.599 then
            TriggerServerEvent("apart:getAppart", extrat[i].name)
            --Wait(1000)
            TriggerServerEvent("apart:getlock", extrat[i].name)
            Citizen.Trace(islock)
            Citizen.Trace(islock)
            Citizen.Trace(islock)
            if isBuy == 1 and islock == 0 then
                VMenu.AddFunc(23,'entrer',"apart:Visiter",{},"Entrer")
            elseif isBuy == 1 and islock == 1 then
                VMenu.AddFunc(23,'Apartement Vérouiller',"CloseMenu",{},"")
            elseif isBuy == 2 then
                VMenu.AddFunc(23,txt[lang]['gohome'],"apart:EVisiter",{},"Entrer")
                VMenu.AddFunc(23,txt[lang]['vendre'],"apartVendre",{},"Vendre")
                VMenu.AddFunc(23,"Vérouiller/Dévérouiller","apart:lock",{extrat[i].name},"Vérouiller/Dévérouiller")
            else
                VMenu.AddSep(23, "Prix : "..extrat[i].price)
                VMenu.AddFunc(23,txt[lang]['acheter'],"apart:Acheter",{},"Acheter")
                VMenu.AddFunc(23,txt[lang]['visiter'],"EVisiter",{i},"Visiter")
            end
            VMenu.AddFunc(23,txt[lang]['fermermenu'],"apart:CloseMenu",{},"Fermer")
        else
        end
    end

end

AddEventHandler("apart:CloseMenu",function()
    Citizen.Trace("fermer menu")
    TriggerEvent("vmenu:toggleMenu")
    freeze = not freeze
end)

AddEventHandler("apart:entrer",function()
    TriggerServerEvent("apart:sonner", target)
end)

AddEventHandler("apart:Vendre",function()
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
            TriggerServerEvent("apart:sellAppart", interiors[i].name, interiors[i].price)
            TriggerEvent("apart:CloseMenu")
        end
    end
end)

AddEventHandler("apart:Acheter",function()
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
            TriggerServerEvent("apart:buyAppart", interiors[i].name, interiors[i].price)
            TriggerEvent("apart:CloseMenu")
        end
    end
end)

AddEventHandler("apart:Visiter",function(target,i)
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
            if timer == 0 then
                TriggerEvent("apart:CloseMenu")
                DoScreenFadeOut(1000)
                while IsScreenFadingOut() do Citizen.Wait(0) end
                NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
                Wait(1000)
                SetEntityCoords(GetPlayerPed(-1), interiors[i].xo,interiors[i].yo,interiors[i].zo)
                SetEntityHeading(GetPlayerPed(-1), interiors[i].ho)
                NetworkFadeInEntity(GetPlayerPed(-1), 0)
                Wait(1000)
                current_int = i
                timer = 5
                SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
                DoScreenFadeIn(1000)
                while IsScreenFadingIn() do Citizen.Wait(0) end
            end
        end
    end
end)

Citizen.CreateThread(function()
  TriggerServerEvent("apart:getinvitem")
    while true do
        Citizen.Wait(0)
            for i=1, #interiors do
                if not IsEntityDead(PlayerPedId()) then
                    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < distance then
                        DrawMarker(1,interiors[i].xe,interiors[i].ye,interiors[i].ze-1.0001, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
                        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
                                DrawAdvancedText(0.707, 0.77, 0.005, 0.0028, 1.89, "~b~"..interiors[i].name, 255, 255, 255, 255, 1, 1)
                            if IsControlJustPressed(1, 86) then
                            end
                        else
                        end
                    end
                end
            end
                for i=1, #interiors do
                    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < distance then
                        DrawMarker(1,interiors[i].xo,interiors[i].yo,interiors[i].zo-1.0001, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
                        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < 1.699 then
                            DrawAdvancedText(0.707, 0.77, 0.005, 0.0028, 1.89, "~b~"..interiors[i].name, 255, 255, 255, 255, 1, 1)
                            if IsControlJustPressed(1, 86) then
                            end
                            else
                        end
                    end
                end
                for i=1, #interiors do
                    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xc,interiors[i].yc,interiors[i].zc, true) < distance then
                        DrawMarker(1,interiors[i].xc,interiors[i].yc,interiors[i].zc-1.0001, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
                        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xc,interiors[i].yc,interiors[i].zc, true) < 2.099 then
                            if IsControlJustPressed(1, 86) then
                            end

                        else
                        end
                    end
                end
             if not IsEntityDead(PlayerPedId()) then
                    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), agent[1].xe,agent[1].ye,agent[1].ze, true) < distance then
                        DrawMarker(1,agent[1].xe,agent[1].ye,agent[1].ze-1.0001, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
                        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), agent[1].xe,agent[1].ye,agent[1].ze, true) < 1.599 then
                            if IsControlJustPressed(1, 86) then
                            end
                        end
                    end
                end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        if timer > 0 then
            timer=timer-1
            if timer == 0 then current_int = 0 end
        end
    end
end)

AddEventHandler("playerSpawned", function()
    Citizen.CreateThread(function()
        TriggerServerEvent("apart:getown")
    SetBlipTradeImo(375,"Agence immobilière",2, 0.9,agent[1].xe,agent[1].ye,agent[1].ze)
    end)
end)

AddEventHandler("apart:MenuAgent",function()
    VMenu.ResetMenu(26, "", "default")
    for i=1, #agent do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), agent[i].xe,agent[i].ye,agent[i].ze, true) < 1.599 then
            if (isClick == false) then
                VMenu.AddFunc(26,'Voir les maisons à vendre',"apart:GetOwned",{},"Voir")
            end
                VMenu.AddFunc(26,txt[lang]['fermermenu'],"apart:CloseMenu",{},"Fermer")
        else
        end

    end
end)

AddEventHandler("apart:GetOwned", function()
    TriggerServerEvent("apart:getowned")
    isClick = true
end)

RegisterNetEvent("apart:getowned_f")
AddEventHandler("apart:getowned_f", function(owned)
    local nom
    local vendu = false
  for i=1,28 do
    vendu = false
    nom = interiors[i].name
    for _, maison in pairs(owned) do
        Citizen.Trace(maison.name)
        if (nom == maison.name) then
            vendu = true
        end
    end
    if(vendu == false) then
    SetBlipTradeImo(375,"Maison à vendre",4, 0.9,interiors[i].xe,interiors[i].ye,interiors[i].ze)
    end
    end
    TriggerEvent("apart:CloseMenu")
end)

RegisterNetEvent("apart:getown_f")
AddEventHandler("apart:getown_f", function(own)
    local nom
  for _, aps in pairs(interiors) do
    nom = aps.name
    for _, maison in pairs(own) do
        if nom == maison.name then
            SetBlipTradeImo(375,"Maison",3, 0.9,aps.xe,aps.ye,aps.ze)
        end
    end
    end
end)

function SetBlipTradeImo(id, text, color, scale, x, y, z)
    local Blip = AddBlipForCoord(x, y, z)

    SetBlipSprite(Blip, id)
    SetBlipColour(Blip, color)
    SetBlipScale(Blip, scale)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(Blip)
    SetBlipAsShortRange(Blip,true)
end

RegisterNetEvent("vmenu:setUser")
AddEventHandler("vmenu:setUser", function(infos)
    for k,v in pairs(infos) do
        User[k] = v
    end
end)

RegisterNetEvent("apart:getitem_f")
AddEventHandler("apart:getitem_f", function(info)
  item = info
end)

RegisterNetEvent("apart:user_getitem_f")
AddEventHandler("apart:user_getitem_f", function(info)
  item = info
end)
