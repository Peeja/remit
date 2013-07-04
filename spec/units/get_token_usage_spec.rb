require 'units/units_helper'

describe "the GetTokenUsage API" do
  describe "a successful response" do
    it_should_behave_like 'a successful response'

    before do
      doc = <<-XML
        <?xml version="1.0"?>
        <GetTokenUsageResponse xmlns="http://fps.amazonaws.com/doc/2008-09-17/">
          <GetTokenUsageResult>
            <TokenUsageLimits>
              <Amount>
                <CurrencyCode>USD</CurrencyCode>
                <Value>1.000000</Value>
              </Amount>
              <LastResetAmount>
                <CurrencyCode>USD</CurrencyCode>
                <Value>0.000000</Value>
              </LastResetAmount>
              <LastResetTimestamp>2013-07-03T14:33:18.897-07:00</LastResetTimestamp>
            </TokenUsageLimits>
          </GetTokenUsageResult>
          <ResponseMetadata>
            <RequestId>81d6e587-8989-46d7-88af-8aa8f5d1f890:0</RequestId>
          </ResponseMetadata>
        </GetTokenUsageResponse>
      XML

      @response = Remit::GetTokenUsage::Response.new(doc)
    end

    it "has metadata" do
      @response.response_metadata.should_not be_nil
    end

    it "has results" do
      @response.get_token_usage_result.should_not be_nil
    end

    it "has limits" do
      @response.get_token_usage_result.token_usage_limits.should_not be_nil
      @response.get_token_usage_result.token_usage_limits.amount.currency_code.should == "USD"
      @response.get_token_usage_result.token_usage_limits.amount.value.should == 1.0
      @response.get_token_usage_result.token_usage_limits.last_reset_amount.currency_code.should == "USD"
      @response.get_token_usage_result.token_usage_limits.last_reset_amount.value.should == 0.0
      @response.get_token_usage_result.token_usage_limits.last_reset_timestamp.should == Time.parse("2013-07-03T14:33:18.897-07:00")
    end
  end
end
