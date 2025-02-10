//valuedNotifier => hold the data / store the data
//valueListenableBuilder => listen to data change (dont need setState())

import 'package:flutter/material.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);
ValueNotifier<bool> isDarkMode = ValueNotifier(false);
ValueNotifier<bool> isLogin = ValueNotifier(false);