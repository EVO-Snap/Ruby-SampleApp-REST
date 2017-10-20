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

require 'time'

module Evo
  # The TMS class contains methods that interact with Snap*'s Transaction
  # Management Service, which allows you to query and fetch historical
  # transaction data.
  #
  # See:  http://docs.evosnap.com/commerce-web-services/implementation/
  class Tms
    def self.query_batch(evo_cws_client, request)
      defaults = default_query_batch

      defaults['MerchantProfileIds'] = [evo_cws_client.merchant_profile_id]

      request = Evo.recursive_merge(defaults, request)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/DataServices/TMS.svc/batch',
        request,
        Net::HTTP::Post,
        RbConfig::BaseURL
      )
    end

    def self.query_transactions_summary(evo_cws_client, request) # rubocop:disable Metrics/MethodLength
      defaults = defaults_query_transactions_summary

      defaults['queryTransactionsParameters']['MerchantProfileIds'] =
        [evo_cws_client.merchant_profile_id]

      request = Evo.recursive_merge(defaults, request)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/DataServices/TMS.svc/transactionsSummary',
        request,
        Net::HTTP::Post,
        RbConfig::BaseURL
      )
    end

    def self.query_transactions_detail(evo_cws_client, request)
      defaults = defaults_query_transactions_detail

      defaults['MerchantProfileIds'] = [evo_cws_client.merchant_profile_id]

      request = Evo.recursive_merge(defaults, request)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/DataServices/TMS.svc/transactionsDetail',
        request,
        Net::HTTP::Post,
        RbConfig::BaseURL
      )
    end

    def self.query_transactions_families(evo_cws_client, request)
      defaults = default_query_transactions_families

      defaults['MerchantProfileIds'] = [evo_cws_client.merchant_profile_id]

      request = Evo.recursive_merge(defaults, request)

      evo_cws_client.last_call = name + '::' + __method__.to_s
      evo_cws_client.send(
        RbConfig::BasePath + '/DataServices/TMS.svc/transactionsFamily',
        request,
        Net::HTTP::Post,
        RbConfig::BaseURL
      )
    end

    def self.default_query_batch # rubocop:disable Metrics/MethodLength
      {
        'queryTransactionsParameters' => {
          'Amounts' => nil,
          'ApprovalCodes' => nil,
          'BatchIds' => nil,
          'CaptureDateRange' => nil,
          'CaptureStates' => %w[ReadyForCapture
                                Captured],
          'CardTypes' => nil,
          'IsAcknowledged' => 'false',
          'MerchantProfileIds' => nil,
          'OrderNumbers' => nil,
          'QueryType' => 'AND',
          'ServiceIds' => nil,
          'ServiceKeys' => nil,
          'TransactionClassTypePairs' => nil,
          'TransactionDateRange' => nil,
          'TransactionIds' => nil,
          'TransactionStates' => nil
        },
        'includeRelated' => false,
        'pagingParameters' => {
          'Page' => '0',
          'PageSize' => '50'
        }
      }
    end

    def self.defaults_query_transactions_summary # rubocop:disable Metrics/MethodLength
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
          'TransactionIds' => nil,
          'TransactionStates' => nil
        },
        'includeRelated' => false,
        'pagingParameters' => {
          'Page' => '0',
          'PageSize' => '50'
        }
      }
    end

    def self.defaults_query_transactions_detail # rubocop:disable Metrics/MethodLength
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
          'TransactionIds' => nil,
          'TransactionStates' => nil
        },
        'includeRelated' => false,
        'pagingParameters' => {
          'Page' => '0',
          'PageSize' => '50'
        }
      }
    end

    def self.default_query_transactions_families # rubocop:disable Metrics/MethodLength
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
          'TransactionIds' => nil,
          'TransactionStates' => nil
        },
        'includeRelated' => true,
        'pagingParameters' => {
          'Page' => '0',
          'PageSize' => '50'
        }
      }
    end
  end
end
