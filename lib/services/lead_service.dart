import 'package:digitifyze/data/lead_repo.dart';
import 'package:digitifyze/model/response/lead_field_model.dart';
import 'package:digitifyze/model/response/lead_res_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class LeadService {
  Future<List<LeadFieldsModel>?> getLeadSourceList();
  Future<List<LeadFieldsModel>?> getGenderList();
  Future<List<LeadFieldsModel>?> getStateList();
  Future<List<LeadFieldsModel>?> getCityList({required int stateId});
  Future<List<LeadFieldsModel>?> getClusterList();
  Future<List<LeadFieldsModel>?> getDealerList();

  Future<List<LeadFieldsModel>?> getBusinessSegmentList();
  Future<List<LeadFieldsModel>?> getVehicleTypeList();
  Future<List<LeadFieldsModel>?> getSalesTypeList();
  Future<List<LeadFieldsModel>?> getLeadServiceTypeList();
  Future<List<LeadFieldsModel>?> getVehicleFinanceStatusList();

  Future<dynamic> getLeadDetails({required int leadId});

  Future<GetLeadModel?> getLeadList({
    required int pageId,
    required int recordCount,
    required String orderByColumn,
    required String sortDirection,
    required String searchKeyword,
  });

  Future<void> leadInsert({
    required String firstName,
    required String lastName,
    required String mobileNo,
    required String pinCode,
    required String referralCode,
    required String alternateMobileNo,
    required int sourceId,
    required int genderId,
    required String address,
    required String landmark,
    required int stateId,
    required int cityId,
    required int clusterId,
    required int dealerId,
    required int businessSegmentId,
    required int vehicleTypeId,
    required int salesTypeId,
    required int serviceTypeId,
    required int vehicleFinanceStatusId,
    required bool moveToKycVerification,
    required int userId,
  });

  Future<void> leadUpdate({
    required int leadId,
    required String firstName,
    required String lastName,
    required String mobileNo,
    required String pinCode,
    required String referralCode,
    required String alternateMobileNo,
    required int sourceId,
    required int genderId,
    required String address,
    required String landmark,
    required int stateId,
    required int cityId,
    required int clusterId,
    required int dealerId,
    required int businessSegmentId,
    required int vehicleTypeId,
    required int salesTypeId,
    required int serviceTypeId,
    required int vehicleFinanceStatusId,
    required bool moveToKycVerification,
    required int userId,
  });

}

class LeadServiceV1 implements LeadService {
  LeadServiceV1(
    this.leadRepository,
  );

  final LeadRepository leadRepository;

  @override
  Future<dynamic> getLeadDetails({required int leadId}) async {
    return await leadRepository.getLeadDetails(leadId: leadId);
  }

  @override
  Future<List<LeadFieldsModel>?> getLeadSourceList() async {
    return await leadRepository.getLeadSourceList();
  }

  @override
  Future<List<LeadFieldsModel>?> getGenderList() async {
    return await leadRepository.getGenderList();
  }

  @override
  Future<List<LeadFieldsModel>?> getStateList() async {
    return await leadRepository.getStateList();
  }

  @override
  Future<List<LeadFieldsModel>?> getCityList({required int stateId}) async {
    return await leadRepository.getCityList(stateId: stateId);
  }

  @override
  Future<List<LeadFieldsModel>?> getClusterList() async {
    return await leadRepository.getClusterList();
  }

  @override
  Future<List<LeadFieldsModel>?> getDealerList() async {
    return await leadRepository.getDealerList();
  }

  @override
  Future<List<LeadFieldsModel>?> getBusinessSegmentList() async {
    return await leadRepository.getBusinessSegmentList();
  }

  @override
  Future<List<LeadFieldsModel>?> getVehicleTypeList() async {
    return await leadRepository.getVehicleTypeList();
  }

  @override
  Future<List<LeadFieldsModel>?> getSalesTypeList() async {
    return await leadRepository.getSalesTypeList();
  }

  @override
  Future<List<LeadFieldsModel>?> getLeadServiceTypeList() async {
    return await leadRepository.getLeadServiceTypeList();
  }

  @override
  Future<List<LeadFieldsModel>?> getVehicleFinanceStatusList() async {
    return await leadRepository.getVehicleFinanceStatusList();
  }

  @override
  Future<GetLeadModel?> getLeadList({
    required int pageId,
    required int recordCount,
    required String orderByColumn,
    required String sortDirection,
    required String searchKeyword,
  }) async {
    return await leadRepository.getLeadList(
      pageId: pageId,
      recordCount: recordCount,
      orderByColumn: orderByColumn,
      sortDirection: sortDirection,
      searchKeyword: searchKeyword,
    );
  }

  @override
  Future<void> leadInsert({
    required String firstName,
    required String lastName,
    required String mobileNo,
    required String pinCode,
    required String referralCode,
    required String alternateMobileNo,
    required int sourceId,
    required int genderId,
    required String address,
    required String landmark,
    required int stateId,
    required int cityId,
    required int clusterId,
    required int dealerId,
    required int businessSegmentId,
    required int vehicleTypeId,
    required int salesTypeId,
    required int serviceTypeId,
    required int vehicleFinanceStatusId,
    required bool moveToKycVerification,
    required int userId,
  }) async {
    return await leadRepository.leadInsert(
        firstName: firstName,
        lastName: lastName,
        mobileNo: mobileNo,
        alternateMobileNo: alternateMobileNo,
        genderId: genderId,
        sourceId: sourceId,
        address: address,
        landmark: landmark,
        stateId: stateId,
        cityId: cityId,
        clusterId: clusterId,
        dealerId: dealerId,
        businessSegmentId: businessSegmentId,
        vehicleTypeId: vehicleTypeId,
        serviceTypeId: serviceTypeId,
        vehicleFinanceStatusId: vehicleFinanceStatusId,
        moveToKycVerification: moveToKycVerification,
        userId: userId,
        referralCode: referralCode,
        pinCode:pinCode,
        salesTypeId: salesTypeId,
    );
  }

  @override
  Future<void> leadUpdate({
    required int leadId,
    required String firstName,
    required String lastName,
    required String mobileNo,
    required String pinCode,
    required String referralCode,
    required String alternateMobileNo,
    required int sourceId,
    required int genderId,
    required String address,
    required String landmark,
    required int stateId,
    required int cityId,
    required int clusterId,
    required int dealerId,
    required int businessSegmentId,
    required int vehicleTypeId,
    required int salesTypeId,
    required int serviceTypeId,
    required int vehicleFinanceStatusId,
    required bool moveToKycVerification,
    required int userId,
  }) async {
    return await leadRepository.leadUpdate(
        leadId: leadId,
        firstName: firstName,
        lastName: lastName,
        mobileNo: mobileNo,
        alternateMobileNo: alternateMobileNo,
        genderId: genderId,
        address: address,
        landmark: landmark,
        stateId: stateId,
        cityId: cityId,
        clusterId: clusterId,
        dealerId: dealerId,
        businessSegmentId: businessSegmentId,
        vehicleTypeId: vehicleTypeId,
        serviceTypeId: serviceTypeId,
        vehicleFinanceStatusId: vehicleFinanceStatusId,
        moveToKycVerification: moveToKycVerification,
        userId: userId,
        salesTypeId: salesTypeId,
        referralCode: referralCode,
        pinCode: pinCode,
        sourceId: sourceId
    );
  }
}

final leadServiceProvider = Provider.autoDispose<LeadService>((ref) {
  final service = LeadServiceV1(
    ref.watch(leadRepositoryProvider),
  );
  return service;
});
