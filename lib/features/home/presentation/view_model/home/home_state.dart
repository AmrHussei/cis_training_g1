// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.getWithdrawRequestState = RequestState.ideal,
    this.getWithdrawError,
    this.getWithdrawModel,
    this.getUserInvoicesRequestState = RequestState.ideal,
    this.getUserInvoicesError,
    this.getUserInvoicesModel,
    this.submitWithdrawRequestState = RequestState.ideal,
    this.submitWithdrawError,
    this.submitWithdrawMsg,
    this.getHeldFundsRequestState = RequestState.ideal,
    this.getHeldFundsError,
    this.getHeldFundsModel,
    this.getUserAuctionsRequestState = RequestState.ideal,
    this.getUserAuctionsError,
    this.getUserAuctionsModel,
    this.auctionBrochureRequestState = RequestState.ideal,
    this.auctionBrochureError,
    this.auctionBrochureMsg,
    this.getFavoriteRequestState = RequestState.ideal,
    this.getFavoriteError,
    this.getFavoriteModel,
    this.privacyPolicyRequestState = RequestState.ideal,
    this.privacyPolicyError,
    this.privacyPolicyModel,
    this.deleteOriginFavoriteRequestState = RequestState.ideal,
    this.deleteOriginFavoriteError,
    this.deleteOriginFavoriteMsg,
    this.getWalletRequestState = RequestState.ideal,
    this.getWalletError,
    this.getWalletModel,
    this.addWalletBalanceRequestState = RequestState.ideal,
    this.addWalletBalanceError,
    this.addWalletBalanceMsg,
    this.propertyPrice = 0,
    this.transactionFee = 0,
    this.commission = 0,
    this.commissionTax = 0,
    this.total = 0,
    this.topBid = 0,
    this.auctionEnrollmentRequestState = RequestState.ideal,
    this.auctionEnrollmentError,
    this.auctionEnrollmentMsg,
    this.deleteAuctionEnrollmentRequestState = RequestState.ideal,
    this.deleteAuctionEnrollmentError,
    this.deleteAuctionEnrollmentMsg,
    this.getAuctionBoardRequestState = RequestState.ideal,
    this.getAuctionBoardError,
    this.getAuctionBoardModel,
    this.addAuctionBidRequestState = RequestState.ideal,
    this.addAuctionBidError,
    this.addAuctionBidMsg,
    this.deleteAuctionFavoriteRequestState = RequestState.ideal,
    this.deleteAuctionFavoriteError,
    this.deleteAuctionFavoriteMsg,
    this.addFavoriteRequestState = RequestState.ideal,
    this.addFavoriteError,
    this.addFavoriteMsg,
    this.auctionsRequestState = RequestState.ideal,
    this.auctionsError,
    this.auctionsModel,
  });

  final RequestState auctionsRequestState;
  final Failure? auctionsError;
  final AuctionsModel? auctionsModel;
  //
  final RequestState getUserAuctionsRequestState;
  final Failure? getUserAuctionsError;
  final AuctionsModel? getUserAuctionsModel;
  //
  final RequestState getFavoriteRequestState;
  final Failure? getFavoriteError;
  final AuctionsModel? getFavoriteModel;
  //
  final RequestState addFavoriteRequestState;
  final Failure? addFavoriteError;
  final String? addFavoriteMsg;
  //
  final RequestState deleteAuctionFavoriteRequestState;
  final Failure? deleteAuctionFavoriteError;
  final String? deleteAuctionFavoriteMsg;
  //
  final RequestState deleteOriginFavoriteRequestState;
  final Failure? deleteOriginFavoriteError;
  final String? deleteOriginFavoriteMsg;
  //
  final RequestState auctionEnrollmentRequestState;
  final Failure? auctionEnrollmentError;
  final String? auctionEnrollmentMsg;
  //
  final RequestState deleteAuctionEnrollmentRequestState;
  final Failure? deleteAuctionEnrollmentError;
  final String? deleteAuctionEnrollmentMsg;
  //
  final RequestState getAuctionBoardRequestState;
  final Failure? getAuctionBoardError;
  final AuctionBoardModel? getAuctionBoardModel;
  //
  final RequestState addAuctionBidRequestState;
  final Failure? addAuctionBidError;
  final String? addAuctionBidMsg;
  //
  final RequestState getWalletRequestState;
  final Failure? getWalletError;
  final WalletModel? getWalletModel;
  //
  final RequestState getHeldFundsRequestState;
  final Failure? getHeldFundsError;
  final HeldModel? getHeldFundsModel;
  //
  final RequestState privacyPolicyRequestState;
  final Failure? privacyPolicyError;
  final PrivacyModel? privacyPolicyModel;
  //
  final RequestState auctionBrochureRequestState;
  final Failure? auctionBrochureError;
  final String? auctionBrochureMsg;
  //
  final RequestState addWalletBalanceRequestState;
  final Failure? addWalletBalanceError;
  final String? addWalletBalanceMsg;
  //
  final RequestState submitWithdrawRequestState;
  final Failure? submitWithdrawError;
  final String? submitWithdrawMsg;
  //
  final RequestState getWithdrawRequestState;
  final Failure? getWithdrawError;
  final WithdrawModel? getWithdrawModel;
  //
  final RequestState getUserInvoicesRequestState;
  final Failure? getUserInvoicesError;
  final InvoiceModel? getUserInvoicesModel;

  //
  final dynamic propertyPrice;
  final dynamic transactionFee;
  final dynamic commission;
  final dynamic commissionTax;
  final dynamic total;
  final dynamic topBid;

  @override
  List<Object?> get props => [
        getWithdrawRequestState,
        getWithdrawError,
        getWithdrawModel,
        getUserInvoicesRequestState,
        getUserInvoicesError,
        getUserInvoicesModel,
        submitWithdrawRequestState,
        submitWithdrawError,
        submitWithdrawMsg,
        getHeldFundsRequestState,
        getHeldFundsError,
        getHeldFundsModel,
        getUserAuctionsRequestState,
        getUserAuctionsError,
        getUserAuctionsModel,
        auctionBrochureRequestState,
        auctionBrochureError,
        auctionBrochureMsg,
        getFavoriteRequestState,
        getFavoriteError,
        getFavoriteModel,
        privacyPolicyRequestState,
        privacyPolicyError,
        privacyPolicyModel,
        deleteOriginFavoriteRequestState,
        deleteOriginFavoriteError,
        deleteOriginFavoriteMsg,
        getWalletRequestState,
        getWalletError,
        getWalletModel,
        addWalletBalanceRequestState,
        addWalletBalanceError,
        addWalletBalanceMsg,
        topBid,
        propertyPrice,
        transactionFee,
        commission,
        commissionTax,
        total,
        deleteAuctionFavoriteError,
        deleteAuctionFavoriteMsg,
        deleteAuctionFavoriteRequestState,
        addFavoriteError,
        addFavoriteMsg,
        addFavoriteRequestState,
        auctionsRequestState,
        auctionsError,
        auctionsModel,
        auctionEnrollmentRequestState,
        auctionEnrollmentError,
        auctionEnrollmentMsg,
        deleteAuctionEnrollmentRequestState,
        deleteAuctionEnrollmentError,
        deleteAuctionEnrollmentMsg,
        getAuctionBoardRequestState,
        getAuctionBoardError,
        getAuctionBoardModel,
        addAuctionBidRequestState,
        addAuctionBidError,
        addAuctionBidMsg,
      ];

  HomeState copyWith({
    RequestState? auctionsRequestState,
    Failure? auctionsError,
    AuctionsModel? auctionsModel,
    RequestState? getUserAuctionsRequestState,
    Failure? getUserAuctionsError,
    AuctionsModel? getUserAuctionsModel,
    RequestState? getFavoriteRequestState,
    Failure? getFavoriteError,
    AuctionsModel? getFavoriteModel,
    RequestState? addFavoriteRequestState,
    Failure? addFavoriteError,
    String? addFavoriteMsg,
    RequestState? deleteAuctionFavoriteRequestState,
    Failure? deleteAuctionFavoriteError,
    String? deleteAuctionFavoriteMsg,
    RequestState? deleteOriginFavoriteRequestState,
    Failure? deleteOriginFavoriteError,
    String? deleteOriginFavoriteMsg,
    RequestState? auctionEnrollmentRequestState,
    Failure? auctionEnrollmentError,
    String? auctionEnrollmentMsg,
    RequestState? deleteAuctionEnrollmentRequestState,
    Failure? deleteAuctionEnrollmentError,
    String? deleteAuctionEnrollmentMsg,
    RequestState? getAuctionBoardRequestState,
    Failure? getAuctionBoardError,
    AuctionBoardModel? getAuctionBoardModel,
    RequestState? addAuctionBidRequestState,
    Failure? addAuctionBidError,
    String? addAuctionBidMsg,
    RequestState? getWalletRequestState,
    Failure? getWalletError,
    WalletModel? getWalletModel,
    RequestState? getHeldFundsRequestState,
    Failure? getHeldFundsError,
    HeldModel? getHeldFundsModel,
    RequestState? privacyPolicyRequestState,
    Failure? privacyPolicyError,
    PrivacyModel? privacyPolicyModel,
    RequestState? auctionBrochureRequestState,
    Failure? auctionBrochureError,
    String? auctionBrochureMsg,
    RequestState? addWalletBalanceRequestState,
    Failure? addWalletBalanceError,
    String? addWalletBalanceMsg,
    RequestState? submitWithdrawRequestState,
    Failure? submitWithdrawError,
    String? submitWithdrawMsg,
    RequestState? getWithdrawRequestState,
    Failure? getWithdrawError,
    WithdrawModel? getWithdrawModel,
    RequestState? getUserInvoicesRequestState,
    Failure? getUserInvoicesError,
    InvoiceModel? getUserInvoicesModel,
    dynamic propertyPrice,
    dynamic transactionFee,
    dynamic commission,
    dynamic commissionTax,
    dynamic total,
    dynamic topBid,
  }) {
    return HomeState(
      auctionsRequestState: auctionsRequestState ?? this.auctionsRequestState,
      auctionsError: auctionsError ?? this.auctionsError,
      auctionsModel: auctionsModel ?? this.auctionsModel,
      getUserAuctionsRequestState:
          getUserAuctionsRequestState ?? this.getUserAuctionsRequestState,
      getUserAuctionsError: getUserAuctionsError ?? this.getUserAuctionsError,
      getUserAuctionsModel: getUserAuctionsModel ?? this.getUserAuctionsModel,
      getFavoriteRequestState:
          getFavoriteRequestState ?? this.getFavoriteRequestState,
      getFavoriteError: getFavoriteError ?? this.getFavoriteError,
      getFavoriteModel: getFavoriteModel ?? this.getFavoriteModel,
      addFavoriteRequestState:
          addFavoriteRequestState ?? this.addFavoriteRequestState,
      addFavoriteError: addFavoriteError ?? this.addFavoriteError,
      addFavoriteMsg: addFavoriteMsg ?? this.addFavoriteMsg,
      deleteAuctionFavoriteRequestState: deleteAuctionFavoriteRequestState ??
          this.deleteAuctionFavoriteRequestState,
      deleteAuctionFavoriteError:
          deleteAuctionFavoriteError ?? this.deleteAuctionFavoriteError,
      deleteAuctionFavoriteMsg:
          deleteAuctionFavoriteMsg ?? this.deleteAuctionFavoriteMsg,
      deleteOriginFavoriteRequestState: deleteOriginFavoriteRequestState ??
          this.deleteOriginFavoriteRequestState,
      deleteOriginFavoriteError:
          deleteOriginFavoriteError ?? this.deleteOriginFavoriteError,
      deleteOriginFavoriteMsg:
          deleteOriginFavoriteMsg ?? this.deleteOriginFavoriteMsg,
      auctionEnrollmentRequestState:
          auctionEnrollmentRequestState ?? this.auctionEnrollmentRequestState,
      auctionEnrollmentError:
          auctionEnrollmentError ?? this.auctionEnrollmentError,
      auctionEnrollmentMsg: auctionEnrollmentMsg ?? this.auctionEnrollmentMsg,
      deleteAuctionEnrollmentRequestState:
          deleteAuctionEnrollmentRequestState ??
              this.deleteAuctionEnrollmentRequestState,
      deleteAuctionEnrollmentError:
          deleteAuctionEnrollmentError ?? this.deleteAuctionEnrollmentError,
      deleteAuctionEnrollmentMsg:
          deleteAuctionEnrollmentMsg ?? this.deleteAuctionEnrollmentMsg,
      getAuctionBoardRequestState:
          getAuctionBoardRequestState ?? this.getAuctionBoardRequestState,
      getAuctionBoardError: getAuctionBoardError ?? this.getAuctionBoardError,
      getAuctionBoardModel: getAuctionBoardModel ?? this.getAuctionBoardModel,
      addAuctionBidRequestState:
          addAuctionBidRequestState ?? this.addAuctionBidRequestState,
      addAuctionBidError: addAuctionBidError ?? this.addAuctionBidError,
      addAuctionBidMsg: addAuctionBidMsg ?? this.addAuctionBidMsg,
      getWalletRequestState:
          getWalletRequestState ?? this.getWalletRequestState,
      getWalletError: getWalletError ?? this.getWalletError,
      getWalletModel: getWalletModel ?? this.getWalletModel,
      getHeldFundsRequestState:
          getHeldFundsRequestState ?? this.getHeldFundsRequestState,
      getHeldFundsError: getHeldFundsError ?? this.getHeldFundsError,
      getHeldFundsModel: getHeldFundsModel ?? this.getHeldFundsModel,
      privacyPolicyRequestState:
          privacyPolicyRequestState ?? this.privacyPolicyRequestState,
      privacyPolicyError: privacyPolicyError ?? this.privacyPolicyError,
      privacyPolicyModel: privacyPolicyModel ?? this.privacyPolicyModel,
      auctionBrochureRequestState:
          auctionBrochureRequestState ?? this.auctionBrochureRequestState,
      auctionBrochureError: auctionBrochureError ?? this.auctionBrochureError,
      auctionBrochureMsg: auctionBrochureMsg ?? this.auctionBrochureMsg,
      addWalletBalanceRequestState:
          addWalletBalanceRequestState ?? this.addWalletBalanceRequestState,
      addWalletBalanceError:
          addWalletBalanceError ?? this.addWalletBalanceError,
      addWalletBalanceMsg: addWalletBalanceMsg ?? this.addWalletBalanceMsg,
      submitWithdrawRequestState:
          submitWithdrawRequestState ?? this.submitWithdrawRequestState,
      submitWithdrawError: submitWithdrawError ?? this.submitWithdrawError,
      submitWithdrawMsg: submitWithdrawMsg ?? this.submitWithdrawMsg,
      getWithdrawRequestState:
          getWithdrawRequestState ?? this.getWithdrawRequestState,
      getWithdrawError: getWithdrawError ?? this.getWithdrawError,
      getWithdrawModel: getWithdrawModel ?? this.getWithdrawModel,
      getUserInvoicesRequestState:
          getUserInvoicesRequestState ?? this.getUserInvoicesRequestState,
      getUserInvoicesError: getUserInvoicesError ?? this.getUserInvoicesError,
      getUserInvoicesModel: getUserInvoicesModel ?? this.getUserInvoicesModel,
      propertyPrice: propertyPrice ?? this.propertyPrice,
      transactionFee: transactionFee ?? this.transactionFee,
      commission: commission ?? this.commission,
      commissionTax: commissionTax ?? this.commissionTax,
      total: total ?? this.total,
      topBid: topBid ?? this.topBid,
    );
  }
}
