import 'dart:io';

import 'package:digitifyze/data/kyc_repo.dart';
import 'package:digitifyze/model/request/insert_lead_kyc_request.dart';
import 'package:digitifyze/model/response/lead_field_model.dart';
import 'package:digitifyze/model/response/lead_res_model.dart';

import '../utils/import_utils.dart';

abstract class KycService {
  Future<void> insertLeadKyc({
    required KycLeadRequest kycLeadRequest,
    required List<File> imagePath,
    required List<String> imageParam,
  });

  Future<dynamic> getLeadKYCDetails({required int leadId});

  Future<GetLeadModel?> getKycList({
    required int pageId,
    required int recordCount,
    required String orderByColumn,
    required String sortDirection,
    required String searchKeyword,
  });

  Future<List<LeadFieldsModel>?> getMaritalStatusList();

  Future<List<LeadFieldsModel>?> getVehicleOwnershipList();

  Future<List<LeadFieldsModel>?> getHouseOwnershipList();

  Future<List<LeadFieldsModel>?> getBankList();

  Future<List<LeadFieldsModel>?> getVehicleMakeList();
}

class KycServiceV1 extends KycService {
  KycServiceV1(this.kycRepository);

  final KycRepository kycRepository;

  @override
  Future<void> insertLeadKyc(
      {required KycLeadRequest kycLeadRequest,
      required List<File> imagePath,
      required List<String> imageParam}) async {
    await kycRepository.insertLeadKyc(
      kycLeadRequest: kycLeadRequest,
      imagePath: imagePath,
      imageParam: imageParam,
    );
  }

  @override
  Future<dynamic> getLeadKYCDetails({required int leadId}) async {
    return await kycRepository.getLeadKYCDetails(leadId: leadId);
  }

  @override
  Future<GetLeadModel?> getKycList({
    required int pageId,
    required int recordCount,
    required String orderByColumn,
    required String sortDirection,
    required String searchKeyword,
  }) {
    return kycRepository.getKycList(
      pageId: pageId,
      recordCount: recordCount,
      orderByColumn: orderByColumn,
      sortDirection: sortDirection,
      searchKeyword: searchKeyword,
    );
  }

  @override
  Future<List<LeadFieldsModel>?> getMaritalStatusList() {
    return kycRepository.getMaritalStatusList();
  }

  @override
  Future<List<LeadFieldsModel>?> getVehicleOwnershipList() {
    return kycRepository.getVehicleOwnershipList();
  }

  @override
  Future<List<LeadFieldsModel>?> getHouseOwnershipList() {
    return kycRepository.getHouseOwnershipList();
  }

  @override
  Future<List<LeadFieldsModel>?> getBankList() {
    return kycRepository.getBankList();
  }

  @override
  Future<List<LeadFieldsModel>?> getVehicleMakeList() {
    return kycRepository.getVehicleMakeList();
  }
}

final kycServiceProvider = Provider.autoDispose<KycService>((ref) {
  final service = KycServiceV1(
    ref.watch(kycRepositoryProvider),
  );
  return service;
});
