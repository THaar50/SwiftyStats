//
//  Created by VT on 06.08.18.
//  Copyright © 2018 Volker Thieme. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//  

import Foundation
let abscissas: [FPT] = [
    // 1st layer abcissas: transformed 0, 1, 2, 3
    0.00000000000000000000 as! FPT,
    0.95136796407274694573 as! FPT,
    0.99997747719246159286 as! FPT,
    0.99999999999995705839 as! FPT,
    // 2nd layer abcissas: transformed 1/2, 3/2, 5/2
    0.67427149224843582608 as! FPT,
    0.99751485645722438683 as! FPT,
    0.99999998887566488198 as! FPT,
    // 3rd layer abcissas: transformed 1/4, 3/4, ...
    0.37720973816403417379 as! FPT,
    0.85956905868989663517 as! FPT,
    0.98704056050737689169 as! FPT,
    0.99968826402835320905 as! FPT,
    0.99999920473711471266 as! FPT,
    0.99999999995285644818 as! FPT,
    // 4th layer abcissas: transformed 1/8, 3/8, ...
    0.19435700332493543161 as! FPT,
    0.53914670538796776905 as! FPT,
    0.78060743898320029925 as! FPT,
    0.91487926326457461091 as! FPT,
    0.97396686819567744856 as! FPT,
    0.99405550663140214329 as! FPT,
    0.99906519645578584642 as! FPT,
    0.99990938469514399984 as! FPT,
    0.99999531604122052843 as! FPT,
    0.99999989278161241838 as! FPT,
    0.99999999914270509218 as! FPT,
    0.99999999999823216531 as! FPT,
    // 5th layer abcissa: transformed 1/16, 3/16, ...
    0.097923885287832333262 as! FPT,
    0.28787993274271591456 as! FPT,
    0.46125354393958570440 as! FPT,
    0.61027365750063894488 as! FPT,
    0.73101803479256151149 as! FPT,
    0.82331700550640237006 as! FPT,
    0.88989140278426019808 as! FPT,
    0.93516085752198468323 as! FPT,
    0.96411216422354729193 as! FPT,
    0.98145482667733517003 as! FPT,
    0.99112699244169880223 as! FPT,
    0.99610866543750854254 as! FPT,
    0.99845420876769773751 as! FPT,
    0.99945143443527460584 as! FPT,
    0.99982882207287494166 as! FPT,
    0.99995387100562796075 as! FPT,
    0.99998948201481850361 as! FPT,
    0.99999801714059543208 as! FPT,
    0.99999969889415261122 as! FPT,
    0.99999996423908091534 as! FPT,
    0.99999999678719909830 as! FPT,
    0.99999999978973286224 as! FPT,
    0.99999999999039393352 as! FPT,
    0.99999999999970809734 as! FPT,
    // 6th layer abcissas: transformed 1/32, 3/32, ...
    0.049055967305077886315 as! FPT,
    0.14641798429058794053 as! FPT,
    0.24156631953888365838 as! FPT,
    0.33314226457763809244 as! FPT,
    0.41995211127844715849 as! FPT,
    0.50101338937930910152 as! FPT,
    0.57558449063515165995 as! FPT,
    0.64317675898520470128 as! FPT,
    0.70355000514714201566 as! FPT,
    0.75669390863372994941 as! FPT,
    0.80279874134324126576 as! FPT,
    0.84221924635075686382 as! FPT,
    0.87543539763040867837 as! FPT,
    0.90301328151357387064 as! FPT,
    0.92556863406861266645 as! FPT,
    0.94373478605275715685 as! FPT,
    0.95813602271021369012 as! FPT,
    0.96936673289691733517 as! FPT,
    0.97797623518666497298 as! FPT,
    0.98445883116743083087 as! FPT,
    0.98924843109013389601 as! FPT,
    0.99271699719682728538 as! FPT,
    0.99517602615532735426 as! FPT,
    0.99688031812819187372 as! FPT,
    0.99803333631543375402 as! FPT,
    0.99879353429880589929 as! FPT,
    0.99928111192179195541 as! FPT,
    0.99958475035151758732 as! FPT,
    0.99976797159956083506 as! FPT,
    0.99987486504878034648 as! FPT,
    0.99993501992508242369 as! FPT,
    0.99996759306794345976 as! FPT,
    0.99998451990227082442 as! FPT,
    0.99999293787666288565 as! FPT,
    0.99999693244919035751 as! FPT,
    0.99999873547186590954 as! FPT,
    0.99999950700571943689 as! FPT,
    0.99999981889371276701 as! FPT,
    0.99999993755407837378 as! FPT,
    0.99999997987450320175 as! FPT,
    0.99999999396413420165 as! FPT,
    0.99999999832336194826 as! FPT,
    0.99999999957078777261 as! FPT,
    0.99999999989927772326 as! FPT,
    0.99999999997845533741 as! FPT,
    0.99999999999582460688 as! FPT,
    0.99999999999927152627 as! FPT,
    0.99999999999988636130 as! FPT,
    // 7th layer abcissas: transformed 1/64, 3/64, ...
    0.024539763574649160379 as! FPT,
    0.073525122985671294475 as! FPT,
    0.12222912220155764235 as! FPT,
    0.17046797238201051811 as! FPT,
    0.21806347346971200463 as! FPT,
    0.26484507658344795046 as! FPT,
    0.31065178055284596083 as! FPT,
    0.35533382516507453330 as! FPT,
    0.39875415046723775644 as! FPT,
    0.44078959903390086627 as! FPT,
    0.48133184611690504422 as! FPT,
    0.52028805069123015958 as! FPT,
    0.55758122826077823080 as! FPT,
    0.59315035359195315880 as! FPT,
    0.62695020805104287950 as! FPT,
    0.65895099174335012438 as! FPT,
    0.68913772506166767176 as! FPT,
    0.71750946748732412721 as! FPT,
    0.74407838354734739913 as! FPT,
    0.76886868676824658459 as! FPT,
    0.79191549237614211447 as! FPT,
    0.81326360850297385168 as! FPT,
    0.83296629391941087564 as! FPT,
    0.85108400798784873261 as! FPT,
    0.86768317577564598669 as! FPT,
    0.88283498824466895513 as! FPT,
    0.89661425428007602579 as! FPT,
    0.90909831816302043511 as! FPT,
    0.92036605303195280235 as! FPT,
    0.93049693799715340631 as! FPT,
    0.93957022393327475539 as! FPT,
    0.94766419061515309734 as! FPT,
    0.95485549580502268541 as! FPT,
    0.96121861515111640753 as! FPT,
    0.96682537031235585284 as! FPT,
    0.97174454156548730892 as! FPT,
    0.97604156025657673933 as! FPT,
    0.97977827580061576265 as! FPT,
    0.98301279148110110558 as! FPT,
    0.98579936302528343597 as! FPT,
    0.98818835380074264243 as! FPT,
    0.99022624046752774694 as! FPT,
    0.99195566300267761562 as! FPT,
    0.99341551316926403900 as! FPT,
    0.99464105571251119672 as! FPT,
    0.99566407681695316965 as! FPT,
    0.99651305464025377317 as! FPT,
    0.99721334704346870224 as! FPT,
    0.99778739195890653083 as! FPT,
    0.99825491617199629344 as! FPT,
    0.99863314864067747762 as! FPT,
    0.99893703483351217373 as! FPT,
    0.99917944893488591716 as! FPT,
    0.99937140114093768690 as! FPT,
    0.99952223765121720422 as! FPT,
    0.99963983134560036519 as! FPT,
    0.99973076151980848263 as! FPT,
    0.99980048143113838630 as! FPT,
    0.99985347277311141171 as! FPT,
    0.99989338654759256426 as! FPT,
    0.99992317012928932869 as! FPT,
    0.99994518061445869309 as! FPT,
    0.99996128480785666613 as! FPT,
    0.99997294642523223656 as! FPT,
    0.99998130127012072679 as! FPT,
    0.99998722128200062811 as! FPT,
    0.99999136844834487344 as! FPT,
    0.99999423962761663478 as! FPT,
    0.99999620334716617675 as! FPT,
    0.99999752962380516793 as! FPT,
    0.99999841381096473542 as! FPT,
    0.99999899541068996962 as! FPT,
    0.99999937270733536947 as! FPT,
    0.99999961398855024275 as! FPT,
    0.99999976602333243312 as! FPT,
    0.99999986037121459941 as! FPT,
    0.99999991800479471056 as! FPT,
    0.99999995264266446185 as! FPT,
    0.99999997311323594362 as! FPT,
    0.99999998500307631173 as! FPT,
    0.99999999178645609907 as! FPT,
    0.99999999558563361584 as! FPT,
    0.99999999767323673790 as! FPT,
    0.99999999879798350040 as! FPT,
    0.99999999939177687583 as! FPT,
    0.99999999969875436925 as! FPT,
    0.99999999985405611550 as! FPT,
    0.99999999993088839501 as! FPT,
    0.99999999996803321674 as! FPT,
    0.99999999998556879008 as! FPT,
    0.99999999999364632387 as! FPT,
    0.99999999999727404948 as! FPT,
    0.99999999999886126543 as! FPT,
    0.99999999999953722654 as! FPT,
    0.99999999999981720098 as! FPT,
    0.99999999999992987953 as! FPT
] // end abcissas

let weights: [FPT] =
    [
        // First layer weights
        1.5707963267948966192 as! FPT,
        0.230022394514788685 as! FPT,
        0.00026620051375271690866 as! FPT,
        1.3581784274539090834e-12 as! FPT,
        // 2nd layer weights
        0.96597657941230114801 as! FPT,
        0.018343166989927842087 as! FPT,
        2.1431204556943039358e-7 as! FPT,
        // 3rd layer weights
        1.3896147592472563229 as! FPT,
        0.53107827542805397476 as! FPT,
        0.076385743570832304188 as! FPT,
        0.0029025177479013135936 as! FPT,
        0.000011983701363170720047 as! FPT,
        1.1631165814255782766e-9 as! FPT,
        // 4th layer weights
        1.5232837186347052132 as! FPT,
        1.1934630258491569639 as! FPT,
        0.73743784836154784136 as! FPT,
        0.36046141846934367417 as! FPT,
        0.13742210773316772341 as! FPT,
        0.039175005493600779072 as! FPT,
        0.0077426010260642407123 as! FPT,
        0.00094994680428346871691 as! FPT,
        0.000062482559240744082891 as! FPT,
        1.8263320593710659699e-6 as! FPT,
        1.8687282268736410132e-8 as! FPT,
        4.9378538776631926964e-11 as! FPT,
        //  5th layer weights
        1.5587733555333301451 as! FPT,
        1.466014426716965781 as! FPT,
        1.297475750424977998 as! FPT,
        1.0816349854900704074 as! FPT,
        0.85017285645662006895 as! FPT,
        0.63040513516474369106 as! FPT,
        0.44083323627385823707 as! FPT,
        0.290240679312454185 as! FPT,
        0.17932441211072829296 as! FPT,
        0.10343215422333290062 as! FPT,
        0.055289683742240583845 as! FPT,
        0.027133510013712003219 as! FPT,
        0.012083543599157953493 as! FPT,
        0.0048162981439284630173 as! FPT,
        0.0016908739981426396472 as! FPT,
        0.00051339382406790336017 as! FPT,
        0.00013205234125609974879 as! FPT,
        0.000028110164327940134749 as! FPT,
        4.8237182032615502124e-6 as! FPT,
        6.4777566035929719908e-7 as! FPT,
        6.5835185127183396672e-8 as! FPT,
        4.8760060974240625869e-9 as! FPT,
        2.5216347918530148572e-10 as! FPT,
        8.6759314149796046502e-12 as! FPT,
        // 6th layer weights
        1.5677814313072218572 as! FPT,
        1.5438811161769592204 as! FPT,
        1.4972262225410362896 as! FPT,
        1.4300083548722996676 as! FPT,
        1.3452788847662516615 as! FPT,
        1.2467012074518577048 as! FPT,
        1.1382722433763053734 as! FPT,
        1.0240449331118114483 as! FPT,
        0.90787937915489531693 as! FPT,
        0.79324270082051671787 as! FPT,
        0.68306851634426375464 as! FPT,
        0.57967810308778764708 as! FPT,
        0.48475809121475539287 as! FPT,
        0.39938474152571713515 as! FPT,
        0.32408253961152890402 as! FPT,
        0.258904639514053516 as! FPT,
        0.20352399885860174519 as! FPT,
        0.15732620348436615027 as! FPT,
        0.11949741128869592428 as! FPT,
        0.089103139240941462841 as! FPT,
        0.065155533432536205042 as! FPT,
        0.046668208054846613644 as! FPT,
        0.032698732726609031113 as! FPT,
        0.022379471063648476483 as! FPT,
        0.014937835096050129696 as! FPT,
        0.0097072237393916892692 as! FPT,
        0.0061300376320830301252 as! FPT,
        0.0037542509774318343023 as! FPT,
        0.0022250827064786427022 as! FPT,
        0.0012733279447082382027 as! FPT,
        0.0007018595156842422708 as! FPT,
        0.00037166693621677760301 as! FPT,
        0.00018856442976700318572 as! FPT,
        0.000091390817490710122732 as! FPT,
        0.000042183183841757600604 as! FPT,
        0.000018481813599879217116 as! FPT,
        7.6595758525203162562e-6 as! FPT,
        2.9916615878138787094e-6 as! FPT,
        1.0968835125901264732e-6 as! FPT,
        3.7595411862360630091e-7 as! FPT,
        1.1992442782902770219e-7 as! FPT,
        3.5434777171421953043e-8 as! FPT,
        9.6498888961089633609e-9 as! FPT,
        2.4091773256475940779e-9 as! FPT,
        5.482835779709497755e-10 as! FPT,
        1.1306055347494680536e-10 as! FPT,
        2.0989335404511469109e-11 as! FPT,
        3.4841937670261059685e-12 as! FPT,
        // 7th layer weights
        1.5700420292795931467 as! FPT,
        1.5640214037732320999 as! FPT,
        1.5520531698454121192 as! FPT,
        1.5342817381543034316 as! FPT,
        1.5109197230741697127 as! FPT,
        1.48224329788553807 as! FPT,
        1.4485862549613225916 as! FPT,
        1.4103329714462590129 as! FPT,
        1.3679105116808964881 as! FPT,
        1.3217801174437728579 as! FPT,
        1.2724283455378627082 as! FPT,
        1.2203581095793582207 as! FPT,
        1.1660798699324345766 as! FPT,
        1.1101031939653403796 as! FPT,
        1.0529288799552666556 as! FPT,
        0.99504180404613271514 as! FPT,
        0.93690461274566793366 as! FPT,
        0.87895234555278212039 as! FPT,
        0.82158803526696470334 as! FPT,
        0.7651792989089561367 as! FPT,
        0.71005590120546898385 as! FPT,
        0.65650824613162753076 as! FPT,
        0.60478673057840362158 as! FPT,
        0.55510187800363350959 as! FPT,
        0.5076251588319080997 as! FPT,
        0.4624903980553677613 as! FPT,
        0.41979566844501548066 as! FPT,
        0.37960556938665160999 as! FPT,
        0.3419537959230168323 as! FPT,
        0.30684590941791694932 as! FPT,
        0.27426222968906810637 as! FPT,
        0.24416077786983990868 as! FPT,
        0.21648020911729617038 as! FPT,
        0.19114268413342749532 as! FPT,
        0.16805663794826916233 as! FPT,
        0.14711941325785693248 as! FPT,
        0.12821973363120098675 as! FPT,
        0.11123999898874453035 as! FPT,
        0.096058391865189467849 as! FPT,
        0.082550788110701737654 as! FPT,
        0.070592469906866999352 as! FPT,
        0.060059642358636300319 as! FPT,
        0.05083075757257047107 as! FPT,
        0.042787652157725676034 as! FPT,
        0.035816505604196436523 as! FPT,
        0.029808628117310126969 as! FPT,
        0.024661087314753282511 as! FPT,
        0.020277183817500123926 as! FPT,
        0.016566786254247575375 as! FPT,
        0.013446536605285730674 as! FPT,
        0.010839937168255907211 as! FPT,
        0.0086773307495391815854 as! FPT,
        0.0068957859690660035329 as! FPT,
        0.0054388997976239984331 as! FPT,
        0.0042565295990178580165 as! FPT,
        0.0033044669940348302363 as! FPT,
        0.0025440657675291729678 as! FPT,
        0.0019418357759843675814 as! FPT,
        0.0014690143599429791058 as! FPT,
        0.0011011261134519383862 as! FPT,
        0.00081754101332469493115 as! FPT,
        0.00060103987991147422573 as! FPT,
        0.00043739495615911687786 as! FPT,
        0.00031497209186021200274 as! FPT,
        0.00022435965205008549104 as! FPT,
        0.00015802788400701191949 as! FPT,
        0.00011002112846666697224 as! FPT,
        0.000075683996586201477788 as! FPT,
        0.000051421497447658802092 as! FPT,
        0.0000344921247593431977 as! FPT,
        0.000022832118109036146591 as! FPT,
        0.000014908514031870608449 as! FPT,
        9.5981941283784710776e-6 as! FPT,
        6.0899100320949039256e-6 as! FPT,
        3.8061983264644899045e-6 as! FPT,
        2.3421667208528096843e-6 as! FPT,
        1.4183067155493917523e-6 as! FPT,
        8.4473756384859863469e-7 as! FPT,
        4.9458288702754198508e-7 as! FPT,
        2.8449923659159806339e-7 as! FPT,
        1.6069394579076224911e-7 as! FPT,
        8.9071395140242387124e-8 as! FPT,
        4.8420950198072369669e-8 as! FPT,
        2.579956822953589238e-8 as! FPT,
        1.3464645522302038796e-8 as! FPT,
        6.8784610955899001111e-9 as! FPT,
        3.4371856744650090511e-9 as! FPT,
        1.6788897682161906807e-9 as! FPT,
        8.0099784479729665356e-10 as! FPT,
        3.7299501843052790038e-10 as! FPT,
        1.6939457789411646876e-10 as! FPT,
        7.4967397573818224522e-11 as! FPT,
        3.230446433325236576e-11 as! FPT,
        1.3542512912336274432e-11 as! FPT,
        5.5182369468174885821e-12 as! FPT,
        2.1835922099233609052e-12 as! FPT
] // end weights


// Bessel
/* Chebyshev coefficients for exp(-x) I0(x)
 * in the interval [0,8].
 *
 * lim(x->0){ exp(-x) I0(x) } = 1.
 */

fileprivate let AI0: [Double] =
    [
        -4.41534164647933937950E-18,
        3.33079451882223809783E-17,
        -2.43127984654795469359E-16,
        1.71539128555513303061E-15,
        -1.16853328779934516808E-14,
        7.67618549860493561688E-14,
        -4.85644678311192946090E-13,
        2.95505266312963983461E-12,
        -1.72682629144155570723E-11,
        9.67580903537323691224E-11,
        -5.18979560163526290666E-10,
        2.65982372468238665035E-9,
        -1.30002500998624804212E-8,
        6.04699502254191894932E-8,
        -2.67079385394061173391E-7,
        1.11738753912010371815E-6,
        -4.41673835845875056359E-6,
        1.64484480707288970893E-5,
        -5.75419501008210370398E-5,
        1.88502885095841655729E-4,
        -5.76375574538582365885E-4,
        1.63947561694133579842E-3,
        -4.32430999505057594430E-3,
        1.05464603945949983183E-2,
        -2.37374148058994688156E-2,
        4.93052842396707084878E-2,
        -9.49010970480476444210E-2,
        1.71620901522208775349E-1,
        -3.04682672343198398683E-1,
        6.76795274409476084995E-1]

/* Chebyshev coefficients for exp(-x) sqrt(x) I0(x)
 * in the inverted interval [8,infinity].
 *
 * lim(x->inf){ exp(-x) sqrt(x) I0(x) } = 1/sqrt(2pi).
 */

fileprivate let BI0: [Double] =
    [
        -7.23318048787475395456E-18,
        -4.83050448594418207126E-18,
        4.46562142029675999901E-17,
        3.46122286769746109310E-17,
        -2.82762398051658348494E-16,
        -3.42548561967721913462E-16,
        1.77256013305652638360E-15,
        3.81168066935262242075E-15,
        -9.55484669882830764870E-15,
        -4.15056934728722208663E-14,
        1.54008621752140982691E-14,
        3.85277838274214270114E-13,
        7.18012445138366623367E-13,
        -1.79417853150680611778E-12,
        -1.32158118404477131188E-11,
        -3.14991652796324136454E-11,
        1.18891471078464383424E-11,
        4.94060238822496958910E-10,
        3.39623202570838634515E-9,
        2.26666899049817806459E-8,
        2.04891858946906374183E-7,
        2.89137052083475648297E-6,
        6.88975834691682398426E-5,
        3.36911647825569408990E-3,
        8.04490411014108831608E-1
]