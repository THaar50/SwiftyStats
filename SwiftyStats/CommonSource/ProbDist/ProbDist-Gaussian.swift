//
//  swift
//  SwiftyStats
//
//  Created by Volker Thieme on 18.07.17.
//
/*
 Copyright (c) 2017 Volker Thieme
 
 GNU GPL 3+
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, version 3 of the License.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import Foundation
#if os(macOS) || os(iOS)
import os.log
#endif



// MARK: GAUSSIAN

/// Returns the CDF of a Gaussian distribution
/// <img src="../img/Gaussian_def.png" alt="">
/// - Parameter x: x
/// - Parameter m: Mean
/// - Parameter sd: Standard deviation
/// - Throws: SSSwiftyStatsError if sd <= 0.0
public func cdfNormalDist(x: Double!, mean m: Double!, standardDeviation sd: Double!) throws -> Double {
    if sd <= 0.0 {
        #if os(macOS) || os(iOS)
        
        if #available(macOS 10.12, iOS 10, *) {
            os_log("sd is expected to be > 0", log: log_stat, type: .error)
        }
        
        #endif
        
        throw SSSwiftyStatsError.init(type: .functionNotDefinedInDomainProvided, file: #file, line: #line, function: #function)
    }
//    let u = (x  - m) / sd
//    return cdfStandardNormalDist(u: u)
    let n = 0.5 * erfc((m - x) / (SQRTTWO * sd))
    return n
}

/// Returns the CDF of a Gaussian distribution
/// - Parameter x: x
/// - Parameter m: Mean
/// - Parameter v: Variance
/// - Throws: SSSwiftyStatsError if v <= 0.0
public func cdfNormalDist(x: Double!, mean m: Double!, variance v: Double!) throws -> Double {
    if v <= 0.0 {
        #if os(macOS) || os(iOS)
        
        if #available(macOS 10.12, iOS 10, *) {
            os_log("v is expected to be > 0", log: log_stat, type: .error)
        }
        
        #endif
        
        throw SSSwiftyStatsError.init(type: .functionNotDefinedInDomainProvided, file: #file, line: #line, function: #function)
    }
//    let u = (x - m) / sqrt(v)
//    return cdfStandardNormalDist(u: u)
    let n = 0.5 * erfc((m - x) / (SQRTTWO * sqrt(v)))
    return n
}

/// Returns the CDF of the standard Gaussian distribution (mean = 0.0, standard deviation = 1.0)
/// - Parameter u: Standardized variate (u = (x - mean)/sd)
public func cdfStandardNormalDist(u: Double!) -> Double {
    return 0.5 * erfc(-u / SQRTTWO)
//    return 0.5 * (1.0 + erf(u / SQRTTWO))
}

/// Returns the PDF of a Gaussian distribution
/// - Parameter m: Mean
/// - Parameter sd: Standard deviation
/// - Throws: SSSwiftyStatsError if sd <= 0.0
public func pdfNormalDist(x: Double!, mean m: Double!, standardDeviation sd: Double!) throws -> Double {
    if sd <= 0.0 {
        #if os(macOS) || os(iOS)
        
        if #available(macOS 10.12, iOS 10, *) {
            os_log("sd is expected to be > 0", log: log_stat, type: .error)
        }
        
        #endif
        
        throw SSSwiftyStatsError.init(type: .functionNotDefinedInDomainProvided, file: #file, line: #line, function: #function)
    }
    return 1.0 / (sd * SQRT2PI) * exp(-1.0 * pow(x - m, 2.0) / (2.0 * sd * sd))
}

/// Returns the PDF of a Gaussian distribution
/// - Parameter x: x
/// - Parameter m: Mean
/// - Parameter v: Variance
/// - Throws: SSSwiftyStatsError if v <= 0.0
public func pdfNormalDist(x: Double!, mean m: Double!, variance v: Double!) throws -> Double {
    if v <= 0.0 {
        #if os(macOS) || os(iOS)
        
        if #available(macOS 10.12, iOS 10, *) {
            os_log("v is expected to be > 0", log: log_stat, type: .error)
        }
        
        #endif
        
        throw SSSwiftyStatsError.init(type: .functionNotDefinedInDomainProvided, file: #file, line: #line, function: #function)
    }
    return 1.0 / (sqrt(v) * SQRT2PI) * exp(-1.0 * pow(x - m, 2.0) / (2.0 * v))
}

/// Returns the PDF of the standard Gaussian distribution (mean = 0.0, standard deviation = 1.0)
/// - Parameter u: Standardized variate (u = (x - mean)/sd)
public func pdfStandardNormalDist(u: Double!) -> Double {
    return SQRT2PIINV * exp(-1.0 * u * u / 2.0)
}

/*
 REAL FUNCTION PPND7 (P, IFAULT)
 C
 C	ALGORITHM AS241  APPL. STATIST. (1988) VOL. 37, NO. 3, 477-
 C	484.
 C
 C	Produces the normal deviate Z corresponding to a given lower
 C	tail area of P; Z is accurate to about 1 part in 10**7.
 C
 C	The hash sums below are the sums of the mantissas of the
 C	coefficients.   They are included for use in checking
 C	transcription.
 C
 REAL ZERO, ONE, HALF, SPLIT1, SPLIT2, CONST1, CONST2, A0, A1,
 *		A2, A3, B1, B2, B3, C0, C1, C2, C3, D1, D2, E0, E1, E2,
 *		E3, F1, F2, P, Q, R
 PARAMETER (ZERO = 0.0, ONE = 1.0, HALF = 0.5,
 *		SPLIT1 = 0.425, SPLIT2 = 5.0,
 *		CONST1 = 0.180625, CONST2 = 1.6)
 C
 C	Coefficients for P close to 0.5
 C
 PARAMETER (A0 = 3.38713 27179E+00, A1 = 5.04342 71938E+01,
 *		   A2 = 1.59291 13202E+02, A3 = 5.91093 74720E+01,
 *		   B1 = 1.78951 69469E+01, B2 = 7.87577 57664E+01,
 *		   B3 = 6.71875 63600E+01)
 C	HASH SUM AB    32.31845 77772
 C
 C	Coefficients for P not close to 0, 0.5 or 1.
 C
 PARAMETER (C0 = 1.42343 72777E+00, C1 = 2.75681 53900E+00,
 *		   C2 = 1.30672 84816E+00, C3 = 1.70238 21103E-01,
 *		   D1 = 7.37001 64250E-01, D2 = 1.20211 32975E-01)
 C	HASH SUM CD    15.76149 29821
 C
 C	Coefficients for P near 0 or 1.
 C
 PARAMETER (E0 = 6.65790 51150E+00, E1 = 3.08122 63860E+00,
 *		   E2 = 4.28682 94337E-01, E3 = 1.73372 03997E-02,
 *		   F1 = 2.41978 94225E-01, F2 = 1.22582 02635E-02)
 C	HASH SUM EF    19.40529 10204
 C
 IFAULT = 0
 Q = P - HALF
 IF (ABS(Q) .LE. SPLIT1) THEN
 R = CONST1 - Q * Q
 PPND7 = Q * (((A3 * R + A2) * R + A1) * R + A0) /
 *		      (((B3 * R + B2) * R + B1) * R + ONE)
 RETURN
 ELSE
 IF (Q .LT. ZERO) THEN
 R = P
 ELSE
 R = ONE - P
 END IF
 IF (R .LE. ZERO) THEN
 IFAULT = 1
 PPND7 = ZERO
 RETURN
 END IF
 R = SQRT(-LOG(R))
 IF (R .LE. SPLIT2) THEN
 R = R - CONST2
 PPND7 = (((C3 * R + C2) * R + C1) * R + C0) /
 *		     ((D2 * R + D1) * R + ONE)
 ELSE
 R = R - SPLIT2
 PPND7 = (((E3 * R + E2) * R + E1) * R + E0) /
 *		     ((F2 * R + F1) * R + ONE)
 END IF
 IF (Q .LT. ZERO) PPND7 = - PPND7
 RETURN
 END IF
 END
 C
 C
 DOUBLE PRECISION FUNCTION PPND16 (P, IFAULT)
 C
 C	ALGORITHM AS241  APPL. STATIST. (1988) VOL. 37, NO. 3
 C
 C	Produces the normal deviate Z corresponding to a given lower
 C	tail area of P; Z is accurate to about 1 part in 10**16.
 C
 C	The hash sums below are the sums of the mantissas of the
 C	coefficients.   They are included for use in checking
 C	transcription.
 C
 DOUBLE PRECISION ZERO, ONE, HALF, SPLIT1, SPLIT2, CONST1,
 *		CONST2, A0, A1,	A2, A3, A4, A5, A6, A7, B1, B2, B3,
 *          B4, B5, B6, B7,
 *		C0, C1, C2, C3, C4, C5, C6, C7,	D1, D2, D3, D4, D5,
 *		D6, D7, E0, E1, E2, E3, E4, E5, E6, E7, F1, F2, F3,
 *		F4, F5, F6, F7, P, Q, R
 PARAMETER (ZERO = 0.D0, ONE = 1.D0, HALF = 0.5D0,
 *		SPLIT1 = 0.425D0, SPLIT2 = 5.D0,
 *		CONST1 = 0.180625D0, CONST2 = 1.6D0)
 C
 C	Coefficients for P close to 0.5
 C
 PARAMETER (A0 = 3.38713 28727 96366 6080D0,
 *		   A1 = 1.33141 66789 17843 7745D+2,
 *		   A2 = 1.97159 09503 06551 4427D+3,
 *		   A3 = 1.37316 93765 50946 1125D+4,
 *		   A4 = 4.59219 53931 54987 1457D+4,
 *		   A5 = 6.72657 70927 00870 0853D+4,
 *		   A6 = 3.34305 75583 58812 8105D+4,
 *		   A7 = 2.50908 09287 30122 6727D+3,
 *		   B1 = 4.23133 30701 60091 1252D+1,
 *		   B2 = 6.87187 00749 20579 0830D+2,
 *		   B3 = 5.39419 60214 24751 1077D+3,
 *		   B4 = 2.12137 94301 58659 5867D+4,
 *		   B5 = 3.93078 95800 09271 0610D+4,
 *		   B6 = 2.87290 85735 72194 2674D+4,
 *		   B7 = 5.22649 52788 52854 5610D+3)
 C	HASH SUM AB    55.88319 28806 14901 4439
 C
 C	Coefficients for P not close to 0, 0.5 or 1.
 C
 PARAMETER (C0 = 1.42343 71107 49683 57734D0,
 *		   C1 = 4.63033 78461 56545 29590D0,
 *		   C2 = 5.76949 72214 60691 40550D0,
 *		   C3 = 3.64784 83247 63204 60504D0,
 *		   C4 = 1.27045 82524 52368 38258D0,
 *		   C5 = 2.41780 72517 74506 11770D-1,
 *             C6 = 2.27238 44989 26918 45833D-2,
 *		   C7 = 7.74545 01427 83414 07640D-4,
 *		   D1 = 2.05319 16266 37758 82187D0,
 *		   D2 = 1.67638 48301 83803 84940D0,
 *		   D3 = 6.89767 33498 51000 04550D-1,
 *		   D4 = 1.48103 97642 74800 74590D-1,
 *		   D5 = 1.51986 66563 61645 71966D-2,
 *		   D6 = 5.47593 80849 95344 94600D-4,
 *		   D7 = 1.05075 00716 44416 84324D-9)
 C	HASH SUM CD    49.33206 50330 16102 89036
 C
 C	Coefficients for P near 0 or 1.
 C
 PARAMETER (E0 = 6.65790 46435 01103 77720D0,
 *		   E1 = 5.46378 49111 64114 36990D0,
 *		   E2 = 1.78482 65399 17291 33580D0,
 *		   E3 = 2.96560 57182 85048 91230D-1,
 *		   E4 = 2.65321 89526 57612 30930D-2,
 *		   E5 = 1.24266 09473 88078 43860D-3,
 *		   E6 = 2.71155 55687 43487 57815D-5,
 *		   E7 = 2.01033 43992 92288 13265D-7,
 *		   F1 = 5.99832 20655 58879 37690D-1,
 *		   F2 = 1.36929 88092 27358 05310D-1,
 *		   F3 = 1.48753 61290 85061 48525D-2,
 *		   F4 = 7.86869 13114 56132 59100D-4,
 *		   F5 = 1.84631 83175 10054 68180D-5,
 *		   F6 = 1.42151 17583 16445 88870D-7,
 *		   F7 = 2.04426 31033 89939 78564D-15)
 C	HASH SUM EF    47.52583 31754 92896 71629
 C
 IFAULT = 0
 Q = P - HALF
 IF (ABS(Q) .LE. SPLIT1) THEN
 R = CONST1 - Q * Q
 PPND16 = Q * (((((((A7 * R + A6) * R + A5) * R + A4) * R + A3)
 *			* R + A2) * R + A1) * R + A0) /
 *		      (((((((B7 * R + B6) * R + B5) * R + B4) * R + B3)
 *			* R + B2) * R + B1) * R + ONE)
 RETURN
 ELSE
 IF (Q .LT. ZERO) THEN
 R = P
 ELSE
 R = ONE - P
 END IF
 IF (R .LE. ZERO) THEN
 IFAULT = 1
 PPND16 = ZERO
 RETURN
 END IF
 R = SQRT(-LOG(R))
 IF (R .LE. SPLIT2) THEN
 R = R - CONST2
 PPND16 = (((((((C7 * R + C6) * R + C5) * R + C4) * R + C3)
 *			* R + C2) * R + C1) * R + C0) /
 *		     (((((((D7 * R + D6) * R + D5) * R + D4) * R + D3)
 *			* R + D2) * R + D1) * R + ONE)
 ELSE
 R = R - SPLIT2
 PPND16 = (((((((E7 * R + E6) * R + E5) * R + E4) * R + E3)
 *			* R + E2) * R + E1) * R + E0) /
 *		     (((((((F7 * R + F6) * R + F5) * R + F4) * R + F3)
 *			* R + F2) * R + F1) * R + ONE)
 END IF
 IF (Q .LT. ZERO) PPND16 = - PPND16
 RETURN
 END IF
 END
 */

/// Returns the quantile function of the standard Gaussian distribution. Uses algorithm AS241 at
/// http://lib.stat.cmu.edu/apstat/241 (ALGORITHM AS241  APPL. STATIST. (1988) VOL. 37, NO. 3, 477-484.)
/// - Parameter p: P
/// - Throws: SSSwiftyStatsError if p < 0.0 or p > 1
public func quantileStandardNormalDist(p: Double!) throws -> Double {
    if (p == 0.0) {
        return -Double.infinity
    }
    if p == 1.0 {
        return Double.infinity
    }
    if ((p < 0) || (p > 1.0)) {
        #if os(macOS) || os(iOS)
        
        if #available(macOS 10.12, iOS 10, *) {
            os_log("p is expected to be > 0.0 and < 1.0", log: log_stat, type: .error)
        }
        
        #endif
        
        throw SSSwiftyStatsError.init(type: .functionNotDefinedInDomainProvided, file: #file, line: #line, function: #function)
    }
    var R: Double
    let ZERO = 0.0
    let ONE = 1.0
    let HALF = 0.5
    let SPLIT1 = 0.425
    let SPLIT2 = 5.0
    let CONST1 = 0.180625
    let CONST2 = 1.6
    let A0 = 3.3871328727963666080
    let A1 = 1.3314166789178437745E02
    let A2 = 1.9715909503065514427E03
    let A3 = 1.3731693765509461125E04
    let A4 = 4.5921953931549871457E04
    let A5 = 6.7265770927008700853E04
    let A6 = 3.3430575583588128105E04
    let A7 = 2.5090809287301226727E03
    let B1 = 4.2313330701600911252E01
    let B2 = 6.8718700749205790830E02
    let B3 = 5.3941960214247511077E03
    let B4 = 2.1213794301586595867E04
    let B5 = 3.9307895800092710610E04
    let B6 = 2.8729085735721942674E04
    let B7 = 5.2264952788528545610E03
    let C0 = 1.42343711074968357734
    let C1 = 4.63033784615654529590
    let C2 = 5.76949722146069140550
    let C3 = 3.64784832476320460504
    let C4 = 1.27045825245236838258
    let C5 = 2.41780725177450611770E-01
    let C6 = 2.27238449892691845833E-02
    let C7 = 7.74545014278341407640E-04
    let D1 = 2.05319162663775882187
    let D2 = 1.67638483018380384940
    let D3 = 6.89767334985100004550E-01
    let D4 = 1.48103976427480074590E-01
    let D5 = 1.51986665636164571966E-02
    let D6 = 5.47593808499534494600E-04
    let D7 = 1.05075007164441684324E-09
    let E0 = 6.65790464350110377720
    let E1 = 5.46378491116411436990
    let E2 = 1.78482653991729133580
    let E3 = 2.96560571828504891230E-01
    let E4 = 2.65321895265761230930E-02
    let E5 = 1.24266094738807843860E-03
    let E6 = 2.71155556874348757815E-05
    let E7 = 2.01033439929228813265E-07
    let F1 = 5.99832206555887937690E-01
    let F2 = 1.36929880922735805310E-01
    let F3 = 1.48753612908506148525E-02
    let F4 = 7.86869131145613259100E-04
    let F5 = 1.84631831751005468180E-05
    let F6 = 1.42151175831644588870E-07
    let F7 = 2.04426310338993978564E-15
    let Q = p - HALF
    var _res: Double
    if(fabs(Q) <= SPLIT1)
    {
        R = CONST1 - Q * Q
        _res = Q * (((((((A7 * R + A6) * R + A5) * R + A4) * R + A3) * R + A2) * R + A1) * R + A0) / (((((((B7 * R + B6) * R + B5) * R + B4) * R + B3) * R + B2) * R + B1) * R + ONE)
        return _res
    }
    else
    {
        if(Q < ZERO) {
            R = p
        }
        else {
            R = ONE - p
        }
        if(R <= ZERO) {
            _res = Double.nan
            return _res
        }
        R = sqrt(-log(R))
        if (R <= SPLIT2)
        {
            R = R - CONST2
            _res = (((((((C7 * R + C6) * R + C5) * R + C4) * R + C3) * R + C2) * R + C1) * R + C0) / (((((((D7 * R + D6) * R + D5) * R + D4) * R + D3) * R + D2) * R + D1) * R + ONE)
        }
        else
        {
            R = R - SPLIT2
            _res = (((((((E7 * R + E6) * R + E5) * R + E4) * R + E3) * R + E2) * R + E1) * R + E0) / (((((((F7 * R + F6) * R + F5) * R + F4) * R + F3) * R + F2) * R + F1) * R + ONE)
        }
        if(Q < ZERO) {
            _res = -_res
        }
        return _res
    }
    
}

/// Returns the quantile function of a Gaussian distribution
/// - Parameter p: p
/// - Parameter m: Mean
/// - Parameter sd: Standard deviation
/// - Throws: SSSwiftyStatsError if sd <= 0.0
public func quantileNormalDist(p: Double!, mean m: Double!, standardDeviation sd: Double!) throws -> Double {
    if sd <= 0.0 {
        #if os(macOS) || os(iOS)
        
        if #available(macOS 10.12, iOS 10, *) {
            os_log("sd is expected to be > 0", log: log_stat, type: .error)
        }
        
        #endif
        
        throw SSSwiftyStatsError.init(type: .functionNotDefinedInDomainProvided, file: #file, line: #line, function: #function)
    }
    if p < 0.0 {
        return -Double.infinity
    }
    if p > 1.0 {
        return Double.infinity
    }
    do {
        return try m + SQRTTWO * sd * inverf(z: -1.0 + 2.0 * p)
    }
    catch {
        return Double.nan
    }
}

/// Returns the quantile function of a Gaussian distribution
/// - Parameter p: p
/// - Parameter m: Mean
/// - Parameter v: Variance
/// - Throws: SSSwiftyStatsError if v <= 0.0
public func quantileNormalDist(p: Double!, mean m: Double!, variance v: Double!) throws -> Double {
    if v <= 0.0 {
        #if os(macOS) || os(iOS)
        
        if #available(macOS 10.12, iOS 10, *) {
            os_log("v is expected to be > 0", log: log_stat, type: .error)
        }
        
        #endif
        
        throw SSSwiftyStatsError.init(type: .functionNotDefinedInDomainProvided, file: #file, line: #line, function: #function)
    }
    if p < 0.0 {
        return -Double.infinity
    }
    if p > 1.0 {
        return Double.infinity
    }
    do {
        return try quantileNormalDist(p:p, mean:m, standardDeviation: sqrt(v))
    }
    catch {
        return Double.nan
    }
}

/// Inverse error function using the identity inverf(x) = InverseCDFStdNormal( ( x + 1 ) / 2) / sqrt(2)
/// - Parameter z: Z
/// - Throws: SSSwiftyStatsError if z < -1.0 or z > 1.0
fileprivate func inverf(z: Double!) throws -> Double {
    if (z == -1.0) {
        return -Double.infinity
    }
    if z == 1.0 {
        return Double.infinity
    }
    if ((z < -1.0) || (z > 1.0)) {
        #if os(macOS) || os(iOS)
        
        if #available(macOS 10.12, iOS 10, *) {
            os_log("z is expected to be > -1.0 and < 1.0", log: log_stat, type: .error)
        }
        
        #endif
        
        throw SSSwiftyStatsError.init(type: .functionNotDefinedInDomainProvided, file: #file, line: #line, function: #function)
    }
    let x = (z + 1.0) / 2.0
    do {
        let invCDF = try quantileStandardNormalDist(p: x)
        let result = invCDF / SQRTTWO
        return result
    }
    catch {
        return Double.nan
    }
}





