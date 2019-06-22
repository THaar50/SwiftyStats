//
//  Created by VT on 20.07.18.
//  Copyright © 2018 strike65. All rights reserved.
/*
 Copyright (2017-2019) strike65
 
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

extension SSProbDist {
    enum LogNormal {
        
        // MARK: Log Normal
        
        /// Returns a SSContProbDistParams struct containing mean, variance, kurtosis and skewness of the Log Normal distribution.
        /// - Parameter mean: mean
        /// - Parameter variance: variance
        /// - Throws: SSSwiftyStatsError if v <= 0
        public static func para<FPT: SSFloatingPoint & Codable>(mean: FPT, variance v: FPT) throws -> SSContProbDistParams<FPT> {
            var result: SSContProbDistParams<FPT> = SSContProbDistParams<FPT>()
            if v <= 0 {
                #if os(macOS) || os(iOS)
                
                if #available(macOS 10.12, iOS 10, *) {
                    os_log("variance is expected to be > 0", log: log_stat, type: .error)
                }
                
                #endif
                
                throw SSSwiftyStatsError.init(type: .functionNotDefinedInDomainProvided, file: #file, line: #line, function: #function)
            }
            var ex1: FPT
            var ex2: FPT
            var ex3: FPT
            
            let delta: FPT = SSMath.exp1(v)
            result.mean = SSMath.exp1(mean + v / 2)
            result.variance = SSMath.exp1(2 * mean) * delta * (delta - 1)
            result.skewness = (delta + 2) * (delta - 1).squareRoot()
            ex1 = SSMath.pow1(delta, 4)
            ex2 = ex1 + 2 * SSMath.pow1(delta, 3)
            ex3 = ex2 + 3 * SSMath.pow1(delta, 2)
            result.kurtosis = ex3 - 3
            //    result.kurtosis = SSMath.pow1(delta, 4) + 2 * SSMath.pow1(delta, 3) + 3 * SSMath.pow1(delta, 2) - 3
            return result
        }
        
        /// Returns the cdf of the Logarithmic Normal distribution
        /// - Parameter x: x
        /// - Parameter mean: mean
        /// - Parameter variance: variance
        /// - Throws: SSSwiftyStatsError if v <= 0
        public static func pdf<FPT: SSFloatingPoint & Codable>(x: FPT, mean: FPT, variance v: FPT) throws -> FPT {
            if v <= 0 {
                #if os(macOS) || os(iOS)
                
                if #available(macOS 10.12, iOS 10, *) {
                    os_log("variance is expected to be > 0", log: log_stat, type: .error)
                }
                
                #endif
                
                throw SSSwiftyStatsError.init(type: .functionNotDefinedInDomainProvided, file: #file, line: #line, function: #function)
            }
            if x <= 0 {
                return 0
            }
            else {
                let e1: FPT = sqrt(v) * x
                let e2: FPT = e1 * sqrt(2 * FPT.pi)
                let e3: FPT = SSMath.pow1(SSMath.log1(x) - mean, 2)
                let r:FPT = 1 / e2 * SSMath.exp1(-1 * e3 / (2 * v))
                //        let e1: FPT = SSMath.exp1(-1 * SSMath.pow1(SSMath.log1(x) - mean, 2) / (2 * v))
                //        let r = 1 / (sqrt(v) * x * sqrt(2 * FPT.pi)) * e1
                return r
            }
        }
        
        /// Returns the pdf of the Logarithmic Normal distribution
        /// - Parameter x: x
        /// - Parameter mean: mean
        /// - Parameter variance: variance
        /// - Throws: SSSwiftyStatsError if v <= 0
        public static func cdf<FPT: SSFloatingPoint & Codable>(x: FPT, mean: FPT, variance v: FPT) throws -> FPT {
            if v <= 0 {
                #if os(macOS) || os(iOS)
                
                if #available(macOS 10.12, iOS 10, *) {
                    os_log("variance is expected to be > 0", log: log_stat, type: .error)
                }
                
                #endif
                
                throw SSSwiftyStatsError.init(type: .functionNotDefinedInDomainProvided, file: #file, line: #line, function: #function)
            }
            if x <= 0 {
                return 0
            }
            let r = SSProbDist.Gaussian.Standard.cdf(u: (SSMath.log1(x) - mean) / sqrt(v))
            return r
        }
        
        
        /// Returns the pdf of the Logarithmic Normal distribution
        /// - Parameter p: p
        /// - Parameter mean: mean
        /// - Parameter variance: variance
        /// - Throws: SSSwiftyStatsError if v <= 0 and/or p < 0 and/or p > 1
        public static func quantile<FPT: SSFloatingPoint & Codable>(p: FPT, mean: FPT, variance v: FPT) throws -> FPT {
            if v <= 0 {
                #if os(macOS) || os(iOS)
                
                if #available(macOS 10.12, iOS 10, *) {
                    os_log("variance is expected to be > 0", log: log_stat, type: .error)
                }
                
                #endif
                
                throw SSSwiftyStatsError.init(type: .functionNotDefinedInDomainProvided, file: #file, line: #line, function: #function)
            }
            if p < 0 || p > 1 {
                #if os(macOS) || os(iOS)
                
                if #available(macOS 10.12, iOS 10, *) {
                    os_log("p is expected to be >= 0 and <= 1.0", log: log_stat, type: .error)
                }
                
                #endif
                
                throw SSSwiftyStatsError.init(type: .functionNotDefinedInDomainProvided, file: #file, line: #line, function: #function)
            }
            if abs(p - 1) <= FPT.ulpOfOne {
                return FPT.infinity
            }
            else if p.isZero {
                return 0
            }
            do {
                let u = try SSProbDist.Gaussian.Standard.quantile(p: p)
                return SSMath.exp1( mean + u * sqrt(v))
            }
            catch {
                return FPT.nan
            }
        }
        
    }
}

