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
require_relative 'defaults'

# The Workflows module contains the three "workflows" run in this sample
# application;  each lays out the typical workflows of a Snap* application.
#
# This workflow interacts with the Transaction Management Service.
module Workflows
  def self.tms(client) # rubocop:disable Metrics/MethodLength
    txn_ids = []; # Capture all txn_ids returned via transactions summaries call

    # First, we're going to use Transaction Summary to pull a list of
    # transactions from TMS.
    txn_summaries_response =
      EvoCWS_endpoint_tms.query_transactions_summary(
        client,
        'pagingParameters' => {
          'PageSize' => 5
        }
      )

    test_assert(txn_summaries_response.data['Success'] == true, client)
    test_assert(txn_summaries_response.data['Status'] != 'Failure', client)

    unless txn_summaries_response.data['TransactionDetails'].empty?

      txn_summaries_response.data['TransactionDetails'].each do |summary_detail|
        summary_detail['TransactionInformation'].each do |txn_info|
          next if txn_info[0] != 'TransactionId'

          # Set the TransactionId of each txn to the array
          txn_ids.push(txn_info[1])
        end
      end
    end

    # Next, we're going to grab the details of a single transaction.  We'll use
    # this function to build the query structure.
    query_txn_details = default_txn_details(txn_ids)

    txn_details_response =
      EvoCWS_endpoint_tms.query_transactions_detail(client, query_txn_details)
    test_assert(txn_details_response.data['Success'] == true, client)
    test_assert(txn_details_response.data['Status'] != 'Failure', client)

    # Now lets set up a transaction family to query on by running an Authorize
    # and Capture, followed by a Return by ID. We will then query by the
    # ReturnById TxnId to retrieve both txn_ids that are related.
    txn = setup_family(client)

    query_family_details = default_query_family_details(txn)
    family_details_response = EvoCWS_endpoint_tms.query_transactions_families(
      client,
      query_family_details
    )

    test_assert(family_details_response.data['Success'] == true, client)
    test_assert(family_details_response.data['Status'] != 'Failure', client)
  end

  def self.setup_family(client) # rubocop:disable Metrics/MethodLength
    authorized_response =
      EvoCWS_endpoint_txn.authorize_and_capture(client, {})
    test_assert(authorized_response.data['Success'] == true, client)
    test_assert(authorized_response.data['Status'] != 'Failure', client)

    refund_response = EvoCWS_endpoint_txn.return_by_id(
      client,
      'DifferenceData' => {
        'TransactionId' => authorized_response.data['TransactionId']
      }
    )

    refund_response.data['TransactionId']
  end
end
