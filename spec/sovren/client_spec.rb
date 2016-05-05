require 'spec_helper'

describe Sovren::Client do
  let(:client) { Sovren::Client.new(endpoint: "foo1", account_id: "foo2", service_key: "foo3") }

  describe '.initialize' do
    specify { expect(client).not_to be_nil }
  end

  describe ".config" do
    specify { expect(client).to respond_to :endpoint }
    specify { expect(client.endpoint).to eq("foo1") }
    specify { expect(client).to respond_to :account_id }
    specify { expect(client.account_id).to eq("foo2") }
    specify { expect(client).to respond_to :service_key }
    specify { expect(client.service_key).to eq("foo3") }
  end

  describe '.parse', vcr: {cassette_name: 'parsed_resume'} do
    let(:resume) { file_fixture 'ResumeSample.doc' }
    let(:client) { Sovren::Client.new(endpoint: "http://www.foo.com/") }

    let(:error_response) {
      { code: 'CRAP!', message: 'AHH!' }
    }

    it 'builds a Sovren::Resume' do
      expect(client.parse(resume)).to be_a(Sovren::Resume)
    end

    it 'accepts extra options' do
      expect_any_instance_of(Savon::LocalOptions)
        .to receive(:message).with('request' => hash_including('foo' => 'bar'))
        .and_call_original

      client.parse(resume, 'foo' => 'bar')
    end

    it 'throws errors' do
      expect(client).to receive_message_chain(:connection, :call) do
        double(body: { parse_resume_response: { parse_resume_result: error_response } })
      end

      expect { client.parse(resume) }.to raise_error(Sovren::Error)
    end
  end
end
