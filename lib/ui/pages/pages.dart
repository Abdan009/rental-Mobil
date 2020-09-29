import 'dart:async';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rental_mobil/bloc/blocs.dart';
import 'package:rental_mobil/services/services.dart';
import 'package:rental_mobil/shared/shared.dart';
import 'package:rental_mobil/ui/pages/konsumen/konsumen_page.dart';
import 'package:rental_mobil/ui/pages/pemilik/pemilik_page.dart';
import 'package:rental_mobil/ui/widgets/widgets.dart';

part 'login_page.dart';
part 'sign_up_page.dart';
part 'splash_screen.dart';
part 'wrapper.dart';
part 'main_page.dart';