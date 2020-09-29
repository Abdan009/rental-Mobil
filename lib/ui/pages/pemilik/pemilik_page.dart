//import 'dart:async';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rental_mobil/bloc/blocs.dart';
import 'package:rental_mobil/models/models.dart';
import 'package:rental_mobil/services/services.dart';
import 'package:rental_mobil/shared/shared.dart';
import 'package:rental_mobil/ui/pages/konsumen/konsumen_page.dart';
import 'package:rental_mobil/ui/pages/pages.dart';
import 'package:rental_mobil/ui/widgets/widgets.dart';
import 'package:rental_mobil/extensions/extensions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

part 'home_pemilik.dart';
part 'transaksi_pemilik_page.dart';
part 'mobil_pemilik.dart';
part 'profil_pemilik.dart';
part 'add_mobil_page.dart';
part 'edit_profil_pemilik.dart';
part 'detail_transaksi_pemilik.dart';
part 'detail_konsumen.dart';