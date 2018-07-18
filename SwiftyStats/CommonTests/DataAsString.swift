//
//  Created by VT on 16.07.18.
//  Copyright © 2018 Volker Thieme. All rights reserved.
//

import Foundation

let doubleDataString = "18,15,18,16,17,15,14,14,14,15,15,14,15,14,22,18,21,21,10,10,11,9,28,25,19,16,17,19,18,14,14,14,14,12,13,13,18,22,19,18,23,26,25,20,21,13,14,15,14,17,11,13,12,13,15,13,13,14,22,28,13,14,13,14,15,12,13,13,14,13,12,13,18,16,18,18,23,11,12,13,12,18,21,19,21,15,16,15,11,20,21,19,15,26,25,16,16,18,16,13,14,14,14,28,19,18,15,15,16,15,16,14,17,16,15,18,21,20,13,23,20,23,18,19,25,26,18,16,16,15,22,22,24,23,29,25,20,18,19,18,27,13,17,13,13,13,30,26,18,17,16,15,18,21,19,19,16,16,16,16,25,26,31,34,36,20,19,20,19,21,20,25,21,19,21,21,19,18,19,18,18,18,30,31,23,24,22,20,22,20,21,17,18,17,18,17,16,19,19,36,27,23,24,34,35,28,29,27,34,32,28,26,24,19,28,24,27,27,26,24,30,39,35,34,30,22,27,20,18,28,27,34,31,29,27,24,23,38,36,25,38,26,22,36,27,27,32,28"
let gearDataString = "gear batch 1,gear batch 2,gear batch 3,gear batch 4,gear batch 5,gear batch 6,gear batch 7,gear batch 8,gear batch 9,gear batch 10\n1.006,0.998,0.991,1.005,0.998,1.009,0.99,0.998,1.002,0.991\n0.996,1.006,0.987,1.002,0.998,1.013,1.004,1.0,0.998,0.995\n0.998,1.0,0.997,0.994,0.982,1.009,0.996,1.006,0.996,0.984\n1.0,1.002,0.999,1.0,0.99,0.997,1.001,1.0,0.995,0.994\n0.992,0.997,0.995,0.995,1.002,0.988,0.998,1.002,0.996,0.997\n0.993,0.998,0.994,0.994,0.984,1.002,1.0,0.996,1.004,0.997\n1.002,0.996,1.0,0.998,0.996,0.995,1.018,0.998,1.004,0.991\n0.999,1.0,0.999,0.996,0.993,0.998,1.01,0.996,0.998,0.998\n0.994,1.006,0.996,1.002,0.98,0.981,0.996,1.002,0.999,1.004\n1.0,0.988,0.996,0.996,0.996,0.996,1.002,1.006,0.991,0.997"
let intDataString = "18,15,18,16,17,15,14,14,14,15,15,14,15,14,22,18,21,21,10,10,11,9,28,25,19,16,17,19,18,14,14,14,14,12,13,13,18,22,19,18,23,26,25,20,21,13,14,15,14,17,11,13,12,13,15,13,13,14,22,28,13,14,13,14,15,12,13,13,14,13,12,13,18,16,18,18,23,11,12,13,12,18,21,19,21,15,16,15,11,20,21,19,15,26,25,16,16,18,16,13,14,14,14,28,19,18,15,15,16,15,16,14,17,16,15,18,21,20,13,23,20,23,18,19,25,26,18,16,16,15,22,22,24,23,29,25,20,18,19,18,27,13,17,13,13,13,30,26,18,17,16,15,18,21,19,19,16,16,16,16,25,26,31,34,36,20,19,20,19,21,20,25,21,19,21,21,19,18,19,18,18,18,30,31,23,24,22,20,22,20,21,17,18,17,18,17,16,19,19,36,27,23,24,34,35,28,29,27,34,32,28,26,24,19,28,24,27,27,26,24,30,39,35,34,30,22,27,20,18,28,27,34,31,29,27,24,23,38,36,25,38,26,22,36,27,27,32,28"
let intDataWithOutliersString = "1,1,1,1,18,15,18,16,17,15,14,14,14,15,15,14,15,14,22,18,21,21,10,10,11,9,28,25,19,16,17,19,18,14,14,14,14,12,13,13,18,22,19,18,23,26,25,20,21,13,14,15,14,17,11,13,12,13,15,13,13,14,22,28,13,14,13,14,15,12,13,13,14,13,12,13,18,16,18,18,23,11,12,13,12,18,21,19,21,15,16,15,11,20,21,19,15,26,25,16,16,18,16,13,14,14,14,28,19,18,15,15,16,15,16,14,17,16,15,18,21,20,13,23,20,23,18,19,25,26,18,16,16,15,22,22,24,23,29,25,20,18,19,18,27,13,17,13,13,13,30,26,18,17,16,15,18,21,19,19,16,16,16,16,25,26,31,34,36,20,19,20,19,21,20,25,21,19,21,21,19,18,19,18,18,18,30,31,23,24,22,20,22,20,21,17,18,17,18,17,16,19,19,36,27,23,24,34,35,28,29,27,34,32,28,26,24,19,28,24,27,27,26,24,30,39,35,34,30,22,27,20,18,28,27,34,31,29,27,24,23,38,36,25,38,26,22,36,27,27,32,28,300,200,100,100,101,200,100,100,101,200,100,100,101"
let largeNormal_01String = "1.03398,1.02907,1.89091,1.05691,1.53331,0.138708,2.64012,0.575424,2.12704,2.76479,-0.00808806,1.25901,2.12382,0.115192,1.63334,2.04474,2.72388,2.61086,0.636765,-1.57473,0.668471,1.87384,0.738741,1.96407,0.785082,2.08328,2.26569,1.37253,0.909751,-0.255069,1.22634,0.995874,-0.382221,0.83355,0.943538,1.10069,1.09211,1.05761,0.10993,1.67009,-0.563857,1.57467,1.40207,-0.790464,1.69174,2.32841,0.327341,-0.0441697,1.551,1.91453,2.32367,0.802842,1.08387,1.24152,-0.659051,0.736795,-0.116101,2.64496,-1.92343,1.45521,1.61117,1.57311,2.58572,2.60608,1.57207,1.45962,1.51718,2.12449,0.55714,0.336948,-0.487086,1.31389,-0.204609,-0.258479,2.42975,0.881557,0.484781,0.419696,1.84315,1.89565,0.725379,-0.254302,1.45549,1.67178,0.969714,1.57881,-0.292771,0.958451,1.38345,0.275436,-0.375468,0.824293,1.72822,0.918168,-0.162257,0.697851,1.00543,-1.51075,0.776057,0.328458,2.11776,1.02412,0.853664,2.78073,-0.00684096,0.199386,0.681156,1.52281,1.84362,-0.421071,1.42009,2.49019,0.212107,2.24331,-0.765446,0.941818,-0.690907,1.14914,2.15013,2.52659,1.1707,0.252031,0.848943,1.00387,0.831639,1.70293,0.0598242,-0.567302,1.3878,0.770642,3.20752,0.168064,2.49843,1.52893,-0.90884,0.328555,0.209545,0.809388,-0.535249,0.0858744,2.57437,1.29968,-0.086418,0.100508,0.658111,3.16459,1.14494,-0.856149,0.547593,3.07488,0.0330356,-0.320712,1.78431,1.16593,2.80743,1.48404,2.42092,1.15282,1.95728,-0.350343,1.91007,1.01903,-0.687531,0.825871,1.04857,1.41065,1.01104,1.54712,0.285139,-0.569066,1.03988,1.15858,0.334033,0.723766,1.2209,1.33567,0.145698,3.03047,1.22711,-1.12798,-0.993708,0.999325,1.29261,1.57305,2.19461,2.44093,1.38869,1.52933,2.42893,0.736108,-0.713063,1.92185,1.41999,1.75415,-0.266972,-2.31364,1.96645,0.692998,0.739096,-0.818476,2.00666,1.97306,2.09818,2.31234,1.26011,1.52989,0.424013,2.10504,2.77792,1.0783,1.58546,1.42817,1.61526,2.92274,0.704638,0.0445511,2.38802,1.31656,1.89644,0.984975,1.79,2.34963,1.20796,0.877459,0.462542,1.05124,1.59981,0.450952,0.189094,0.763291,0.899624,2.27918,1.35381,0.262524,0.247742,-1.45129,1.70773,1.06936,1.52437,1.94822,0.978391,2.2865,0.255839,1.53163,1.17745,0.149108,1.30992,1.07836,1.29244,0.095737,0.230959,0.928342,-0.574922,0.798393,0.255542,1.54781,0.296715,0.648125,1.09491,1.37494,1.02079,0.383349,0.517724,1.41891,1.51237,1.35373,0.633602,0.0521301,1.94085,2.09884,1.24381,1.39779,0.276313,0.282058,0.936561,1.87121,0.480534,-0.0721345,0.420381,0.33153,1.79626,2.59253,0.377083,0.832491,-0.311481,-0.801849,1.1859,2.3478,-0.958105,3.08525,0.116932,1.67777,1.57948,0.0959841,-0.301447,-1.05725,-0.348582,0.706497,0.246858,-0.240046,0.581058,0.617328,1.60431,0.0206846,-0.507327,-1.36358,0.26025,0.292601,0.278203,0.469255,-0.0615205,0.331386,1.63867,2.60499,-0.116004,1.58302,1.27471,2.15361,0.198465,1.0289,0.948876,2.50863,1.21177,0.791375,-0.352737,1.67666,1.96209,1.48404,-0.164225,2.04682,0.546782,2.01991,1.15718,1.69163,0.86215,2.30668,2.45717,1.66913,1.59434,0.902807,1.65625,-0.0127312,-1.02184,0.0914658,0.715924,1.74487,0.457161,1.54908,3.26768,1.46784,1.53159,0.571759,0.373675,0.830181,0.413044,0.586122,0.0859953,2.83535,1.65746,0.423123,0.156768,1.84446,0.523211,-0.0355833,1.14359,1.98569,0.175955,1.81584,-0.385114,2.62132,0.996053,-0.650949,0.574774,0.534391,1.87231,0.576442,0.701821,1.11911,1.49139,2.04783,0.52406,-0.143772,2.0612,2.50142,2.32002,2.01604,0.364769,1.9818,0.991166,1.3348,1.13322,1.64634,2.13113,0.943915,1.19094,1.93711,-0.992511,0.137675,3.36245,0.1141,1.69128,-0.693845,1.52129,2.95724,0.800206,0.830423,0.706444,2.02569,0.893088,1.28148,0.631596,0.299681,0.151011,0.199375,1.10259,-0.382366,2.29144,0.307991,0.619682,0.502138,2.56217,0.88917,2.17976,2.60075,-0.653032,3.82489,2.92588,-1.28572,2.12035,-0.144735,1.83386,0.919673,-0.793067,-0.415026,-0.622371,-0.621485,-0.30011,1.17757,3.3353,0.290259,2.23359,0.983465,1.16206,-0.588986,0.573038,1.49267,1.56036,0.305102,2.50763,0.562147,3.63269,1.75445,1.38275,1.00414,3.09134,1.61377,1.95946,1.48207,0.479134,1.40845,0.870276,1.23733,1.45042,-0.0312419,-0.371545,0.686624,0.0655019,0.311427,-0.242966,1.39439,0.543361,1.23577,1.7614,1.15224,-0.273266,0.493059,1.9401,0.739855,1.47807,2.23956,-0.0894201,0.456342,1.08232,2.35989,-0.717728,1.18917,1.2769,1.59959,2.37236,-0.129975,1.70992,0.978889,2.09926,2.91338,1.60409,2.61361,0.660031,-0.335516,1.21387,1.57011,1.83504,1.73263,1.26917,2.44368,1.28807,0.137281,1.08813,-0.472111,0.669671,-0.42317,1.97046,0.485876,-0.719997,1.56356,-0.459376,1.24079,0.735774,0.5567,0.440241,2.00114,-0.798729,-0.0326587,-0.766087,0.726975,1.75332,-0.776518,-1.39677,0.38824,0.341537,-0.439895,3.0991,0.021065,0.880775,1.36811,2.31908,2.24641,2.69842,1.47778,1.54437,1.41984,1.44097,-0.961668,1.09666,1.47811,0.24358,0.140754,0.455897,1.74221,2.17026,1.73565,0.91414,2.22554,0.0993487,-0.650202,1.09183,0.237382,0.807344,0.688169,-0.359032,1.36552,-0.658186,0.247161,2.3499,1.77711,0.394909,1.98905,-1.52867,1.44181,1.36429,2.28973,-0.199685,0.686161,0.741591,1.06341,1.51479,-0.591353,1.80178,-0.732385,1.40611,2.04363,0.219086,1.79687,0.473906,-0.0725359,1.6394,2.33992,-0.0916051,0.865998,-0.192528,1.95897,2.31733,1.71065,-0.785344,0.783028,1.93322,0.0967893,-0.555188,2.03016,1.51575,1.3744,-0.534166,0.834172,0.413165,1.21434,0.884398,1.17988,0.325083,0.107067,0.443469,2.43383,0.314261,-0.267541,1.75152,0.175176,1.19817,3.08798,1.28332,0.22463,1.21191,2.17739,0.625443,1.31257,0.133787,2.27534,0.830739,-1.24382,1.26668,0.782775,-0.72753,0.155408,0.442497,0.710737,0.499932,0.239088,1.12994,0.398043,-0.411763,-0.0077218,0.594627,2.34149,1.27828,2.12638,2.23112,0.0615857,0.31431,-0.518192,0.635862,0.955717,0.50774,0.355178,1.4628,0.587875,0.344216,-1.91252,1.23404,0.663901,0.874879,1.42807,0.877448,0.208595,0.254522,2.45869,1.29981,2.02425,0.789159,-0.0759223,0.792581,0.0650586,1.45085,0.422769,-0.117523,-0.670426,0.426123,0.128104,0.427207,-0.0680287,0.725913,1.49317,0.71027,0.863789,1.31213,0.777674,0.302307,1.88261,0.908344,1.25155,1.121,0.545707,-0.601534,-0.235852,1.41538,0.978604,1.4723,0.66972,0.604165,1.04035,0.63497,0.0219992,-0.47113,1.32891,2.27351,1.60838,0.924099,0.419704,-0.775672,0.499063,1.86188,1.15406,0.00322269,2.3521,0.43738,-0.180525,0.377996,0.919241,1.20094,1.32985,0.629172,1.08523,1.96055,1.41983,0.455367,2.02639,-0.927135,3.44602,2.18615,-0.220581,-0.539754,1.08449,-0.0415705,1.25392,0.0479648,0.159437,-0.768711,1.64541,1.64113,0.925337,0.0688039,1.72611,0.389286,-0.669548,-0.864107,-0.176928,1.53756,-0.113909,0.663254,0.885501,2.86331,1.11877,1.45949,0.900859,-0.117863,0.0979019,1.05125,1.34497,1.14583,0.490133,0.588297,1.2419,0.860272,2.55345,2.17878,0.160987,-0.509347,0.373397,0.624648,0.253524,1.66873,-0.57992,2.07406,-0.893987,0.472305,-0.304437,2.70951,0.145313,2.5892,-0.885497,2.29703,2.12374,0.0215408,1.37621,2.34346,1.02654,1.59895,-0.178735,2.01901,1.89951,1.15861,1.12945,1.69506,1.05553,0.519823,-1.18802,0.101215,0.908121,2.08881,-0.343063,1.0273,2.41161,2.73823,0.721541,-0.014482,1.59821,0.575825,0.431878,1.62084,-0.435741,2.05749,1.05976,0.721852,0.964904,0.843564,1.69901,-0.140023,2.04418,1.59014,1.1615,-0.0640976,1.90673,-0.503734,1.48832,0.974514,-2.16605,1.12048,0.903921,-0.917096,-1.76443,0.242252,1.257,1.25785,1.16885,1.39589,1.19786,0.475103,-0.379855,2.62938,-0.434992,2.22033,1.41114,0.970912,1.11282,0.694739,1.6705,1.31926,2.09922,1.4361,0.620814,1.18802,1.84893,0.967705,2.60106,0.674681,0.474767,1.75395,1.48866,1.0397,1.77516,2.01222,1.37994,0.563417,1.62363,1.85976,0.456349,0.903735,0.025329,2.3353,0.34291,1.4489,2.82738,0.648965,1.28851,-0.125761,0.44683,0.822331,1.75266,1.23605,3.33631,2.59079,0.626602,1.65907,0.796434,0.904642,0.790373,0.519196,-0.63095,1.63456,1.37535,0.318237,0.134563,1.4252,1.72094,0.880828,0.0701085,-1.3953,-0.401746,1.55346,2.23636,1.75291,1.27968,1.06681,1.1159,0.170382,-1.40868,2.28142,0.448946,-0.00560597,0.472154,0.678248,2.67435,0.0586793,2.66476,1.44571,0.896296,-1.32285,2.01464,1.63466,0.908099,2.75193,3.12759,1.22455,-0.21024,0.771196,0.887388,0.899607,1.10593,0.770447,0.775698,2.52012,3.00424,1.282,1.7672,2.29743,1.29547,1.74636,1.28834,1.00355,0.905606,-0.564601,0.477923,0.74861,0.0506466,2.12494,2.07459,0.60097,0.410948,0.923749,0.391753,0.818469,2.93458,1.02755,2.44511,-0.156556,2.63402,-0.079371,1.64143,1.20625,0.455923,2.86014,1.4282,0.160815,2.38931,1.61023,1.35913,-0.316949,1.22266,2.16264,1.12636,2.12915,-0.408863,-0.134769,3.10407,0.125431,0.600709,1.00451,1.13195,0.411645,0.71835,-0.60009,1.59081,2.2616,0.193173,0.413091,1.13567,1.80352,0.952842,0.674623,0.571664,1.77932,1.04041,1.53649,0.48585,-0.824426,0.721162,-0.163909,2.91571,1.17152,0.568205,0.908299,1.78084,2.44741,-0.670554"

let largeNormal_02String = "1.29352,0.296923,0.567158,1.21674,0.315827,1.07546,1.86747,0.678454,1.073,2.44435,2.4994,1.23634,0.12146,1.69482,0.996471,1.22941,1.28405,0.892011,0.84135,1.72734,0.94554,1.65567,2.27018,2.33472,0.797918,-1.0476,1.07761,-0.0540795,-0.033205,1.22875,2.31486,1.71312,1.13159,2.04322,1.3359,1.95714,0.611067,2.36751,0.750005,2.34859,0.20535,1.44273,0.00436368,0.738809,1.18912,1.13036,1.63158,1.48334,1.64381,0.635851,0.874176,0.456573,0.602743,-0.800713,0.657432,1.55853,1.7623,3.16844,0.697935,0.687661,1.39581,0.964998,0.403429,1.04006,1.98814,1.55443,0.156435,0.568076,1.41663,1.67554,0.727939,3.30731,1.14666,1.98619,1.83107,-0.523096,0.0213383,1.06891,1.82186,0.909279,2.45112,0.870309,0.0599423,2.09108,1.17161,1.07423,1.26665,1.14889,1.20538,2.05465,-0.237049,2.1752,0.681752,1.17232,1.36888,-0.111957,-2.06017,1.55435,2.64941,0.610102,2.17777,0.732942,1.56063,2.54961,1.31736,0.737702,1.44276,2.34321,2.87769,0.350628,-0.189355,0.978305,0.391039,1.68665,1.19605,1.90897,2.89177,1.42419,1.08033,0.125583,-0.135161,-0.283533,-0.517663,0.0287489,0.506444,1.55925,0.673781,-0.278478,0.366178,1.50909,0.595438,-0.611595,2.18165,0.372007,-0.832024,0.541728,1.41447,1.52818,3.50788,0.171442,2.59621,1.06087,2.68952,1.18579,1.41408,-0.05884,3.62958,1.06284,2.01154,-0.365909,2.46045,0.111765,0.783973,1.06648,-0.551038,0.772176,0.631828,2.52685,-0.601959,1.11587,0.565044,-0.221861,0.804211,0.671131,0.128396,-0.638492,2.12099,1.61182,1.36776,3.33644,0.237526,1.96767,0.960423,1.59034,2.64472,1.59758,1.43552,-0.569791,1.65449,-0.157458,0.744025,2.56486,1.58636,0.688142,0.181255,1.11774,0.602253,1.15781,1.63487,0.415358,2.80991,0.183445,2.43044,2.24664,0.256017,0.857474,0.97983,0.822576,1.17238,1.44335,-0.209919,1.05585,2.11591,1.29543,1.39367,1.88142,1.44054,1.38837,-0.869045,2.99166,1.08791,0.042685,1.91213,0.548734,0.827729,0.334173,1.87847,-0.0314606,-0.725227,0.155761,2.02816,2.28434,1.30564,0.899905,3.89729,0.982617,0.766724,0.559513,0.463798,1.7993,0.341208,0.00726948,1.52315,0.567167,-0.231299,3.26271,0.983944,2.78399,2.26202,1.79436,0.500721,0.789635,0.271743,0.99839,0.576113,1.07374,1.21581,2.54045,3.35263,1.09014,0.800166,0.712179,2.0048,2.21989,2.05378,1.11664,2.37205,1.45453,0.164107,2.34317,-0.335835,-0.48099,1.87968,0.528279,2.15787,0.951539,1.98772,1.12474,2.01286,0.794536,0.00250331,0.19309,1.5996,2.23982,1.09306,3.11335,1.54658,0.760085,1.03317,0.675532,1.28598,2.61772,0.319157,2.19488,0.249118,2.9027,0.0723628,1.73536,-0.628944,0.157904,2.35088,0.66876,1.62534,-1.76921,-0.325094,1.23972,0.261265,1.11074,3.02409,0.651075,2.01246,0.0863266,1.67807,-0.245835,1.74151,-0.737471,3.20887,0.794021,0.998897,1.15448,1.43081,0.257193,0.216175,2.1329,2.47839,1.58765,0.839301,2.0484,1.21323,1.12119,0.459421,2.31891,1.92023,0.202045,0.788931,0.208851,0.626535,-0.382246,-0.93018,2.86491,1.15225,-0.500601,-0.698563,2.86301,1.79991,1.53858,3.06345,1.77383,1.11116,1.6279,-0.488493,0.26734,2.63104,3.9327,1.43296,0.69587,0.402266,0.779594,0.297417,1.00339,2.1287,1.33507,1.54722,1.00271,0.449676,1.61267,2.98571,2.03853,0.599628,0.543432,2.4959,1.14624,1.45682,1.20349,2.11216,2.07257,0.275809,1.62187,1.60278,-0.0196177,1.98097,0.642194,0.885554,1.43377,2.47488,1.23722,2.10735,1.76413,-0.37785,2.3447,-0.439868,2.1128,-0.856399,0.391962,0.0596928,3.14071,0.55379,-0.323817,1.34852,1.26384,-0.530032,0.0914133,1.66734,0.164499,1.86837,0.436341,0.789873,1.19748,0.20128,-0.180393,1.76122,1.43694,1.58884,1.46481,2.34353,1.61183,1.45891,1.49868,-0.230573,1.43875,1.16187,2.13336,1.89428,1.08254,-0.373526,2.10839,1.23112,1.44787,1.88114,0.821846,0.611242,1.96061,1.08048,1.56752,1.41472,2.3251,-1.31629,0.818272,1.02679,0.88011,0.429929,2.01677,-0.647096,0.929297,1.26535,1.75075,0.373295,1.2849,1.00512,-0.0634017,1.47037,1.68101,1.31621,0.168266,1.19961,1.82453,0.528602,1.25036,1.08807,1.33985,1.08444,0.876959,0.657046,1.52913,1.49747,1.06817,-0.411763,-0.270745,2.30107,0.0167994,-1.60702,0.799019,0.00527092,2.2859,1.28495,-1.73905,1.72942,1.6977,0.879624,0.827671,-0.498656,-1.27235,2.32157,1.32455,1.64385,0.0137481,1.73065,2.15729,3.22564,1.66301,1.52719,1.12511,1.89721,1.36408,0.549733,2.53215,2.32583,2.62857,1.82702,-0.284778,0.975535,2.66218,1.08243,0.939803,0.153579,2.8393,0.635428,1.18345,0.953191,1.21326,0.97113,1.12709,-0.556541,1.08716,2.95021,1.08891,2.03764,0.149707,-0.644056,0.625881,-1.17243,3.3663,1.28264,0.590207,4.01789,2.91935,2.22867,1.976,2.16168,2.22781,1.55711,2.08694,0.722314,-0.251834,2.47979,1.0776,1.06215,1.38233,1.51961,2.49257,0.935736,1.21717,-0.40227,0.872019,0.930367,0.918494,1.58912,0.40115,-0.276063,1.13483,1.5578,1.28558,2.21898,0.66478,-0.106084,2.20282,1.76934,1.51154,1.46509,1.33353,0.544959,2.10743,0.558646,0.364258,1.04197,2.62474,0.428424,-0.91074,0.987096,0.287551,0.407251,1.35411,1.84934,0.412257,1.0873,0.464989,0.12516,-0.963472,0.343352,1.18733,-0.51754,-0.639031,1.24628,0.824698,1.1549,0.524935,2.17746,0.582559,3.08042,2.57057,0.181292,-0.879114,0.820129,0.0457263,0.900904,-0.40075,1.22361,1.93484,1.00374,0.710188,-1.11631,0.277011,1.72704,-1.27718,0.617552,0.12913,1.21463,-0.579705,1.86727,0.441576,2.27007,0.80179,2.41151,0.670349,2.70312,2.15733,1.86129,-0.382875,0.271414,3.11007,1.25335,0.105172,0.975671,2.15405,0.807198,0.113668,3.14568,2.75397,1.789,-0.0243239,2.30337,0.716841,1.56584,0.862804,1.30748,0.000290171,-1.71031,1.35084,0.312259,2.31087,1.22655,1.74011,1.7753,1.28508,1.49614,2.13431,2.0251,2.12311,0.846789,1.59028,1.12578,2.49236,0.0179798,0.400194,2.52529,1.31311,1.14005,0.260951,-1.1329,2.0074,1.96732,2.6631,2.58901,0.691128,1.2927,0.452264,-0.460487,0.956293,-0.262014,1.06184,1.80214,0.878621,0.32308,1.83459,0.408499,0.957883,2.07074,1.75666,1.20144,1.8811,1.01633,1.35785,0.389512,1.08737,1.5471,1.06485,0.917656,0.582708,-0.0881159,-0.00218314,1.65207,1.79252,1.21813,2.29972,1.91183,-0.673398,0.983439,0.995069,-0.859572,1.11154,-0.344628,0.813691,1.27447,2.6488,2.39557,-0.759862,2.738,0.979413,2.16559,1.25724,-0.307214,1.12208,1.53434,0.969289,1.06029,2.4759,0.605325,1.27113,-0.786287,1.29703,1.84228,1.11468,-0.182368,0.509465,0.0859943,0.250102,2.39011,0.115524,1.07192,0.676053,1.13049,1.65828,0.855476,-0.108355,0.762752,-0.627707,2.91076,0.618928,0.442845,1.07121,2.26354,-0.9886,1.33339,0.728498,1.30889,0.381147,1.67643,1.13696,0.0892437,-0.113814,2.10604,2.1112,1.72773,2.89338,1.97581,1.21142,0.739402,-0.396863,1.55551,-0.886511,2.19261,2.58044,1.94013,1.0079,2.56078,2.72283,2.05478,1.15297,1.74301,0.547801,-0.880408,0.239238,-0.537556,1.54828,0.645937,0.28273,1.51497,1.48023,-0.332252,0.957462,1.88031,1.57121,1.18473,0.740651,1.70149,1.72608,-0.14689,0.499219,1.85834,1.79029,2.57437,2.19176,1.27357,0.669065,1.86849,1.76034,0.832941,-0.268798,1.37183,1.89798,1.99112,2.73544,-1.09975,3.17016,1.85828,0.574547,2.85349,-0.460377,1.10414,0.448173,-0.0977768,2.35655,1.35697,0.2392,3.59347,2.07989,-0.665526,1.91681,1.61296,2.29169,-0.659748,2.10876,1.29613,0.782869,1.45462,1.98569,0.514482,1.19593,1.30859,0.277214,0.0467778,0.749656,0.654692,0.887447,0.438307,0.241799,1.23964,2.99947,1.38018,-0.578791,-0.528262,0.489919,0.994326,-0.25839,2.43307,2.11232,0.633809,1.63785,0.9798,0.459433,1.6071,-0.417925,1.97683,0.0972211,-0.598692,0.955179,0.638519,1.87299,-0.910155,1.24253,-0.977754,0.212128,2.68815,-0.331196,1.16911,1.84352,1.47071,2.3464,0.671101,1.164,2.21583,0.537668,0.280352,2.66261,1.62618,1.11346,2.82677,0.966597,1.90072,1.74885,0.583048,1.7274,0.674973,2.07868,2.01082,2.23357,-0.353218,-0.492465,-0.388877,2.8462,0.485454,-0.412597,0.910139,2.42015,1.54614,0.983931,0.971357,-1.52884,1.76426,0.893934,0.50112,-0.470668,0.0816616,1.07748,3.66686,0.681018,-0.539715,1.27737,-0.205585,-1.33069,0.516627,2.15475,-0.538213,-0.35544,-0.079357,1.40891,0.885639,-0.53422,0.237443,1.45587,1.10909,0.931692,0.862783,1.75389,-0.11814,1.46601,2.34479,0.811973,2.39821,1.16857,-0.0813822,1.91053,0.391909,0.835664,1.55891,1.98428,0.617813,1.36557,1.26278,0.123268,2.15807,-0.851542,0.622385,-0.140438,1.33129,0.199208,0.617006,0.226018,0.693257,0.636872,1.60028,-0.67161,-0.341956,-1.44152,-0.0494709,0.267809,2.89897,0.700832,1.18465,0.664163,2.9712,0.694838,1.19716,0.835559,-0.743341,0.679429,0.139797,1.20389,2.02678,3.04787,2.12988,-0.251969,1.6355,3.08693,0.340366,1.57388,0.668259,3.14531,0.128932,0.809133,3.10142,2.60435,0.526762,2.399,2.45323,1.62934,1.42579,-0.410734,1.34602,-0.205842,2.03118,0.763424,-1.68997,1.02806,0.615541,0.840882,1.71505,2.36162,1.46588,0.870146,0.560466,1.86686,0.35447,3.20834,1.53339,1.02205,0.684267,0.143123,-0.688531,0.684221"

let NormalData01String = "-1.39472,0.572422,-0.807981,1.12284,0.582314,-2.02361,-1.07106,-1.07723,0.105198,-0.806512,-1.47555,0.117081,-0.40699,-0.554643,-0.0838551,-2.38265,-0.748096,1.13259,0.134903,-1.11957,-0.268167,-0.249893,-0.636138,0.411145,1.40698,0.868583,0.221741,-0.751367,-0.843731,-1.92446,-0.770097,1.34406,0.113856,0.442025,0.206676,0.448239,0.701375,-1.50239,0.118701,0.992643,0.119639,-0.0365253,0.205961,-0.37079,-0.224489,-0.428072,0.911177,-0.279192,0.560748,-0.24796,-1.05229,2.03458,-2.02889,-1.08878,-0.826172,0.381449,-0.134957,-0.07598,-1.03606,1.65422,-0.290542,0.221982,0.0674381,-0.32888,1.59649,0.418209,-0.899435,0.329175,-0.177973,1.62596,0.599629,-1.5299,-2.18709,0.297174,0.997437,1.55026,0.857938,0.177222,1.62641,-0.982871,0.307966,-0.518949,2.34573,-0.17761,2.3379,0.598934,-0.727655,0.320675,1.5864,0.0940648,0.350143,-0.617015,0.839371,0.224846,0.0201539,-1.49075,0.847894,-0.790432,1.80993,1.32279,0.141171,-1.14471,0.601558,0.678619,-0.45809,0.312201,1.3017,0.0407581,0.993514,0.931535,1.13858"
let NormalData02String = "-1.97868,-0.427976,-2.66975,0.176478,2.25474,2.40507,-0.761118,-1.23613,0.176328,0.246937,-0.748346,0.225074,2.12719,1.86908,-1.21862,0.167204,-0.212893,0.378512,-0.924507,-1.95599,0.939617,0.0456999,0.113515,1.16326,-3.19567,-0.0980512,0.112013,-1.2179,-2.11017,0.248698,-0.696075,2.17557,1.56604,-0.379878,0.0226318,1.05484,0.355952,-1.84079,1.86957,0.340198,1.63338,-0.0842764,-0.4389,-0.0731516,-1.52269,0.410057,-1.09899,1.79384,0.834195,-1.54511,-1.10209,0.667836,0.289231,0.811264,0.63324,-0.270103,-0.434363,-0.475097,1.61421,3.88214,-1.75994,0.669145,-1.62642,-0.5134,2.11818,-0.210695,-0.415295,1.31951,2.10836,-1.7428,-0.392325,-0.826717,-0.504155,-2.68384,-0.307938,0.243413,0.596948,-3.6242,1.17498,-0.52255,1.3824,-1.19024,2.56617,1.68061,-1.18291,-0.535121,-1.88233,-0.554142,-0.870762,0.73745,-0.737186,1.13752,-1.35994,-0.560269,0.619597,-0.588878,-0.660138,0.17239,2.23929,-0.642425,-2.40169,-1.02126,0.607818,-0.503528,1.04194,-2.77603,-2.34118,-0.0410913,0.524286,0.602759,-1.17653"
let NormalData03String = "1.36006,-0.246289,1.43112,0.811084,1.2796,1.25608,3.68661,1.86247,1.51717,1.77718,6.45058,0.831263,2.51442,2.79311,3.34225,1.64312,-1.3939,1.1648,3.28153,0.830627,2.94934,3.8969,0.762779,2.72686,6.35514,3.23959,1.94143,1.7125,5.14749,0.0266368,2.35417,1.40718,2.29764,0.873589,3.03813,3.28821,2.35882,2.62306,3.68845,3.98375,2.68762,3.4678,1.61238,1.36748,1.41429,0.858909,3.5106,1.63765,4.11641,-0.675375,1.8475,-0.595252,1.98112,0.358589,2.01333,3.26077,2.31679,5.3696,3.04103,-1.3282,4.05513,1.58629,1.77726,1.7793,-0.0743819,4.99872,2.4563,-0.0183636,3.86533,2.69593,0.459153,2.56991,2.81289,3.39954,1.66538,2.40858,-0.559767,1.64667,0.706113,1.82405,-0.510256,0.773982,2.13633,1.05356,5.27519,-0.628657,0.604019,0.404042,0.410413,1.23801,1.25667,2.04208,4.0242,4.03866,0.306506,2.19311,2.88265,2.42201,4.6352,3.31063,3.10571,1.16181,1.83808,0.309436,1.77448,3.02173,1.81139,1.68856,4.96991,0.307478,1.40293"
let TukeyKramerData_01String = "Group 1,Group 2,Group 3,Group 4\n6.9,8.3,8.0,5.8\n5.4,6.8,10.5,3.8\n5.8,7.8,8.1,6.1\n4.6,9.2,6.9,5.6\n4.0,6.5,9.3,6.2"
let TukeyKramerData_02String = "A,B,C\n27,26,21\n27,25,21\n25,26,20\n26,25,20\n25,24,22"
let ZarrDataString = "9.206343,9.299992,9.277895,9.305795,9.275351,9.288729,9.287239,9.260973,9.303111,9.275674,9.272561,9.288454,9.255672,9.252141,9.297670,9.266534,9.256689,9.277542,9.248205,9.252107,9.276345,9.278694,9.267144,9.246132,9.238479,9.269058,9.248239,9.257439,9.268481,9.288454,9.258452,9.286130,9.251479,9.257405,9.268343,9.291302,9.219460,9.270386,9.218808,9.241185,9.269989,9.226585,9.258556,9.286184,9.320067,9.327973,9.262963,9.248181,9.238644,9.225073,9.220878,9.271318,9.252072,9.281186,9.270624,9.294771,9.301821,9.278849,9.236680,9.233988,9.244687,9.221601,9.207325,9.258776,9.275708,9.268955,9.257269,9.264979,9.295500,9.292883,9.264188,9.280731,9.267336,9.300566,9.253089,9.261376,9.238409,9.225073,9.235526,9.239510,9.264487,9.244242,9.277542,9.310506,9.261594,9.259791,9.253089,9.245735,9.284058,9.251122,9.275385,9.254619,9.279526,9.275065,9.261952,9.275351,9.252433,9.230263,9.255150,9.268780,9.290389,9.274161,9.255707,9.261663,9.250455,9.261952,9.264041,9.264509,9.242114,9.239674,9.221553,9.241935,9.215265,9.285930,9.271559,9.266046,9.285299,9.268989,9.267987,9.246166,9.231304,9.240768,9.260506,9.274355,9.292376,9.271170,9.267018,9.308838,9.264153,9.278822,9.255244,9.229221,9.253158,9.256292,9.262602,9.219793,9.258452,9.267987,9.267987,9.248903,9.235153,9.242933,9.253453,9.262671,9.242536,9.260803,9.259825,9.253123,9.240803,9.238712,9.263676,9.243002,9.246826,9.252107,9.261663,9.247311,9.306055,9.237646,9.248937,9.256689,9.265777,9.299047,9.244814,9.287205,9.300566,9.256621,9.271318,9.275154,9.281834,9.253158,9.269024,9.282077,9.277507,9.284910,9.239840,9.268344,9.247778,9.225039,9.230750,9.270024,9.265095,9.284308,9.280697,9.263032,9.291851,9.252072,9.244031,9.283269,9.196848,9.231372,9.232963,9.234956,9.216746,9.274107,9.273776"

