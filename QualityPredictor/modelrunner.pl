#!/usr/bin/perl
#*************************************************************************
#
#   Program:    QualityPredictor
#   File:       modelrunner.pl
#   
#   Date:       15.03.2018
#   Function:   Runs the machine learning models 
#   Author:     Charlie Barker
#   EMail:      zcbtark@ucl.ac.uk
#
#*************************************************************************
#
#   Description:
#   ============
#
#*************************************************************************
#
#   Usage:
#   ======
#
#*************************************************************************
#
#   Revision History:
#   =================
#
#*************************************************************************
use strict;
use config; 

my $input = shift(@ARGV);
my @models = `ls $config::mlModels -B`;
my @modelList;
my @modelLocation;
foreach my $model (@models){
	chop($model);
	push @modelList, $model;
	my @elements = split(/DATA/, $model);
	my $modelLoc = $elements[0];
	push @modelLocation, $modelLoc;
}
my $no = 40; 
for(my $i=0; $i<$no; $i++) {
	my $result =`java weka.classifiers.$modelLocation[$i] -T $input -l $config::mlModels/$modelList[$i] -p 0\n`;
	print "$modelList[$i]\n";
	print "$result\n";
}