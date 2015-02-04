require 'spec_helper'

describe Player do
  it {should belong_to :game }
  it {should have_many :pieces}
end
