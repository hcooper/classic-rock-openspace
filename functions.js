/*
 *   © 2005 Chris Veness
 *   convert standard grid reference ('SU387148') to fully numeric ref ([438700,114800])
 *   returned co-ordinates are in metres, centred on grid square for conversion to lat/long
 *
 *   note that northern-most grid squares will give 7-digit northings
 *   no error-checking is done on gridref (bad input will give bad results or NaN)
 */
function gridrefLetToNum(gridref) {
  // get numeric values of letter references, mapping A->0, B->1, C->2, etc:
  var l1 = gridref.toUpperCase().charCodeAt(0) - 'A'.charCodeAt(0);
  var l2 = gridref.toUpperCase().charCodeAt(1) - 'A'.charCodeAt(0);
  // shuffle down letters after 'I' since 'I' is not used in grid:
  if (l1 > 7) l1--;
  if (l2 > 7) l2--;

  // convert grid letters into 100km-square indexes from false origin (grid square SV):
  var e = ((l1-2)%5)*5 + (l2%5);
  var n = (19-Math.floor(l1/5)*5) - Math.floor(l2/5);

  // skip grid letters to get numeric part of ref, stripping any spaces:
  gridref = gridref.slice(2).replace(/ /g,'');

  // append numeric part of references to grid index:
  e += gridref.slice(0, gridref.length/2);
  n += gridref.slice(gridref.length/2);

  // normalise to 1m grid, rounding up to centre of grid square:
  switch (gridref.length) {
    case 6: e += '50'; n += '50'; break;
    case 8: e += '5'; n += '5'; break;
    // 10-digit refs are already 1m
  }

  return [e, n];
}


/*
 * convert numeric grid reference (in metres) to standard-form grid ref
 */
function gridrefNumToLet(e, n, digits) {
  // get the 100km-grid indices
  var e100k = Math.floor(e/100000), n100k = Math.floor(n/100000);

  if (e100k<0 || e100k>6 || n100k<0 || n100k>12) return '';

  // translate those into numeric equivalents of the grid letters
  var l1 = (19-n100k) - (19-n100k)%5 + Math.floor((e100k+10)/5);
  var l2 = (19-n100k)*5%25 + e100k%5;

  // compensate for skipped 'I' and build grid letter-pairs
  if (l1 > 7) l1++;
  if (l2 > 7) l2++;
  var letPair = String.fromCharCode(l1+'A'.charCodeAt(0), l2+'A'.charCodeAt(0));

  // strip 100km-grid indices from easting & northing, and reduce precision
  e = Math.floor((e%100000)/Math.pow(10,5-digits/2));
  n = Math.floor((n%100000)/Math.pow(10,5-digits/2));

  var gridRef = letPair + e.padLZ(digits/2) + n.padLZ(digits/2);

  return gridRef;
}


/*
 * pad a number with sufficient leading zeros to make it w chars wide
 */
Number.prototype.padLZ = function(w) {
  var n = this.toString();
  for (var i=0; i<w-n.length; i++) n = '0' + n;
  return n;
}


