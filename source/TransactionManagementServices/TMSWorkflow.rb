# Copyright (c) 2013 EVO Payments International - All Rights Reserved.
#
# This software and documentation is subject to and made
# available only pursuant to the terms of an executed license
# agreement, and may be used only in accordance with the terms
# of said agreement. This software may not, in whole or in part,
# be copied, photocopied, reproduced, translated, or reduced to
# any electronic medium or machine-readable form without
# prior consent, in writing, from EVO Payments International
#
# Use, duplication or disclosure by the U.S. Government is subject
# to restrictions set forth in an executed license agreement
# and in subparagraph (c)(1) of the Commercial Computer
# Software-Restricted Rights Clause at FAR 52.227-19; subparagraph
# (c)(1)(ii) of the Rights in Technical Data and Computer Software
# clause at DFARS 252.227-7013, subparagraph (d) of the Commercial
# Computer Software--Licensing clause at NASA FAR supplement
# 16-52.227-86; or their equivalent.
#
# Information in this software is subject to change without notice
# and does not represent a commitment on the part of EVO Payments International.
#
# Sample Code is for reference Only and is intended to be used for educational purposes. It"s the responsibility of
# the software company to properly integrate into thier solution code that best meets thier production needs.
#
require 'json'

module Workflows
  def self.TMS(client)

    client.do_log=true;
    txnIds = Array.new; # Create array to capture all of the txnIds returned on teh transactions summaries call
    txn_summaries_response = EvoCWS_endpoint_tms.query_transactions_summary(client, {});

    p( txn_summaries_response.data );
    test_assert(txn_summaries_response.data["Success"]==true, client);
    test_assert(txn_summaries_response.data["Status"]!="Failure", client);

    if (txn_summaries_response.data["Results"].length != 0) then

      txn_summaries_response.data["Results"].each { |summaryDetail|

        summaryDetail['TransactionInformation'].each { |txnInfo|

          if (txnInfo[0] != "TransactionId") then next; end
          txnIds.push(txnInfo[1]); # Set the TransactionId of each txn to the array
        }
      }
    end

    query_txn_details= {
      "queryTransactionsParameters"=> {
        "Amounts" => nil,
        "ApprovalCodes"=> nil,
        "BatchIds"=> nil,
        "CaptureDateRange" => nil,
        "CaptureStates" => nil, # ["ReadyForCapture","Captured"],
        "CardTypes"=> nil,
        "IsAcknowledged" => "false",
        "MerchantProfileIds"=> nil,
        "OrderNumbers" => nil,
        "QueryType" => "AND",
        "ServiceIds" => nil,
        "ServiceKeys" => nil,
        "TransactionClassTypePairs" => nil,
        "TransactionDateRange" => nil,
        "TransactionIds" => [txnIds[0]], # This will only retrieve the first transaction in the txnIds array for the detail
        "TransactionStates" => nil
      },
      "includeRelated" => false,
      "pagingParameters" => {
        "Page" => "0",
        "PageSize" => "50"
      }
    };
    txn_details_response = EvoCWS_endpoint_tms.query_transactions_detail(client, query_txn_details);

    p( txn_details_response.data );
    test_assert(txn_details_response.data["Success"]==true, client);
    test_assert(txn_details_response.data["Status"]!="Failure", client);

    # Now lets set up a transaction family to query on by running an Authorize followed by a Undo.
    # We will then query by the ReturnById TxnId to retrieve both TxnIds that are related

    ########################

    authorized_response = EvoCWS_endpoint_txn.authorize(client, {});

    p( authorized_response.data );
    test_assert(authorized_response.data["Success"]==true, client);
    test_assert(authorized_response.data["Status"]!="Failure", client);

    undo_response = EvoCWS_endpoint_txn.undo(client, {
      "DifferenceData" => {
        "TransactionId" => authorized_response.data["TransactionId"]
      }
    });
    
    query_family_details= {
      "queryTransactionsParameters"=> {
        "Amounts" => nil,
        "ApprovalCodes"=> nil,
        "BatchIds"=> nil,
        "CaptureDateRange" => nil,
        "CaptureStates" => nil, # ["ReadyForCapture","Captured"],
        "CardTypes"=> nil,
        "IsAcknowledged" => "false",
        "MerchantProfileIds"=> nil,
        "OrderNumbers" => nil,
        "QueryType" => "AND",
        "ServiceIds" => nil,
        "ServiceKeys" => nil,
        "TransactionClassTypePairs" => nil,
        "TransactionDateRange" => nil,
        "TransactionIds" => [undo_response.data["TransactionId"]], 
        "TransactionStates" => nil
      },
      "includeRelated" => false,
      "pagingParameters" => {
        "Page" => "0",
        "PageSize" => "50"
      }
    };
    family_details_response = EvoCWS_endpoint_tms.query_transactions_families(client, query_family_details);

    p( family_details_response.data );
    test_assert(family_details_response.data["Success"]==true, client);
    test_assert(family_details_response.data["Status"]!="Failure", client);
    
    query_batch_response = EvoCWS_endpoint_tms.query_batch(client, query_family_details);

    p( query_batch_response.data );
    test_assert(query_batch_response.data["Success"]==true, client);
    test_assert(query_batch_response.data["Status"]!="Failure", client);
    
  end
end
