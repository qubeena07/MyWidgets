import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:my_widgets/screens/interactive_screen.dart';
import 'package:my_widgets/screens/open_container_transform.dart';
import 'package:my_widgets/screens/pdf/invoice_page.dart';
import 'package:my_widgets/screens/pedometer_screen.dart';
import 'package:my_widgets/screens/pos_screen.dart';
import 'package:my_widgets/screens/rive_animation.dart';
import 'package:my_widgets/screens/riverpod_family_screen.dart';
import 'package:my_widgets/screens/riverpod_screen.dart';
import 'package:my_widgets/screens/rotation_animation_screen.dart';
import 'package:my_widgets/screens/slide_screen.dart';
import 'package:my_widgets/screens/smartphone_screen.dart';
import 'package:my_widgets/screens/speech_to_text.dart';
import 'package:my_widgets/screens/street_view_panaroma.dart';
import 'package:my_widgets/screens/stripe_screen.dart';
import 'package:my_widgets/screens/tic_tac_toe_screen.dart';
import 'package:my_widgets/screens/timeline_screen.dart';
import 'package:my_widgets/screens/url_launcher_screen.dart';
import 'package:my_widgets/screens/wave_custom_painter_screen.dart';
import 'package:my_widgets/screens/webview_screen.dart';
import 'package:my_widgets/screens/wifi_scan.dart';

import '../api/login_api.dart';
import '../repo/demo_screen.dart';
import '../widgets/download_button.dart';
import '../widgets/home_card_widget.dart';
import 'aegis_widget.dart';
import 'age_slider.dart';
import 'analog_clock_screen.dart';
import 'animated_text_screen.dart';
import 'azlist_screen.dart';
import 'background_rive_screen.dart';
import 'barcode_generator_screen.dart';
import 'barcode_scanner.dart';
import 'bluetooth_screen.dart';
import 'card_swiper.dart';
import 'charts_screen.dart';
import 'circular_progress_screen.dart';
import 'clock_screen.dart';
import 'cp_background_screen.dart';
import 'cube_swipe.dart';
import 'custom_painter_screen.dart';
import 'draggable_screen.dart';
import 'drawing_screen.dart';
import 'fade_scale_transition.dart';
import 'fade_through_transition.dart';
import 'flutter_web_screen.dart';
import 'generate_qr_screen.dart';
import 'gesture/gesture_one.dart';
import 'hero_screen.dart';
import 'in_app_update_screen.dart';
import 'internet_checker_screen.dart';
import 'ios_home_screen.dart';
import 'jail_break_detection.dart';
import 'lazy_loading_screen.dart';
import 'list_view_animation_screen.dart';
import 'location_screen.dart';
import 'location_tracking_screen.dart';
import 'modern_wheel_scroll.dart';
import 'my_pay_screen.dart';
import 'paypal_payment_screen.dart';
import 'shared_axis.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool autoPlay = false;
  bool autoPlay1 = false;
  final GlobalClass aa = GlobalClass();

  _onExit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Are you sure you want to exit the app?'),
        actions: [
          TextButton(
              onPressed: () {
                exit(0);
              },
              child: const Text('YES')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('NO')),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    // var productModel = Provider.of<NetworkApi>(context).getProduct();
    return WillPopScope(
      onWillPop: () => _onExit(),
      child: SafeArea(
        child: Scaffold(
          body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color.fromARGB(255, 18, 144, 248).withOpacity(0.4),
                const Color.fromARGB(255, 66, 239, 72).withOpacity(0.5),
                const Color.fromARGB(255, 131, 73, 231).withOpacity(0.6),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RefreshIndicator(
                  color: Colors.green,
                  onRefresh: () async {
                    await Future.delayed(const Duration(seconds: 10));
                  },
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 10.0,
                    children: [
                      ShakeWidget(
                        shakeConstant: ShakeChunkConstant(),
                        autoPlay: autoPlay,
                        child: HomeCardWidget(
                          onLongTap: () {
                            setState(() {
                              autoPlay = !autoPlay;
                            });
                          },
                          title: "Shimmer",
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const ProductScreen(),
                            //     ));
                          },
                          iconData: Icons.done,
                        ),
                      ),
                      ShakeWidget(
                        shakeConstant: ShakeLittleConstant2(),
                        autoPlay: autoPlay1,
                        child: HomeCardWidget(
                            title: "Custom Painter",
                            iconData: Icons.draw,
                            onLongTap: () {
                              setState(() {
                                autoPlay1 = !autoPlay1;
                              });
                            },
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomPainterScreen(),
                                  ));
                            }),
                      ),
                      HomeCardWidget(
                          title: "Custom Painter Background",
                          iconData: Icons.piano,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CpBackgroundScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Wave custom painter",
                          iconData: Icons.waves,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const WaveCustomPainterScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Animated circular progess",
                          iconData: Icons.blur_circular,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CircularProgressScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Speech to text",
                          iconData: Icons.speaker,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SpeechTpTextScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Rive Animation",
                          iconData: Icons.animation,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RiveAnimationScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Rive Animation Background",
                          iconData: Icons.auto_fix_normal_sharp,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BackgroundRiveScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Internet Checker",
                          iconData: Icons.wifi,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const InternetCheckerScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Your Location",
                          iconData: Icons.location_history,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LocationScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          iconData: Icons.text_fields_sharp,
                          title: "Animated Text",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AnimatedTextScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Live Location Tracking",
                          iconData: Icons.track_changes,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LocationTrackingScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Custom Painter Demo",
                          iconData: Icons.draw_sharp,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DemoScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Flutter web screen",
                          iconData: Icons.web,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const FlutterWebScreen(),
                                ));
                          }),
                      Hero(
                        tag: "DemoTag",
                        child: HomeCardWidget(
                            title: "Hero ",
                            iconData: Icons.add,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HeroScreen(),
                                  ));
                            }),
                      ),
                      HomeCardWidget(
                          title: "Lazy Loading Screen",
                          iconData: Icons.refresh,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LazyLoadingScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Charts Screen",
                          iconData: Icons.pie_chart,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChartScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "In app update",
                          iconData: Icons.update,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const InAppUpdateScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "List View Animation",
                          iconData: Icons.list,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ListViewAnimationScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Rotation Animation Screen",
                          iconData: Icons.rotate_90_degrees_ccw,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RotationAnimationScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Drawing screen",
                          iconData: Icons.draw_outlined,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DrawingScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Cupertino Download",
                          iconData: Icons.download,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ExampleCupertinoDownloadButton(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "IoS Design",
                          iconData: Icons.home,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const IosHomeScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Bluetooth Printer",
                          iconData: Icons.bluetooth,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BluetoothScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Custom Clock",
                          iconData: Icons.punch_clock,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ClockScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Analog Clock",
                          iconData: Icons.lock_clock,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AnalogClockScreen()));
                          }),
                      HomeCardWidget(
                          title: "Barcode Generator",
                          iconData: Icons.barcode_reader,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BarcodeGeneratorScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Url Launcher",
                          iconData: Icons.email,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const UrlLauncherScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "PDF Generator and Viewer",
                          iconData: Icons.picture_as_pdf,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InvoicePage(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Riverpod Get",
                          iconData: Icons.picture_as_pdf,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RiverpodScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Riverpod Next",
                          iconData: Icons.room_service_sharp,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SmartphoneScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Riverpod Family",
                          iconData: Icons.family_restroom,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RiverpodFamilyScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Aegis Widget",
                          iconData: Icons.hotel_rounded,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AegisWidget(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "POS Screen",
                          iconData: Icons.hotel_rounded,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PosScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Draggable widget",
                          iconData: Icons.hotel_rounded,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DraggableScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Barcode Scanner",
                          iconData: Icons.document_scanner_outlined,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BarcodeScanner(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "My Pay Integration",
                          iconData: Icons.document_scanner_outlined,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyPayScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Tic Tac Toe",
                          iconData: Icons.disc_full_sharp,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TicTacToeScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "SignUp with Google",
                          iconData: Icons.disc_full_sharp,
                          onTap: () async {
                            var user = await aa.googleSignIn.signIn();
                            if (user != null) {
                              log(user.id.toString(), name: "id value");
                            }
                          }),
                      HomeCardWidget(
                          title: "Interactive Viewer",
                          iconData: Icons.view_day_rounded,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const InteractiveWidget(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Slider Widget",
                          iconData: Icons.slideshow,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SlideScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Timeline Widget",
                          iconData: Icons.timeline_outlined,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TimelineScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Cube Swipe",
                          iconData: Icons.swipe,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CubeSwipe(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Wifi Scan ",
                          iconData: Icons.wifi,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WifiScan(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Modern Wheel Scroll",
                          iconData: Icons.two_wheeler,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ModernWheelScroll(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Street view panaroma",
                          iconData: Icons.two_wheeler,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const StreetViewPanoramaInitDemo(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Pedometer",
                          iconData: Icons.two_wheeler,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PedometerScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "QR download",
                          iconData: Icons.download,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const GenerateScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Paypal Payment",
                          iconData: Icons.download,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PaypalPaymentScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Stripe Payment",
                          iconData: Icons.payment,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StripeScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Age Slider",
                          iconData: Icons.slideshow_rounded,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AgeSlider(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Container Gesture",
                          iconData: Icons.slideshow_rounded,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const GestureOne(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Swipe Card ",
                          iconData: Icons.swipe,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SwipeCardExample(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "A-Z LIST ",
                          iconData: Icons.list,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AZlistScreen(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Container Transform ",
                          iconData: Icons.check_box_outline_blank_outlined,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const OpenContainerTransform(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Fade through transition ",
                          iconData: Icons.face_rounded,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const FadeThroughTransitionDemo(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Fade scale transition ",
                          iconData: Icons.scale,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const FadeScaleTransitionDemo(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Shared axis transition ",
                          iconData: Icons.scale,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SharedAxisTransitionDemo(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Jail Break Detection",
                          iconData: Icons.breakfast_dining,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const JailBreakDetection(),
                                ));
                          }),
                      HomeCardWidget(
                          title: "Web view",
                          iconData: Icons.breakfast_dining,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WebviewScreen(),
                                ));
                          }),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
