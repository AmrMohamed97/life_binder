import 'package:flutter/material.dart';

class SizeConfig {
  static dynamic phoneWidth,phoneHeight,bodyHeight,saveArea,appBarHeight;
  static Orientation? orientation;
  BuildContext context;
  SizeConfig(
      this.context
      ) {
    phoneWidth=MediaQuery.of(context).size.width;
    phoneHeight=MediaQuery.of(context).size.height;
    saveArea=MediaQuery.of(context).padding.top;
    appBarHeight=AppBar().preferredSize.height;
    orientation=MediaQuery.of(context).orientation;
  }
  //const size to avoid orientation
  late double defaultSize=orientation==Orientation.landscape?phoneHeight * .011672326:phoneWidth * .025462963;
  //height........
  late double height1=phoneHeight * .0011672326;
  late double height2=phoneHeight * .0023344652;
  late double height3=phoneHeight * .00350169779;
  late double height4=phoneHeight * .00466893039;
  late double height5=phoneHeight * .005836163;
  late double height6=phoneHeight * .00700339559;
  late double height7=phoneHeight * .0081706283;
  late double height8=phoneHeight * .00933786078;
  late double height9=phoneHeight * .01050509338;
  late double height10=phoneHeight * .011672326;
  late double height20=phoneHeight * .023344652;
  late double height30=phoneHeight * .0350169779;
  late double height40=phoneHeight * .0466893039;
  late double height50=phoneHeight * .05836163;
  late double height60=phoneHeight * .0700339559;
  late double height70=phoneHeight * .081706283;
  late double height80=phoneHeight * .0933786078;
  late double height90=phoneHeight * .1050509338;
  late double height100=phoneHeight * .11672326;
  late double height200=phoneHeight * .23344652;

  //width......
  late double width1=phoneWidth * .0025462963;
  late double width2=phoneWidth * .0050925926;
  late double width3=phoneWidth * .0076388889;
  late double width4=phoneWidth * .01018518519;
  late double width5=phoneWidth * .01273148147;
  late double width6=phoneWidth * .01527777777;
  late double width7=phoneWidth * .01782407407;
  late double width8=phoneWidth * .02037037037;
  late double width9=phoneWidth * .02291666667;
  late double width10=phoneWidth * .025462963;
  late double width20=phoneWidth * .050925926;
  late double width30=phoneWidth * .076388889;
  late double width40=phoneWidth * .1018518519;
  late double width50=phoneWidth * .1273148147;
  late double width60=phoneWidth * .1527777777;
  late double width70=phoneWidth * .1782407407;
  late double width80=phoneWidth * .2037037037;
  late double width90=phoneWidth * .2291666667;
  late double width100=phoneWidth * .25462963;
  late double width200=phoneWidth * .50925926;

}