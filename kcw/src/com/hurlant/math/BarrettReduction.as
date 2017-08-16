/*
This file is part of the Kaltura Collaborative Media Suite which allows users 
to do with audio, video, and animation what Wiki platfroms allow them to do with 
text.

Copyright (C) 2006-2008  Kaltura Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

@ignore
*/
package com.hurlant.math
{
	use namespace bi_internal;

	internal class BarrettReduction implements IReduction
	{
		private var m:BigInteger;
		private var r2:BigInteger;
		private var q3:BigInteger;
		private var mu:BigInteger;
		
		public function BarrettReduction(m:BigInteger) {
			// setup Barrett
			r2 = new BigInteger;
			q3 = new BigInteger;
			BigInteger.ONE.dlShiftTo(2*m.t, r2);
			mu = r2.divide(m);
			this.m = m;
		}
		
		public function revert(x:BigInteger):BigInteger
		{
			return x;
		}
		
		/**
		 * 
		 * @param x
		 * @param y
		 * @param r = x*y mod m; x != r
		 * 
		 */
		public function mulTo(x:BigInteger, y:BigInteger, r:BigInteger):void
		{
			x.multiplyTo(y, r);
			reduce(r);
		}
		
		/**
		 * 
		 * @param x
		 * @param r = x^2 mod m; x != r
		 * 
		 */
		public function sqrTo(x:BigInteger, r:BigInteger):void
		{
			x.squareTo(r);
			reduce(r);
		}
		
		public function convert(x:BigInteger):BigInteger
		{
			if (x.s<0 || x.t>2*m.t) {
				return x.mod(m);
			} else if (x.compareTo(m)<0) {
				return x;
			} else {
				var r:BigInteger = new BigInteger;
				x.copyTo(r);
				reduce(r);
				return r;
			}
		}
		
		/**
		 * 
		 * @param x = x mod m (HAC 14.42)
		 * 
		 */
		public function reduce(lx:BigInteger):void
		{
			var x:BigInteger = lx as BigInteger;
			x.drShiftTo(m.t-1,r2);
			if (x.t>m.t+1) {
				x.t = m.t+1;
				x.clamp();
			}
			mu.multiplyUpperTo(r2, m.t+1, q3);
			m.multiplyLowerTo(q3, m.t+1, r2);
			while (x.compareTo(r2)<0) {
				x.dAddOffset(1, m.t+1);
			}
			x.subTo(r2,x);
			while (x.compareTo(m)>=0) {
				x.subTo(m,x);
			}
		}
		
	}
}