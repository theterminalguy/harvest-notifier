# frozen_string_literal: true

describe HarvestNotifier::Templates::DailyReport do
  subject(:template) { described_class.generate(users: users, date: Date.yesterday) }

  describe "#generate" do
    let(:users) { [{ email: "bill.doe@example.com", slack_id: "U02TEST" }] }

    it "generates template with mentioning users" do
      expect(template).to include("Here is a list of people")
      expect(template).to include("@U02TEST")
    end
  end
end
