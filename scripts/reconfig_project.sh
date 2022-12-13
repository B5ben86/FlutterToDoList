#bin/sh

cd ../
flutter clean
flutter packages pub get
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
