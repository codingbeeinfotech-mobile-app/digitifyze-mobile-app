// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `MabaatApp`
  String get appName {
    return Intl.message(
      'MabaatApp',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Dizitifyze`
  String get dizitifyze {
    return Intl.message(
      'Dizitifyze',
      name: 'dizitifyze',
      desc: '',
      args: [],
    );
  }

  /// `Journey With`
  String get journeyWith {
    return Intl.message(
      'Journey With',
      name: 'journeyWith',
      desc: '',
      args: [],
    );
  }

  /// `No Data Found`
  String get noDataFound {
    return Intl.message(
      'No Data Found',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `Travel, Work,\nRelax And Leave\nThe Rest To Us..`
  String get startedMessage {
    return Intl.message(
      'Travel, Work,\nRelax And Leave\nThe Rest To Us..',
      name: 'startedMessage',
      desc: '',
      args: [],
    );
  }

  /// `GET STARTED`
  String get getStarted {
    return Intl.message(
      'GET STARTED',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `CHECK IN`
  String get checkIn {
    return Intl.message(
      'CHECK IN',
      name: 'checkIn',
      desc: '',
      args: [],
    );
  }

  /// `CHECK OUT`
  String get checkOut {
    return Intl.message(
      'CHECK OUT',
      name: 'checkOut',
      desc: '',
      args: [],
    );
  }

  /// `EXTEND`
  String get extend {
    return Intl.message(
      'EXTEND',
      name: 'extend',
      desc: '',
      args: [],
    );
  }

  /// `Document Id`
  String get documentId {
    return Intl.message(
      'Document Id',
      name: 'documentId',
      desc: '',
      args: [],
    );
  }

  /// `Passport Number`
  String get passportNumber {
    return Intl.message(
      'Passport Number',
      name: 'passportNumber',
      desc: '',
      args: [],
    );
  }

  /// `Guest Name`
  String get guestName {
    return Intl.message(
      'Guest Name',
      name: 'guestName',
      desc: '',
      args: [],
    );
  }

  /// `Reservation ID`
  String get reservationID {
    return Intl.message(
      'Reservation ID',
      name: 'reservationID',
      desc: '',
      args: [],
    );
  }

  /// `NEW RESERVATION`
  String get newReservation {
    return Intl.message(
      'NEW RESERVATION',
      name: 'newReservation',
      desc: '',
      args: [],
    );
  }

  /// `enter`
  String get enter {
    return Intl.message(
      'enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Mabaat`
  String get welcomeToMabaat {
    return Intl.message(
      'Welcome to Mabaat',
      name: 'welcomeToMabaat',
      desc: '',
      args: [],
    );
  }

  /// `Short-term stays for long-term memories.\nThat's the Mabaat Promise.`
  String get checkInDetailsMsg {
    return Intl.message(
      'Short-term stays for long-term memories.\nThat\'s the Mabaat Promise.',
      name: 'checkInDetailsMsg',
      desc: '',
      args: [],
    );
  }

  /// `Reservation number`
  String get reservationNumber {
    return Intl.message(
      'Reservation number',
      name: 'reservationNumber',
      desc: '',
      args: [],
    );
  }

  /// `Guest name(s)`
  String get guestNames {
    return Intl.message(
      'Guest name(s)',
      name: 'guestNames',
      desc: '',
      args: [],
    );
  }

  /// `Property Name`
  String get propertyName {
    return Intl.message(
      'Property Name',
      name: 'propertyName',
      desc: '',
      args: [],
    );
  }

  /// `Unit Number`
  String get unitNumber {
    return Intl.message(
      'Unit Number',
      name: 'unitNumber',
      desc: '',
      args: [],
    );
  }

  /// `Check-in`
  String get checkInWithDash {
    return Intl.message(
      'Check-in',
      name: 'checkInWithDash',
      desc: '',
      args: [],
    );
  }

  /// `Check-out`
  String get checkOutWithDash {
    return Intl.message(
      'Check-out',
      name: 'checkOutWithDash',
      desc: '',
      args: [],
    );
  }

  /// `No. of nights`
  String get noOfNights {
    return Intl.message(
      'No. of nights',
      name: 'noOfNights',
      desc: '',
      args: [],
    );
  }

  /// `Room Type`
  String get roomType {
    return Intl.message(
      'Room Type',
      name: 'roomType',
      desc: '',
      args: [],
    );
  }

  /// `Door access Code`
  String get doorAccessCode {
    return Intl.message(
      'Door access Code',
      name: 'doorAccessCode',
      desc: '',
      args: [],
    );
  }

  /// `Wifi Password`
  String get wifiPassword {
    return Intl.message(
      'Wifi Password',
      name: 'wifiPassword',
      desc: '',
      args: [],
    );
  }

  /// `Booking Details`
  String get bookingDetails {
    return Intl.message(
      'Booking Details',
      name: 'bookingDetails',
      desc: '',
      args: [],
    );
  }

  /// `PRINT`
  String get print {
    return Intl.message(
      'PRINT',
      name: 'print',
      desc: '',
      args: [],
    );
  }

  /// `SHARE`
  String get share {
    return Intl.message(
      'SHARE',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Mabaat`
  String get mabaat {
    return Intl.message(
      'Mabaat',
      name: 'mabaat',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Guests`
  String get guests {
    return Intl.message(
      'Guests',
      name: 'guests',
      desc: '',
      args: [],
    );
  }

  /// `CHECK AVAILABILITY`
  String get checkAvailability {
    return Intl.message(
      'CHECK AVAILABILITY',
      name: 'checkAvailability',
      desc: '',
      args: [],
    );
  }

  /// `Powered By: WOSUL`
  String get poweredByWosul {
    return Intl.message(
      'Powered By: WOSUL',
      name: 'poweredByWosul',
      desc: '',
      args: [],
    );
  }

  /// `Analytics`
  String get analytics {
    return Intl.message(
      'Analytics',
      name: 'analytics',
      desc: '',
      args: [],
    );
  }

  /// `Add Lead`
  String get addLead {
    return Intl.message(
      'Add Lead',
      name: 'addLead',
      desc: '',
      args: [],
    );
  }

  /// `Edit Lead`
  String get editLead {
    return Intl.message(
      'Edit Lead',
      name: 'editLead',
      desc: '',
      args: [],
    );
  }

  /// `Update Lead`
  String get updateLead {
    return Intl.message(
      'Update Lead',
      name: 'updateLead',
      desc: '',
      args: [],
    );
  }

  /// `KYC Verification`
  String get kycVerification {
    return Intl.message(
      'KYC Verification',
      name: 'kycVerification',
      desc: '',
      args: [],
    );
  }

  /// `OnBoarding`
  String get onBoarding {
    return Intl.message(
      'OnBoarding',
      name: 'onBoarding',
      desc: '',
      args: [],
    );
  }

  /// `Product Assign`
  String get productAssign {
    return Intl.message(
      'Product Assign',
      name: 'productAssign',
      desc: '',
      args: [],
    );
  }

  /// `Agreement Generation`
  String get agreementGeneration {
    return Intl.message(
      'Agreement Generation',
      name: 'agreementGeneration',
      desc: '',
      args: [],
    );
  }

  /// `Assets Management`
  String get assetsManagement {
    return Intl.message(
      'Assets Management',
      name: 'assetsManagement',
      desc: '',
      args: [],
    );
  }

  /// `Payment Tracker`
  String get paymentTracker {
    return Intl.message(
      'Payment Tracker',
      name: 'paymentTracker',
      desc: '',
      args: [],
    );
  }

  /// `Service Ticketing`
  String get serviceTicketing {
    return Intl.message(
      'Service Ticketing',
      name: 'serviceTicketing',
      desc: '',
      args: [],
    );
  }

  /// `Leads`
  String get leads {
    return Intl.message(
      'Leads',
      name: 'leads',
      desc: '',
      args: [],
    );
  }

  /// `Search Lead`
  String get searchLead {
    return Intl.message(
      'Search Lead',
      name: 'searchLead',
      desc: '',
      args: [],
    );
  }

  /// `Partner ID`
  String get partnerId {
    return Intl.message(
      'Partner ID',
      name: 'partnerId',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Search Partner ID`
  String get searchPartnerId {
    return Intl.message(
      'Search Partner ID',
      name: 'searchPartnerId',
      desc: '',
      args: [],
    );
  }

  /// `Lead Name`
  String get leadName {
    return Intl.message(
      'Lead Name',
      name: 'leadName',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Lead ID`
  String get leadID {
    return Intl.message(
      'Lead ID',
      name: 'leadID',
      desc: '',
      args: [],
    );
  }

  /// `Referral/Influencer ID`
  String get referralInfluencerID {
    return Intl.message(
      'Referral/Influencer ID',
      name: 'referralInfluencerID',
      desc: '',
      args: [],
    );
  }

  /// `Referral ID`
  String get referralID {
    return Intl.message(
      'Referral ID',
      name: 'referralID',
      desc: '',
      args: [],
    );
  }

  /// `Influencer ID`
  String get influencerID {
    return Intl.message(
      'Influencer ID',
      name: 'influencerID',
      desc: '',
      args: [],
    );
  }

  /// `Lead Remark`
  String get leadRemark {
    return Intl.message(
      'Lead Remark',
      name: 'leadRemark',
      desc: '',
      args: [],
    );
  }

  /// `Generated By`
  String get generatedBy {
    return Intl.message(
      'Generated By',
      name: 'generatedBy',
      desc: '',
      args: [],
    );
  }

  /// `Add Date`
  String get addDate {
    return Intl.message(
      'Add Date',
      name: 'addDate',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Lead Source`
  String get leadSource {
    return Intl.message(
      'Lead Source',
      name: 'leadSource',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Father Name`
  String get fatherName {
    return Intl.message(
      'Father Name',
      name: 'fatherName',
      desc: '',
      args: [],
    );
  }

  /// `Mobile No`
  String get mobileNo {
    return Intl.message(
      'Mobile No',
      name: 'mobileNo',
      desc: '',
      args: [],
    );
  }

  /// `Alternate No`
  String get alternateNo {
    return Intl.message(
      'Alternate No',
      name: 'alternateNo',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Land Mark`
  String get landMark {
    return Intl.message(
      'Land Mark',
      name: 'landMark',
      desc: '',
      args: [],
    );
  }

  /// `Pin Code`
  String get pinCode {
    return Intl.message(
      'Pin Code',
      name: 'pinCode',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Cluster`
  String get cluster {
    return Intl.message(
      'Cluster',
      name: 'cluster',
      desc: '',
      args: [],
    );
  }

  /// `Dealer`
  String get dealer {
    return Intl.message(
      'Dealer',
      name: 'dealer',
      desc: '',
      args: [],
    );
  }

  /// `Business Segment`
  String get businessSegment {
    return Intl.message(
      'Business Segment',
      name: 'businessSegment',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Type`
  String get vehicleType {
    return Intl.message(
      'Vehicle Type',
      name: 'vehicleType',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Finance Status`
  String get vehicleFinanceStatus {
    return Intl.message(
      'Vehicle Finance Status',
      name: 'vehicleFinanceStatus',
      desc: '',
      args: [],
    );
  }

  /// `Service Type`
  String get serviceType {
    return Intl.message(
      'Service Type',
      name: 'serviceType',
      desc: '',
      args: [],
    );
  }

  /// `Sales Type`
  String get salesType {
    return Intl.message(
      'Sales Type',
      name: 'salesType',
      desc: '',
      args: [],
    );
  }

  /// `Move To Kyc Verification`
  String get moveToKycVerification {
    return Intl.message(
      'Move To Kyc Verification',
      name: 'moveToKycVerification',
      desc: '',
      args: [],
    );
  }

  /// `Marital Status`
  String get maritalStatus {
    return Intl.message(
      'Marital Status',
      name: 'maritalStatus',
      desc: '',
      args: [],
    );
  }

  /// `Aadhar No`
  String get aadharNo {
    return Intl.message(
      'Aadhar No',
      name: 'aadharNo',
      desc: '',
      args: [],
    );
  }

  /// `Aadhar Pic Front`
  String get aadharPicFront {
    return Intl.message(
      'Aadhar Pic Front',
      name: 'aadharPicFront',
      desc: '',
      args: [],
    );
  }

  /// `Aadhar Pic Back`
  String get aadharPicBack {
    return Intl.message(
      'Aadhar Pic Back',
      name: 'aadharPicBack',
      desc: '',
      args: [],
    );
  }

  /// `DOB`
  String get dob {
    return Intl.message(
      'DOB',
      name: 'dob',
      desc: '',
      args: [],
    );
  }

  /// `Pan No`
  String get panNo {
    return Intl.message(
      'Pan No',
      name: 'panNo',
      desc: '',
      args: [],
    );
  }

  /// `Pan Card Pic`
  String get panCardPic {
    return Intl.message(
      'Pan Card Pic',
      name: 'panCardPic',
      desc: '',
      args: [],
    );
  }

  /// `Current Address`
  String get currentAddress {
    return Intl.message(
      'Current Address',
      name: 'currentAddress',
      desc: '',
      args: [],
    );
  }

  /// `Permanent Address`
  String get permanentAddress {
    return Intl.message(
      'Permanent Address',
      name: 'permanentAddress',
      desc: '',
      args: [],
    );
  }

  /// `Same as Current Address`
  String get sameAsCurrentAddress {
    return Intl.message(
      'Same as Current Address',
      name: 'sameAsCurrentAddress',
      desc: '',
      args: [],
    );
  }

  /// `Smart Phone User`
  String get smartPhoneUser {
    return Intl.message(
      'Smart Phone User',
      name: 'smartPhoneUser',
      desc: '',
      args: [],
    );
  }

  /// `General Information`
  String get generalInformation {
    return Intl.message(
      'General Information',
      name: 'generalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Information`
  String get vehicleInformation {
    return Intl.message(
      'Vehicle Information',
      name: 'vehicleInformation',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Ownership`
  String get vehicleOwnership {
    return Intl.message(
      'Vehicle Ownership',
      name: 'vehicleOwnership',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Make`
  String get vehicleMake {
    return Intl.message(
      'Vehicle Make',
      name: 'vehicleMake',
      desc: '',
      args: [],
    );
  }

  /// `NOC Documention`
  String get nocDocumention {
    return Intl.message(
      'NOC Documention',
      name: 'nocDocumention',
      desc: '',
      args: [],
    );
  }

  /// `Loan No`
  String get loanNo {
    return Intl.message(
      'Loan No',
      name: 'loanNo',
      desc: '',
      args: [],
    );
  }

  /// `DL No`
  String get dlNo {
    return Intl.message(
      'DL No',
      name: 'dlNo',
      desc: '',
      args: [],
    );
  }

  /// `DL Pic`
  String get dlPic {
    return Intl.message(
      'DL Pic',
      name: 'dlPic',
      desc: '',
      args: [],
    );
  }

  /// `RC No`
  String get rcNo {
    return Intl.message(
      'RC No',
      name: 'rcNo',
      desc: '',
      args: [],
    );
  }

  /// `RC Pic`
  String get rcPic {
    return Intl.message(
      'RC Pic',
      name: 'rcPic',
      desc: '',
      args: [],
    );
  }

  /// `Registration Date`
  String get registrationDate {
    return Intl.message(
      'Registration Date',
      name: 'registrationDate',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Age`
  String get vehicleAge {
    return Intl.message(
      'Vehicle Age',
      name: 'vehicleAge',
      desc: '',
      args: [],
    );
  }

  /// `Latitude`
  String get latitude {
    return Intl.message(
      'Latitude',
      name: 'latitude',
      desc: '',
      args: [],
    );
  }

  /// `Longitude`
  String get longitude {
    return Intl.message(
      'Longitude',
      name: 'longitude',
      desc: '',
      args: [],
    );
  }

  /// `Bank Information`
  String get bankInformation {
    return Intl.message(
      'Bank Information',
      name: 'bankInformation',
      desc: '',
      args: [],
    );
  }

  /// `Bank Name`
  String get bankName {
    return Intl.message(
      'Bank Name',
      name: 'bankName',
      desc: '',
      args: [],
    );
  }

  /// `Account No`
  String get accountNo {
    return Intl.message(
      'Account No',
      name: 'accountNo',
      desc: '',
      args: [],
    );
  }

  /// `IFSC Code`
  String get ifscCode {
    return Intl.message(
      'IFSC Code',
      name: 'ifscCode',
      desc: '',
      args: [],
    );
  }

  /// `Blank Cheque Pic`
  String get blankChequePic {
    return Intl.message(
      'Blank Cheque Pic',
      name: 'blankChequePic',
      desc: '',
      args: [],
    );
  }

  /// `ref.Information`
  String get refInformation {
    return Intl.message(
      'ref.Information',
      name: 'refInformation',
      desc: '',
      args: [],
    );
  }

  /// `Driver Pic`
  String get driverPic {
    return Intl.message(
      'Driver Pic',
      name: 'driverPic',
      desc: '',
      args: [],
    );
  }

  /// `Selfie With Driver + 5 Pics Optional`
  String get selfieWithDriver {
    return Intl.message(
      'Selfie With Driver + 5 Pics Optional',
      name: 'selfieWithDriver',
      desc: '',
      args: [],
    );
  }

  /// `Reference 1 Name`
  String get reference1Name {
    return Intl.message(
      'Reference 1 Name',
      name: 'reference1Name',
      desc: '',
      args: [],
    );
  }

  /// `Reference 2 Name`
  String get reference2Name {
    return Intl.message(
      'Reference 2 Name',
      name: 'reference2Name',
      desc: '',
      args: [],
    );
  }

  /// `Reference 2 Mobile No`
  String get reference2MobileNo {
    return Intl.message(
      'Reference 2 Mobile No',
      name: 'reference2MobileNo',
      desc: '',
      args: [],
    );
  }

  /// `Reference 1 Mobile No`
  String get reference1MobileNo {
    return Intl.message(
      'Reference 1 Mobile No',
      name: 'reference1MobileNo',
      desc: '',
      args: [],
    );
  }

  /// `Reference/Guarantor 1 Name`
  String get referenceGuarantor1Name {
    return Intl.message(
      'Reference/Guarantor 1 Name',
      name: 'referenceGuarantor1Name',
      desc: '',
      args: [],
    );
  }

  /// `Reference/Guarantor 2 Name`
  String get referenceGuarantor2Name {
    return Intl.message(
      'Reference/Guarantor 2 Name',
      name: 'referenceGuarantor2Name',
      desc: '',
      args: [],
    );
  }

  /// `Reference/Guarantor 2 Mobile No`
  String get referenceGuarantor2MobileNo {
    return Intl.message(
      'Reference/Guarantor 2 Mobile No',
      name: 'referenceGuarantor2MobileNo',
      desc: '',
      args: [],
    );
  }

  /// `Reference/Guarantor 1 Mobile No`
  String get referenceGuarantor1MobileNo {
    return Intl.message(
      'Reference/Guarantor 1 Mobile No',
      name: 'referenceGuarantor1MobileNo',
      desc: '',
      args: [],
    );
  }

  /// `House Ownership`
  String get houseOwnership {
    return Intl.message(
      'House Ownership',
      name: 'houseOwnership',
      desc: '',
      args: [],
    );
  }

  /// `Electricity Bill`
  String get electricityBill {
    return Intl.message(
      'Electricity Bill',
      name: 'electricityBill',
      desc: '',
      args: [],
    );
  }

  /// `Eletricity Bill / Water Bill Pic`
  String get electricityWaterBillPic {
    return Intl.message(
      'Eletricity Bill / Water Bill Pic',
      name: 'electricityWaterBillPic',
      desc: '',
      args: [],
    );
  }

  /// `Water Bill`
  String get waterBill {
    return Intl.message(
      'Water Bill',
      name: 'waterBill',
      desc: '',
      args: [],
    );
  }

  /// `jpg`
  String get jpg {
    return Intl.message(
      'jpg',
      name: 'jpg',
      desc: '',
      args: [],
    );
  }

  /// `png`
  String get png {
    return Intl.message(
      'png',
      name: 'png',
      desc: '',
      args: [],
    );
  }

  /// `CIBIL Score`
  String get cibilScore {
    return Intl.message(
      'CIBIL Score',
      name: 'cibilScore',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get accepted {
    return Intl.message(
      'Accepted',
      name: 'accepted',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Re-work`
  String get reWork {
    return Intl.message(
      'Re-work',
      name: 'reWork',
      desc: '',
      args: [],
    );
  }

  /// `Congrats!`
  String get congrats {
    return Intl.message(
      'Congrats!',
      name: 'congrats',
      desc: '',
      args: [],
    );
  }

  /// `Your KYC Verification\nSubmitted Successfully`
  String get yourKycVerificationSubmittedSuccessFully {
    return Intl.message(
      'Your KYC Verification\nSubmitted Successfully',
      name: 'yourKycVerificationSubmittedSuccessFully',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Your Password?`
  String get forgotYourPassword {
    return Intl.message(
      'Forgot Your Password?',
      name: 'forgotYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Journey with Digitifyze`
  String get splash1Title {
    return Intl.message(
      'Journey with Digitifyze',
      name: 'splash1Title',
      desc: '',
      args: [],
    );
  }

  /// `Simplify Your Business`
  String get splash1SubTitle {
    return Intl.message(
      'Simplify Your Business',
      name: 'splash1SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Smart Automation\nfor Efficiency`
  String get splash2Title {
    return Intl.message(
      'Smart Automation\nfor Efficiency',
      name: 'splash2Title',
      desc: '',
      args: [],
    );
  }

  /// `Track, Manage, & Analyze Seamlessly`
  String get splash2SubTitle {
    return Intl.message(
      'Track, Manage, & Analyze Seamlessly',
      name: 'splash2SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Manage Assets, Agreements, & Tickets`
  String get splash3Title {
    return Intl.message(
      'Manage Assets, Agreements, & Tickets',
      name: 'splash3Title',
      desc: '',
      args: [],
    );
  }

  /// `Control Every Aspect of Your Business.`
  String get splash3SubTitle {
    return Intl.message(
      'Control Every Aspect of Your Business.',
      name: 'splash3SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hassle-Free\nOnboarding & KYC`
  String get splash4Title {
    return Intl.message(
      'Hassle-Free\nOnboarding & KYC',
      name: 'splash4Title',
      desc: '',
      args: [],
    );
  }

  /// `Streamlined Onboarding & Lead Management.`
  String get splash4SubTitle {
    return Intl.message(
      'Streamlined Onboarding & Lead Management.',
      name: 'splash4SubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Emp Code`
  String get empCode {
    return Intl.message(
      'Emp Code',
      name: 'empCode',
      desc: '',
      args: [],
    );
  }

  /// `Last Login`
  String get lastLogin {
    return Intl.message(
      'Last Login',
      name: 'lastLogin',
      desc: '',
      args: [],
    );
  }

  /// `Clock In`
  String get clockIn {
    return Intl.message(
      'Clock In',
      name: 'clockIn',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Fixed Battery`
  String get fixedBattery {
    return Intl.message(
      'Fixed Battery',
      name: 'fixedBattery',
      desc: '',
      args: [],
    );
  }

  /// `Battery As Service`
  String get batteryAsService {
    return Intl.message(
      'Battery As Service',
      name: 'batteryAsService',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle As Service`
  String get vehicleAsService {
    return Intl.message(
      'Vehicle As Service',
      name: 'vehicleAsService',
      desc: '',
      args: [],
    );
  }

  /// `KYC Remark`
  String get kycRemark {
    return Intl.message(
      'KYC Remark',
      name: 'kycRemark',
      desc: '',
      args: [],
    );
  }

  /// `Payment Frequency`
  String get paymentFrequency {
    return Intl.message(
      'Payment Frequency',
      name: 'paymentFrequency',
      desc: '',
      args: [],
    );
  }

  /// `Scheme Name`
  String get schemeName {
    return Intl.message(
      'Scheme Name',
      name: 'schemeName',
      desc: '',
      args: [],
    );
  }

  /// `Down Payment`
  String get downPayment {
    return Intl.message(
      'Down Payment',
      name: 'downPayment',
      desc: '',
      args: [],
    );
  }

  /// `Loan Amount`
  String get loanAmount {
    return Intl.message(
      'Loan Amount',
      name: 'loanAmount',
      desc: '',
      args: [],
    );
  }

  /// `EMI Amount`
  String get emiAmount {
    return Intl.message(
      'EMI Amount',
      name: 'emiAmount',
      desc: '',
      args: [],
    );
  }

  /// `Tenure`
  String get tenure {
    return Intl.message(
      'Tenure',
      name: 'tenure',
      desc: '',
      args: [],
    );
  }

  /// `Payment Mode`
  String get paymentMode {
    return Intl.message(
      'Payment Mode',
      name: 'paymentMode',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Applied`
  String get couponApplied {
    return Intl.message(
      'Coupon Applied',
      name: 'couponApplied',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Code`
  String get couponCode {
    return Intl.message(
      'Coupon Code',
      name: 'couponCode',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Value`
  String get couponValue {
    return Intl.message(
      'Coupon Value',
      name: 'couponValue',
      desc: '',
      args: [],
    );
  }

  /// `Payable DP`
  String get payableDP {
    return Intl.message(
      'Payable DP',
      name: 'payableDP',
      desc: '',
      args: [],
    );
  }

  /// `Payable EMI`
  String get payableEmi {
    return Intl.message(
      'Payable EMI',
      name: 'payableEmi',
      desc: '',
      args: [],
    );
  }

  /// `Final`
  String get finalKey {
    return Intl.message(
      'Final',
      name: 'finalKey',
      desc: '',
      args: [],
    );
  }

  /// `Digital Receipt`
  String get digitalReceipt {
    return Intl.message(
      'Digital Receipt',
      name: 'digitalReceipt',
      desc: '',
      args: [],
    );
  }

  /// `Transaction ID`
  String get transactionID {
    return Intl.message(
      'Transaction ID',
      name: 'transactionID',
      desc: '',
      args: [],
    );
  }

  /// `E-Rickshaw ID`
  String get rickshawID {
    return Intl.message(
      'E-Rickshaw ID',
      name: 'rickshawID',
      desc: '',
      args: [],
    );
  }

  /// `Battery ID`
  String get batteryID {
    return Intl.message(
      'Battery ID',
      name: 'batteryID',
      desc: '',
      args: [],
    );
  }

  /// `Charger ID`
  String get chargerID {
    return Intl.message(
      'Charger ID',
      name: 'chargerID',
      desc: '',
      args: [],
    );
  }

  /// `Assets Handover Date`
  String get assetsHandoverDate {
    return Intl.message(
      'Assets Handover Date',
      name: 'assetsHandoverDate',
      desc: '',
      args: [],
    );
  }

  /// `EMI Start Date`
  String get emiStartDate {
    return Intl.message(
      'EMI Start Date',
      name: 'emiStartDate',
      desc: '',
      args: [],
    );
  }

  /// `Physical Warranty card Handover`
  String get physicalWarrantyCardHandover {
    return Intl.message(
      'Physical Warranty card Handover',
      name: 'physicalWarrantyCardHandover',
      desc: '',
      args: [],
    );
  }

  /// `Branding Material`
  String get brandingMaterial {
    return Intl.message(
      'Branding Material',
      name: 'brandingMaterial',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
