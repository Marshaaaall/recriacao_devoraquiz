import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => this._animation;
}
