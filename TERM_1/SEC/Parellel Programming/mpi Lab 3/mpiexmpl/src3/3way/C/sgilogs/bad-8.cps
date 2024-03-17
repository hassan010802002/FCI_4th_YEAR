%!PS-Adobe-3.0 EPSF-3.0
%%Creator: Tk Canvas Widget
%%For: Rusty Lusk,
%%Title: Window .1.pcanv
%%CreationDate: Fri Oct 18 14:31:38 1996
%%BoundingBox: 228 17 384 775
%%Pages: 1
%%DocumentData: Clean7Bit
%%Orientation: Landscape
%%DocumentNeededResources: font Helvetica-Bold
%%EndComments

% This file contains the standard Postscript prolog used when
% generating Postscript from canvas widgets.
%
% $Header: /user6/ouster/wish/library/RCS/prolog.ps,v 1.6 93/04/01 14:03:52 ouster Exp $ SPRITE (Berkeley);

%%BeginProlog
50 dict begin

% The definitions below just define all of the variables used in
% any of the procedures here.  This is needed for obscure reasons
% explained on p. 716 of the Postscript manual (Section H.2.7,
% "Initializing Variables," in the section on Encapsulated Postscript).

/baseline 0 def
/stipimage 0 def
/height 0 def
/justify 0 def
/maxwidth 0 def
/spacing 0 def
/stipple 0 def
/strings 0 def
/xoffset 0 def
/yoffset 0 def
/tmpstip null def
/encoding {ISOLatin1Encoding} def

% Override setfont to automatically encode the font in the style defined by 
% by 'encoding' (ISO Latin1 by default).

systemdict /encodefont known {
    /realsetfont /setfont load def
    /setfont {
	encoding encodefont realsetfont
    } def
} if

% desiredSize EvenPixels closestSize
%
% The procedure below is used for stippling.  Given the optimal size
% of a dot in a stipple pattern in the current user coordinate system,
% compute the closest size that is an exact multiple of the device's
% pixel size.  This allows stipple patterns to be displayed without
% aliasing effects.

/EvenPixels {
    % Compute exact number of device pixels per stipple dot.
    dup 0 matrix currentmatrix dtransform
    dup mul exch dup mul add sqrt

    % Round to an integer, make sure the number is at least 1, and compute
    % user coord distance corresponding to this.
    dup round dup 1 lt {pop 1} if
    exch div mul
} bind def

% width height string filled StippleFill --
%
% Given a path and other graphics information already set up, this
% procedure will fill the current path in a stippled fashion.  "String"
% contains a proper image description of the stipple pattern and
% "width" and "height" give its dimensions.  If "filled" is true then
% it means that the area to be stippled is gotten by filling the
% current path (e.g. the interior of a polygon); if it's false, the
% area is gotten by stroking the current path (e.g. a wide line).
% Each stipple dot is assumed to be about one unit across in the
% current user coordinate system.

/StippleFill {
    % Turn the path into a clip region that we can then cover with
    % lots of images corresponding to the stipple pattern.  Warning:
    % some Postscript interpreters get errors during strokepath for
    % dashed lines.  If this happens, turn off dashes and try again.

    1 index /tmpstip exch def %% Works around NeWSprint bug

    gsave
    {eoclip}
    {{strokepath} stopped {grestore gsave [] 0 setdash strokepath} if clip}
    ifelse

    % Change the scaling so that one user unit in user coordinates
    % corresponds to the size of one stipple dot.
    1 EvenPixels dup scale

    % Compute the bounding box occupied by the path (which is now
    % the clipping region), and round the lower coordinates down
    % to the nearest starting point for the stipple pattern.

    pathbbox
    4 2 roll
    5 index div cvi 5 index mul 4 1 roll
    6 index div cvi 6 index mul 3 2 roll

    % Stack now: width height string y1 y2 x1 x2
    % Below is a doubly-nested for loop to iterate across this area
    % in units of the stipple pattern size, going up columns then
    % across rows, blasting out a stipple-pattern-sized rectangle at
    % each position

    6 index exch {
	2 index 5 index 3 index {
	    % Stack now: width height string y1 y2 x y

	    gsave
	    1 index exch translate
	    5 index 5 index true matrix tmpstip imagemask
	    grestore
	} for
	pop
    } for
    pop pop pop pop pop
    grestore
    newpath
} bind def

% -- AdjustColor --
% Given a color value already set for output by the caller, adjusts
% that value to a grayscale or mono value if requested by the CL
% variable.

/AdjustColor {
    CL 2 lt {
	currentgray
	CL 0 eq {
	    .5 lt {0} {1} ifelse
	} if
	setgray
    } if
} bind def

% x y strings spacing xoffset yoffset justify stipple stipimage DrawText --
% This procedure does all of the real work of drawing text.  The
% color and font must already have been set by the caller, and the
% following arguments must be on the stack:
%
% x, y -	Coordinates at which to draw text.
% strings -	An array of strings, one for each line of the text item,
%		in order from top to bottom.
% spacing -	Spacing between lines.
% xoffset -	Horizontal offset for text bbox relative to x and y: 0 for
%		nw/w/sw anchor, -0.5 for n/center/s, and -1.0 for ne/e/se.
% yoffset -	Vertical offset for text bbox relative to x and y: 0 for
%		nw/n/ne anchor, +0.5 for w/center/e, and +1.0 for sw/s/se.
% justify -	0 for left justification, 0.5 for center, 1 for right justify.
% stipple -	Boolean value indicating whether or not text is to be
%		drawn in stippled fashion.
% stipimage -	Image for stippling, if stipple is True.
%
% Also, when this procedure is invoked, the color and font must already
% have been set for the text.

/DrawText {
    /stipimage exch def
    /stipple exch def
    /justify exch def
    /yoffset exch def
    /xoffset exch def
    /spacing exch def
    /strings exch def

    % First scan through all of the text to find the widest line.

    /maxwidth 0 def
    strings {
	stringwidth pop
	dup maxwidth gt {/maxwidth exch def} {pop} ifelse
	newpath
    } forall

    % Compute the baseline offset and the actual font height.

    0 0 moveto (TXygqPZ) false charpath
    pathbbox dup /baseline exch def
    exch pop exch sub /height exch def pop
    newpath

    % Translate coordinates first so that the origin is at the upper-left
    % corner of the text's bounding box. Remember that x and y for
    % positioning are still on the stack.

    translate
    maxwidth xoffset mul
    strings length 1 sub spacing mul height add yoffset mul translate

    % Now use the baseline and justification information to translate so
    % that the origin is at the baseline and positioning point for the
    % first line of text.

    justify maxwidth mul baseline neg translate

    % Iterate over each of the lines to output it.  For each line,
    % compute its width again so it can be properly justified, then
    % display it.

    strings {
	dup stringwidth pop
	justify neg mul 0 moveto
	show
	0 spacing neg translate
    } forall
} bind def

%%EndProlog
%%BeginSetup
/CL 2 def
%%IncludeResource: font Helvetica-Bold
%%EndSetup

%%Page: 1 1
save
306.0 396.0 translate
90 rotate
1.074 1.074 scale
-352 -72 translate
0 144 moveto 704 144 lineto 704 0 lineto 0 0 lineto closepath clip newpath
gsave
0 144 moveto 703 0 rlineto 0 -144 rlineto -703 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
grestore
gsave
0 109 moveto 33 0 rlineto 0 -75 rlineto -33 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
28 96.3311 [
    (0)
] 14 -1 0.5 0 () false DrawText
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
28 70.9932 [
    (1)
] 14 -1 0.5 0 () false DrawText
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
28 45.6554 [
    (2)
] 14 -1 0.5 0 () false DrawText
grestore
gsave
34 108 moveto 646 0 rlineto 0 -74 rlineto -646 0 rlineto closepath
0.000 0.000 0.000 setrgbcolor AdjustColor
fill
grestore
gsave
34 95.5 moveto
680 95.5 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
34 70.5 moveto
680 70.5 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
34 45.5 moveto
680 45.5 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
162.657 80.5 moveto 34.423 0 rlineto 0 -20 rlineto -34.423 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
162.657 80.5 moveto 34.423 0 rlineto 0 -20 rlineto -34.423 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
162.657 80.5 moveto 34.423 0 rlineto 0 -20 rlineto -34.423 0 rlineto closepath
1.000 1.000 0.000 setrgbcolor AdjustColor
fill
162.657 80.5 moveto 34.423 0 rlineto 0 -20 rlineto -34.423 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
93.239 105.5 moveto 107.57 0 rlineto 0 -20 rlineto -107.57 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
93.239 105.5 moveto 107.57 0 rlineto 0 -20 rlineto -107.57 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
93.239 105.5 moveto 107.57 0 rlineto 0 -20 rlineto -107.57 0 rlineto closepath
1.000 1.000 0.000 setrgbcolor AdjustColor
fill
93.239 105.5 moveto 107.57 0 rlineto 0 -20 rlineto -107.57 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
165.526 55.5 moveto 37.864 0 rlineto 0 -20 rlineto -37.864 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
165.526 55.5 moveto 37.864 0 rlineto 0 -20 rlineto -37.864 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
165.526 55.5 moveto 37.864 0 rlineto 0 -20 rlineto -37.864 0 rlineto closepath
1.000 1.000 0.000 setrgbcolor AdjustColor
fill
165.526 55.5 moveto 37.864 0 rlineto 0 -20 rlineto -37.864 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
241.255 80.5 moveto 6.02399999999997 0 rlineto 0 -20 rlineto -6.02399999999997 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
241.255 80.5 moveto 6.02399999999997 0 rlineto 0 -20 rlineto -6.02399999999997 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
241.255 80.5 moveto 6.02399999999997 0 rlineto 0 -20 rlineto -6.02399999999997 0 rlineto closepath
0.000 1.000 0.498 setrgbcolor AdjustColor
fill
241.255 80.5 moveto 6.02399999999997 0 rlineto 0 -20 rlineto -6.02399999999997 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
249.574 80.5 moveto 14.0550000000001 0 rlineto 0 -20 rlineto -14.0550000000001 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
249.574 80.5 moveto 14.0550000000001 0 rlineto 0 -20 rlineto -14.0550000000001 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
249.574 80.5 moveto 14.0550000000001 0 rlineto 0 -20 rlineto -14.0550000000001 0 rlineto closepath
0.000 0.000 1.000 setrgbcolor AdjustColor
fill
249.574 80.5 moveto 14.0550000000001 0 rlineto 0 -20 rlineto -14.0550000000001 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
226.625 55.5 moveto 82.327 0 rlineto 0 -20 rlineto -82.327 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
226.625 55.5 moveto 82.327 0 rlineto 0 -20 rlineto -82.327 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
226.625 55.5 moveto 82.327 0 rlineto 0 -20 rlineto -82.327 0 rlineto closepath
0.000 1.000 0.000 setrgbcolor AdjustColor
fill
226.625 55.5 moveto 82.327 0 rlineto 0 -20 rlineto -82.327 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
311.534 55.5 moveto 9.75300000000004 0 rlineto 0 -20 rlineto -9.75300000000004 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
311.534 55.5 moveto 9.75300000000004 0 rlineto 0 -20 rlineto -9.75300000000004 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
311.534 55.5 moveto 9.75300000000004 0 rlineto 0 -20 rlineto -9.75300000000004 0 rlineto closepath
0.000 0.000 1.000 setrgbcolor AdjustColor
fill
311.534 55.5 moveto 9.75300000000004 0 rlineto 0 -20 rlineto -9.75300000000004 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
323.008 55.5 moveto 6.88400000000001 0 rlineto 0 -20 rlineto -6.88400000000001 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
323.008 55.5 moveto 6.88400000000001 0 rlineto 0 -20 rlineto -6.88400000000001 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
323.008 55.5 moveto 6.88400000000001 0 rlineto 0 -20 rlineto -6.88400000000001 0 rlineto closepath
0.000 0.000 1.000 setrgbcolor AdjustColor
fill
323.008 55.5 moveto 6.88400000000001 0 rlineto 0 -20 rlineto -6.88400000000001 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
279.12 105.5 moveto 385.24 0 rlineto 0 -20 rlineto -385.24 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
279.12 105.5 moveto 385.24 0 rlineto 0 -20 rlineto -385.24 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
279.12 105.5 moveto 385.24 0 rlineto 0 -20 rlineto -385.24 0 rlineto closepath
0.000 0.000 1.000 setrgbcolor AdjustColor
fill
279.12 105.5 moveto 385.24 0 rlineto 0 -20 rlineto -385.24 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
265.637 80.5 moveto 405.323 0 rlineto 0 -20 rlineto -405.323 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
265.637 80.5 moveto 405.323 0 rlineto 0 -20 rlineto -405.323 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
265.637 80.5 moveto 405.323 0 rlineto 0 -20 rlineto -405.323 0 rlineto closepath
0.000 1.000 0.000 setrgbcolor AdjustColor
fill
265.637 80.5 moveto 405.323 0 rlineto 0 -20 rlineto -405.323 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
666.94 105.5 moveto 12.0499999999998 0 rlineto 0 -20 rlineto -12.0499999999998 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
666.94 105.5 moveto 12.0499999999998 0 rlineto 0 -20 rlineto -12.0499999999998 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
666.94 105.5 moveto 12.0499999999998 0 rlineto 0 -20 rlineto -12.0499999999998 0 rlineto closepath
0.000 1.000 0.000 setrgbcolor AdjustColor
fill
666.94 105.5 moveto 12.0499999999998 0 rlineto 0 -20 rlineto -12.0499999999998 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
673.54 80.5 moveto 6.46000000000004 0 rlineto 0 -20 rlineto -6.46000000000004 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
673.54 80.5 moveto 6.46000000000004 0 rlineto 0 -20 rlineto -6.46000000000004 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
673.54 80.5 moveto 6.46000000000004 0 rlineto 0 -20 rlineto -6.46000000000004 0 rlineto closepath
1.000 0.000 0.000 setrgbcolor AdjustColor
fill
673.54 80.5 moveto 6.46000000000004 0 rlineto 0 -20 rlineto -6.46000000000004 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
252.155 70.5 moveto
288.748361954748 48.0407151727417 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
292.888 45.5 moveto
286.196025251899 53.7138586529583 lineto
286.08780872 50.2603003875706 lineto
285.564720302083 49.4080219664894 lineto
282.534406326477 47.7479097053899 lineto
292.888 45.5 lineto
fill
grestore
gsave
282.275 95.5 moveto
663.822991751638 70.8136044881767 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
668.67 70.5 moveto
658.916845075735 74.6383534193306 lineto
660.433856979519 71.5339290936329 lineto
660.3692913496 70.5360156307348 lineto
658.464885666304 67.6529591790442 lineto
668.67 70.5 lineto
fill
grestore
gsave
313.542 45.5 moveto
672.168180094153 94.8380136493918 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
676.98 95.5 moveto
666.596292382377 97.6044277397256 lineto
668.703455683346 94.866063568682 lineto
668.839746990824 93.8753947645371 lineto
667.550331534724 90.6697461107113 lineto
676.98 95.5 lineto
fill
grestore
gsave
324.442 45.5 moveto
673.864906078854 70.1580911964144 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
678.71 70.5 moveto
668.488431171528 73.2873877887378 lineto
670.409643287088 70.4155034740014 lineto
670.480036276061 69.4179841372949 lineto
668.981182094342 66.3047524317923 lineto
678.71 70.5 lineto
fill
grestore
gsave
33 109 moveto 648 0 rlineto 0 -76 rlineto -648 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
33 109 moveto 648 0 rlineto 0 -76 rlineto -648 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
34 143 moveto 641 0 rlineto 0 -33 rlineto -641 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
grestore
gsave
41 134 moveto 45 0 rlineto 0 -15 rlineto -45 0 rlineto closepath
1.000 1.000 0.000 setrgbcolor AdjustColor
fill
41 134 moveto 45 0 rlineto 0 -15 rlineto -45 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
127 127 [
    (BARRIER)
] 14 -0.5 0.5 0 () false DrawText
grestore
gsave
175 134 moveto 45 0 rlineto 0 -15 rlineto -45 0 rlineto closepath
0.000 1.000 0.498 setrgbcolor AdjustColor
fill
175 134 moveto 45 0 rlineto 0 -15 rlineto -45 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
252 127 [
    (IRECV)
] 14 -0.5 0.5 0 () false DrawText
grestore
gsave
291 134 moveto 45 0 rlineto 0 -15 rlineto -45 0 rlineto closepath
0.000 1.000 0.000 setrgbcolor AdjustColor
fill
291 134 moveto 45 0 rlineto 0 -15 rlineto -45 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
364 127 [
    (RECV)
] 14 -0.5 0.5 0 () false DrawText
grestore
gsave
398 134 moveto 45 0 rlineto 0 -15 rlineto -45 0 rlineto closepath
0.000 0.000 1.000 setrgbcolor AdjustColor
fill
398 134 moveto 45 0 rlineto 0 -15 rlineto -45 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
470 127 [
    (SEND)
] 14 -0.5 0.5 0 () false DrawText
grestore
gsave
503 134 moveto 45.0000000000001 0 rlineto 0 -15 rlineto -45.0000000000001 0 rlineto closepath
1.000 0.000 0.000 setrgbcolor AdjustColor
fill
503 134 moveto 45.0000000000001 0 rlineto 0 -15 rlineto -45.0000000000001 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
575 127 [
    (WAIT)
] 14 -0.5 0.5 0 () false DrawText
grestore
gsave
33 144 moveto 648 0 rlineto 0 -35 rlineto -648 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
63 32 moveto 636 0 rlineto 0 -30 rlineto -636 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
grestore
gsave
452.21 32 moveto
452.21 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
452.21 19 [
    (0.00375)
] 14 -0.5 0 0 () false DrawText
grestore
gsave
522.93 32 moveto
522.93 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
522.93 19 [
    (0.00400)
] 14 -0.5 0 0 () false DrawText
grestore
gsave
593.65 32 moveto
593.65 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
593.65 19 [
    (0.00425)
] 14 -0.5 0 0 () false DrawText
grestore
gsave
664.36 32 moveto
664.36 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
664.36 19 [
    (0.00450)
] 14 -0.5 0 0 () false DrawText
grestore
gsave
98.625 32 moveto
98.625 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
98.625 19 [
    (0.00250)
] 14 -0.5 0 0 () false DrawText
grestore
gsave
169.343 32 moveto
169.343 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
169.343 19 [
    (0.00275)
] 14 -0.5 0 0 () false DrawText
grestore
gsave
240.06 32 moveto
240.06 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
240.06 19 [
    (0.00300)
] 14 -0.5 0 0 () false DrawText
grestore
gsave
310.777 32 moveto
310.777 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
310.777 19 [
    (0.00325)
] 14 -0.5 0 0 () false DrawText
grestore
gsave
381.494 32 moveto
381.494 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
381.494 19 [
    (0.00350)
] 14 -0.5 0 0 () false DrawText
grestore
gsave
33 33 moveto
681 33 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
0 144 moveto 703 0 rlineto 0 -144 rlineto -703 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
restore showpage

%%Trailer
end
%%EOF
