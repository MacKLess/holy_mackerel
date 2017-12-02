require 'rails_helper'

describe Review do
  it { should validate_presence_of :product }
  it { should validate_presence_of :content }
  it { should validate_presence_of :user }
  it { should belong_to :product }
  it { should belong_to :review}
end
