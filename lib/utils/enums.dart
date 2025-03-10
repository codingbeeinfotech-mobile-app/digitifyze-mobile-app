enum CheckInOutAction {
  checkIn(0),
  checkOut(1),
  extend(2);

  final int value;

  const CheckInOutAction(this.value);
}

enum PicType {
  profile,
  adharFront,
  adharBack,
  pan,
  dl,
  rc,
  noc,
  bankCheque,
  selfie,
  bill,
  rickshawId,
  batteryId,
  chargerId,
  other,
}
