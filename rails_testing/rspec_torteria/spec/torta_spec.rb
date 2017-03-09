require 'torta'

describe Torta do

  let(:type)  { "milanesa" }
  let(:torta) { Torta.new(type) }

  subject { torta }
  it { is_expected.to respond_to(:type) }

  describe "#initialize" do
    context "with valid input" do
      it "creates a new Torta of the specified type" do
        expect(torta.type).to eq(type)
      end
    end

    context "with invalid input" do
      it "throws an argument error when not given a type argument" do
        expect { Torta.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#type" do
    it "returns the type of the torta" do 
      expect(torta.type).to eq("milanesa")
    end  
  end

  describe "#bake!" do
    it "requires an integer time argument" do
      expect { torta.bake!("A") }.to raise_error("Not an integer")
    end
  end

  it "returns the torta object" do
    (torta.bake!(10)).should be_an_instance_of(torta.class)
  end

  it "changes the status of the torta when given enough time" do
    expect { torta.bake!(10) }.to change(torta, :status)
  end

  describe "#status" do
    it "returns the torta's current status" do
      expect(torta.status).to eq("crudo") 
    end
  end

  context "when unbaked" do
    it "is `crudo`" do  
      expect(torta.status).to eq("crudo")
    end
  end

  context "when baked for less than 5 minutes" do
    it "is `crudo`" do
      expect(torta.bake!(4).status).to eq("crudo")
    end
  end

  context "when baked for at least 5 but less than 7 minutes" do
    it "is `casi listo`" do
      expect(torta.bake!(6).status).to eq("casi listo")
    end  
  end

  context "when baked for at least 7 but less or equal than 10 minutes" do
    it "is `listo`" do
      expect(torta.bake!(9).status).to eq("listo")
      end  
  end

  context "when baked for at least 11 minutes" do
    it "is `quemado`" do
      expect(torta.bake!(11).status).to eq("quemado")
    end
  end

  describe "#bake_time" do
    let(:type2)  { "jamon" }
    let(:torta2) { Torta.new(type2) }
    let(:type3)  { "queso" }
    let(:torta3) { Torta.new(type3) }

    it "returns bake time of the specified type" do
      expect(torta.bake_time).to eq(10)
      expect(torta2.bake_time).to eq(3)
      expect(torta3.bake_time).to eq(8)
    end
  end

end