require 'rails_helper'

describe Review do
  it { should validate_presence_of :product }
  it { should validate_presence_of :content}
  it { should belong_to :product }
end
