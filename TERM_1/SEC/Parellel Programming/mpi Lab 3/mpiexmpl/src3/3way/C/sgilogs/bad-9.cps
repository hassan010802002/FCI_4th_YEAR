%!PS-Adobe-3.0 EPSF-3.0
%%Creator: Tk Canvas Widget
%%For: Rusty Lusk,
%%Title: Window .2.pcanv
%%CreationDate: Fri Oct 18 14:28:54 1996
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
129.852 80.5 moveto 15.096 0 rlineto 0 -20 rlineto -15.096 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
129.852 80.5 moveto 15.096 0 rlineto 0 -20 rlineto -15.096 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
129.852 80.5 moveto 15.096 0 rlineto 0 -20 rlineto -15.096 0 rlineto closepath
1.000 1.000 0.000 setrgbcolor AdjustColor
fill
129.852 80.5 moveto 15.096 0 rlineto 0 -20 rlineto -15.096 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
34 105.5 moveto 115.129 0 rlineto 0 -20 rlineto -115.129 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
34 105.5 moveto 115.129 0 rlineto 0 -20 rlineto -115.129 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
34 105.5 moveto 115.129 0 rlineto 0 -20 rlineto -115.129 0 rlineto closepath
1.000 1.000 0.000 setrgbcolor AdjustColor
fill
34 105.5 moveto 115.129 0 rlineto 0 -20 rlineto -115.129 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
34 55.5 moveto 116.987 0 rlineto 0 -20 rlineto -116.987 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
34 55.5 moveto 116.987 0 rlineto 0 -20 rlineto -116.987 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
34 55.5 moveto 116.987 0 rlineto 0 -20 rlineto -116.987 0 rlineto closepath
1.000 1.000 0.000 setrgbcolor AdjustColor
fill
34 55.5 moveto 116.987 0 rlineto 0 -20 rlineto -116.987 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
193.258 80.5 moveto 5.34200000000001 0 rlineto 0 -20 rlineto -5.34200000000001 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
193.258 80.5 moveto 5.34200000000001 0 rlineto 0 -20 rlineto -5.34200000000001 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
193.258 80.5 moveto 5.34200000000001 0 rlineto 0 -20 rlineto -5.34200000000001 0 rlineto closepath
0.000 1.000 0.498 setrgbcolor AdjustColor
fill
193.258 80.5 moveto 5.34200000000001 0 rlineto 0 -20 rlineto -5.34200000000001 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
200.923 80.5 moveto 73.625 0 rlineto 0 -20 rlineto -73.625 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
200.923 80.5 moveto 73.625 0 rlineto 0 -20 rlineto -73.625 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
200.923 80.5 moveto 73.625 0 rlineto 0 -20 rlineto -73.625 0 rlineto closepath
0.000 0.000 1.000 setrgbcolor AdjustColor
fill
200.923 80.5 moveto 73.625 0 rlineto 0 -20 rlineto -73.625 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
166.781 55.5 moveto 110.554 0 rlineto 0 -20 rlineto -110.554 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
166.781 55.5 moveto 110.554 0 rlineto 0 -20 rlineto -110.554 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
166.781 55.5 moveto 110.554 0 rlineto 0 -20 rlineto -110.554 0 rlineto closepath
0.000 1.000 0.000 setrgbcolor AdjustColor
fill
166.781 55.5 moveto 110.554 0 rlineto 0 -20 rlineto -110.554 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
212.071 105.5 moveto 359.769 0 rlineto 0 -20 rlineto -359.769 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
212.071 105.5 moveto 359.769 0 rlineto 0 -20 rlineto -359.769 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
212.071 105.5 moveto 359.769 0 rlineto 0 -20 rlineto -359.769 0 rlineto closepath
0.000 0.000 1.000 setrgbcolor AdjustColor
fill
212.071 105.5 moveto 359.769 0 rlineto 0 -20 rlineto -359.769 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
279.426 55.5 moveto 340.724 0 rlineto 0 -20 rlineto -340.724 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
279.426 55.5 moveto 340.724 0 rlineto 0 -20 rlineto -340.724 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
279.426 55.5 moveto 340.724 0 rlineto 0 -20 rlineto -340.724 0 rlineto closepath
0.000 0.000 1.000 setrgbcolor AdjustColor
fill
279.426 55.5 moveto 340.724 0 rlineto 0 -20 rlineto -340.724 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
276.406 80.5 moveto 347.454 0 rlineto 0 -20 rlineto -347.454 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
276.406 80.5 moveto 347.454 0 rlineto 0 -20 rlineto -347.454 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
276.406 80.5 moveto 347.454 0 rlineto 0 -20 rlineto -347.454 0 rlineto closepath
0.000 1.000 0.000 setrgbcolor AdjustColor
fill
276.406 80.5 moveto 347.454 0 rlineto 0 -20 rlineto -347.454 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
625.49 80.5 moveto 5.81000000000006 0 rlineto 0 -20 rlineto -5.81000000000006 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
625.49 80.5 moveto 5.81000000000006 0 rlineto 0 -20 rlineto -5.81000000000006 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
625.49 80.5 moveto 5.81000000000006 0 rlineto 0 -20 rlineto -5.81000000000006 0 rlineto closepath
1.000 0.000 0.000 setrgbcolor AdjustColor
fill
625.49 80.5 moveto 5.81000000000006 0 rlineto 0 -20 rlineto -5.81000000000006 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
621.54 55.5 moveto 55.2800000000001 0 rlineto 0 -20 rlineto -55.2800000000001 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
621.54 55.5 moveto 55.2800000000001 0 rlineto 0 -20 rlineto -55.2800000000001 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
621.54 55.5 moveto 55.2800000000001 0 rlineto 0 -20 rlineto -55.2800000000001 0 rlineto closepath
0.000 0.000 1.000 setrgbcolor AdjustColor
fill
621.54 55.5 moveto 55.2800000000001 0 rlineto 0 -20 rlineto -55.2800000000001 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
573.46 105.5 moveto 106.54 0 rlineto 0 -20 rlineto -106.54 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
573.46 105.5 moveto 106.54 0 rlineto 0 -20 rlineto -106.54 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
0.000 0.000 0.000 setrgbcolor AdjustColor
stroke
grestore
gsave
573.46 105.5 moveto 106.54 0 rlineto 0 -20 rlineto -106.54 0 rlineto closepath
0.000 1.000 0.000 setrgbcolor AdjustColor
fill
573.46 105.5 moveto 106.54 0 rlineto 0 -20 rlineto -106.54 0 rlineto closepath
1 setlinewidth 0 setlinejoin 2 setlinecap
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
203.245 70.5 moveto
270.426182677599 47.0977933488466 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
275.013 45.5 moveto
266.720903661138 52.0947811417081 lineto
267.352908000639 48.6978198488677 lineto
267.023950546465 47.7534751060205 lineto
264.418201481918 45.4843679417776 lineto
275.013 45.5 lineto
fill
grestore
gsave
214.626 95.5 moveto
616.921987943267 70.7976841152475 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
621.77 70.5 moveto
612.003306378009 74.606299513449 lineto
613.530505738614 71.5068741436152 lineto
613.469217832534 70.5087540142879 lineto
611.574291035446 67.6194586081581 lineto
621.77 70.5 lineto
fill
grestore
gsave
280.819 45.5 moveto
624.595298069547 70.1525810313741 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
629.44 70.5 moveto
619.215267651088 73.2757608674201 lineto
621.139744754222 70.4060634287142 lineto
621.211272188939 69.408624795974 lineto
619.715959694107 66.2936904382381 lineto
629.44 70.5 lineto
fill
grestore
gsave
622.7 45.5 moveto
675.504329147095 92.2791718170581 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
679.14 95.5 moveto
669.333904406312 91.4887047967717 lineto
672.606417408566 90.3799062757217 lineto
673.269529093289 89.6313858060061 lineto
673.975686199375 86.2490615087619 lineto
679.14 95.5 lineto
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
22 32 moveto 687 0 rlineto 0 -30 rlineto -687 0 rlineto closepath
0.275 0.510 0.706 setrgbcolor AdjustColor
fill
grestore
gsave
79.723 32 moveto
79.723 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
79.723 19 [
    (0.0030)
] 14 -0.5 0 0 () false DrawText
grestore
gsave
194.239 32 moveto
194.239 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
194.239 19 [
    (0.0035)
] 14 -0.5 0 0 () false DrawText
grestore
gsave
308.755 32 moveto
308.755 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
308.755 19 [
    (0.0040)
] 14 -0.5 0 0 () false DrawText
grestore
gsave
423.27 32 moveto
423.27 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
423.27 19 [
    (0.0045)
] 14 -0.5 0 0 () false DrawText
grestore
gsave
537.79 32 moveto
537.79 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
537.79 19 [
    (0.0050)
] 14 -0.5 0 0 () false DrawText
grestore
gsave
652.3 32 moveto
652.3 22 lineto
1 setlinewidth
0 setlinecap
1 setlinejoin
1.000 1.000 1.000 setrgbcolor AdjustColor
stroke
grestore
gsave
/Helvetica-Bold findfont 12 scalefont setfont
1.000 1.000 1.000 setrgbcolor AdjustColor
652.3 19 [
    (0.0055)
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
