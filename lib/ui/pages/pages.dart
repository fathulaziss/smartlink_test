import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smartlink_test/bloc/blocs.dart';
import 'package:smartlink_test/models/models.dart';
import 'package:smartlink_test/services/services.dart';
import 'package:smartlink_test/ui/widgets/widgets.dart';
import 'package:supercharged/supercharged.dart';
import 'package:smartlink_test/shared/shared.dart';
import 'package:get/get.dart';

part 'main_page.dart';
part 'splash_page.dart';
part 'general_page.dart';
part 'sign_in_page.dart';
part 'sign_up_page.dart';
part 'laundry_page.dart';
part 'wrapper.dart';
