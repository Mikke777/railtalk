
require 'rails_helper'

RSpec.describe Message, type: :model do
  it "is not valid without content" do
    message = Message.new
    expect(message).not_to be_valid
  end
end