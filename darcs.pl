#!/usr/bin/perl -w

# bash runit

my $w = 8000;
my $h = 8000;

sub out($)
{
	my $s = shift;
	print $s, ";\n";
}

sub outA($@)
{
	my $s = shift;
	out($s . join(',', @_));
}

sub sp($)
{
	my $s = shift;
	out("SP" . $s);
}

sub pu()
{
	out("PU");
}

sub pd()
{
	out("PD");
}

sub ro($)
{
	my $r = shift;
	outA("RO", $r);
}

sub pen_absolute($$)
{
	my $x = shift;
	my $y = shift;
	outA("PA", $x, $y);
}

sub edge_rect_absolute($$)
{
	my $dx = shift;
	my $dy = shift;
	outA("EA", $dx, $dy);
}

sub edge_rect_relative($$)
{
	my $dx = shift;
	my $dy = shift;
	outA("ER", $dx, $dy);
}

sub arc_absolute($$$)
{
	my $x = shift;
	my $y = shift;
	my $a = shift;
	outA("AA", $x, $y, $a);
}

sub in()
{
	out("IN");
}

sub circle_relative($)
{
	my $r = shift;
	outA("CI", $r);
}

sub text($)
{
	my $s = shift;
	out("LB" . $s);
}

sub bezier_abs($$$$$$)
{
	my $c1x = shift;
	my $c1y = shift;
	my $c2x = shift;
	my $c2y = shift;
	my $c3x = shift;
	my $c3y = shift;
	outA("BR", $c1x, $c1y, $c2x, $c2y, $c3x, $c3y);
}

sub arc_three($$$$)
{
	my $xi = shift;
	my $yi = shift;
	my $xe = shift;
	my $ye = shift;
	outA("AT", $xi, $yi, $xe, $ye);
}

###
in();

sub darc($$$)
{
	my $sx = shift;
	my $sy = shift;
	my $d = shift;

	for (my $i = 0;  $i < 30;  $i++) {
		my $xp = $i * 100;
		my $yp = $i * 100;

		$xp += ($sx);
		$yp += ($sy);

		sp(1);
#		pen_absolute($xp, $yp);
		pd();
#		arc_absolute($sx, $sy, $d * sin(15 * $i));
		arc_absolute($xp + $d * sin($i * 45), $yp + $d * cos($i * 45), 45);
		pu();
	}
}

sub darc2($$$)
{
	my $sx = shift;
	my $sy = shift;
	my $sd = shift;

	my $n = 9;
	for (my $i = 0;  $i < $n;  $i++) {
		my $d = ($sd - ($i * ($sd / $n)));

#		pen_absolute($sx, $sy);
#		sp(1); pd(); circle_relative(10); pu();

#		pen_absolute($sx + ($d * sin(45)), $sy - ($d * cos(45)));
#		sp(1); pd(); circle_relative(30); pu();
		
#		pen_absolute($sx, $sy + $d);
#		sp(1); pd(); circle_relative(50); pu();

		pen_absolute($sx, $sy);
		pd();
		arc_three($sx + ($d * sin(45)), $sy - ($d * cos(45)), # $sx + $d, $sy, 
				  $sx, $sy + $d);
#		pu();
	}
}

sub framePage($)
{
	my $p = shift;
	sp($p);

	pen_absolute(10, 10);
	pd();
	edge_rect_absolute($w - 20, $h - 20);
	pu();
}

framePage(1);

my $d = ($w / 10);

if (0) {
sp(1);
for (my $i = 0;  $i < 360; $i += 3) {
	pen_absolute(($w / 2) + $d + ($d * 2 * sin($i)), ($h / 2) + $d + ($d * 2 * cos($i)));
	pd();
	circle_relative(800);
	pu();
}
}

#exit;
	
#pen_absolute(1000,5000);
#pd();
#bezier_abs(2000,8000,4000,2000,5000,5000);
#pu();

#exit;

sp(1);
pen_absolute(1000, 1000);
for (my $i = 0;  $i < 100;  $i++) {
	my $v = 80;
	pd();
	pen_absolute($d + 1000, $d + 5000);
	bezier_abs($d + 2000 - 4000, $d + 8000 - 4000, $d + 4000 + ($i * $v) - 4000,$d + 2000 + ($i * $v) - 4000,$d + 5000 - ($i * $v) - 4000,$d + 5000 - ($i * $v) - 4000);
	pu();
}
pu();

exit;

sp(1);
pen_absolute(0, 0);
pd();
edge_rect_absolute($w, $h);
pu();

sp(1);
for (my $r = 0;  $r < 60;  $r++) {
	ro($r);
	pen_absolute($d + $r, $d + $r);
	pd();
	edge_rect_relative($r * 100, $r * 100);
	pu();
#	ro(-$r);
}
	
exit;

for (my $r = 0;  $r < 6;  $r += 2) {
	for (my $c = 0;  $c < 6;  $c += 2) {
#		sp(1 + (($r * 6) + $c) % 8);
#		sp(1);
		darc($r * ($h / 6) + $d, $c * ($w / 6) + $d, $d);
	}
}

exit;

sp(1);
darc2(0, 0, 900 / 4);
sp(2);
darc2(900, 0, 900 / 4);
sp(3);
darc2(0, 900, 900 / 4);
sp(4);
darc2(900, 900, 900 / 4);

exit;
			   
sp(1);
pen_absolute(100, 0);
circle_relative(10);
pd();
arc_three(200, 100, 0, 100);
pu();
sp(2);
pd();
circle_relative(5);
pu();
exit;

sp(1);
darc(0, 0, 270);
sp(2);
darc($w, 0, -90);
#sp(2);
#darc(0, 800, -(2 * 3));
#sp(3);
#darc(700, 0, 1);
#sp(4);
#darc(700, 800, -1);
