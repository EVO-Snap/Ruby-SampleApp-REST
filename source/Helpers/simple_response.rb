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

module Evo
  # SimpleResponse takes the JSON encoded response from the Snap* platform and
  # performs some basic transforms and normalizations in preparation for the
  # response to become a native Ruby data structure.
  #
  # SimpleResponse also detects XML responses and tries to compose it into a
  # usable data structure whilst also marking the response as a failure.
  #
  # Finally, SimpleResponse wraps the Snap* API response in a hash that also
  # contains state information about the call itself (such as if it was a
  # success or not).  This would be a great object to extend/override if your
  # application has special requirements.
  class SimpleResponse
    attr_reader :data, :body, :code, :response

    def handle_xml(response)
      rule_message = response.body

      element_name = 'RuleMessage'

      found =
        %r{<#{element_name}(?:\s+[^>]+)?>(.*?)<\/#{element_name}>}.match(@body)

      rule_message << if !found.nil?
                        found[1] # ignore the enclosing tags
                      else
                        handle_string
                      end

      @data = { 'Success' => false, 'RuleMessage' => rule_message }
    end

    def handle_string
      # Next best thing, seen in the txn endpoints
      element_name = 'a:string'
      found =
        %r{<#{element_name}(?:\s+[^>]+)?>(.*?)<\/#{element_name}>}
        .match(@body)

      return found[1] unless found.nil?
    end

    def initialize(response) # rubocop:disable Metrics/MethodLength
      @code = response.code
      @body = response.body
      @response = response

      if response.body[0] == '{'
        @data = JSON.parse(response.body)
        @data['Success'] = true
      elsif response.body[0] == '['
        @data = JSON.parse(response.body)
        @data = { 'Results' => @data, 'Success' => true }
      elsif response.body[0] == '<'
        p 'XML Was returned.'
        handle_xml(response)
      else
        @data = { 'Success' => false, 'RuleMessage' => @body }
      end
    end
  end
end
