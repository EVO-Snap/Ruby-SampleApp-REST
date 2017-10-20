# This software and documentation is subject to and made
# available only pursuant to the terms of an executed license
# agreement, and may be used only in accordance with the terms
# of said agreement. This software may not, in whole or in part,
# be copied, photocopied, reproduced, translated, or reduced to
# any electronic medium or machine-readable form without
# prior consent, in writing, from EVO Payments International, INC.
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
# Sample Code is for reference Only and is intended to be used for educational
# purposes. It's the responsibility of the software company to properly
# integrate into thier solution code that best meets thier production needs.
#
# Copyright:: 2017 EVO Payments International - All Rights Reserved
# License:: Proprietary

require 'json'

# The Workflows module contains the three "workflows" run in this sample
# application;  each lays out the typical workflows of a Snap* application.
#
# Here are data structures used by the Transaction Management Service.
module Workflows
  def self.default_txn_details(txn_ids) # rubocop:disable Metrics/MethodLength
    {
      'queryTransactionsParameters' => {
        'Amounts' => nil,
        'ApprovalCodes' => nil,
        'BatchIds' => nil,
        'CaptureDateRange' => nil,
        'CaptureStates' => nil, # ["ReadyForCapture","Captured"],
        'CardTypes' => nil,
        'IsAcknowledged' => 'false',
        'MerchantProfileIds' => nil,
        'OrderNumbers' => nil,
        'QueryType' => 'AND',
        'ServiceIds' => nil,
        'ServiceKeys' => nil,
        'TransactionClassTypePairs' => nil,
        'TransactionDateRange' => nil,
        # This will only retrieve detail for the first transaction in txn_ids
        'TransactionIds' => [txn_ids[0]],
        'TransactionStates' => nil
      },
      'includeRelated' => false,
      'pagingParameters' => {
        'Page' => '0',
        'PageSize' => '50'
      }
    }
  end

  def self.default_query_family_details(txn) # rubocop:disable Metrics/MethodLength
    {
      'queryTransactionsParameters' => {
        'Amounts' => nil,
        'ApprovalCodes' => nil,
        'BatchIds' => nil,
        'CaptureDateRange' => nil,
        'CaptureStates' => nil, # ["ReadyForCapture","Captured"],
        'CardTypes' => nil,
        'IsAcknowledged' => 'false',
        'MerchantProfileIds' => nil,
        'OrderNumbers' => nil,
        'QueryType' => 'AND',
        'ServiceIds' => nil,
        'ServiceKeys' => nil,
        'TransactionClassTypePairs' => nil,
        'TransactionDateRange' => nil,
        'TransactionIds' => [txn],
        'TransactionStates' => nil
      },
      'includeRelated' => false,
      'pagingParameters' => {
        'Page' => '0',
        'PageSize' => '50'
      }
    }
  end
end
