#bin/sh

cd ../
flutter clean
flutter packages pub get
flutter pub run build_runner build