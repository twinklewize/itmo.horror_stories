gen:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

get:
	fvm flutter pub get

reincarnate:
	fvm flutter clean & fvm flutter pub get & fvm flutter doctor

build_web:
	fvm flutter build web