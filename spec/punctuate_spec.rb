require "spec_helper"

describe Punctuate do
  it "has a version number" do
    expect(Punctuate::VERSION).not_to be nil
  end

  it "converts a symbol to another" do
    expect("Hello World⟩✱≤".punctuate).to eql "Hello World>*<="
  end
end
