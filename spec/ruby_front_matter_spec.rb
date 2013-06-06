require 'minitest/autorun'
require 'yaml'
require 'json'
require 'bundler'
Bundler.require

describe RubyFrontMatter::Parser do
  describe ".parse" do
    describe "when input string is empty" do
      it "returns an [{}, '']" do
        str = ''
        RubyFrontMatter::Parser.new.parse(str).must_equal [{}, '']
      end
    end

    describe "when input string has no front matter" do
      it "returns an empty hash and the string" do
        str = "i'm just a piece of text"
        RubyFrontMatter::Parser.new.parse(str).must_equal [{}, str]
      end
    end

    describe "when input has only a front matter" do
      it "returns a hash with an empty string" do
        str = "
---
front:
  matter: 'yes, matters'
---
"
        RubyFrontMatter::Parser.new.parse(str).must_equal [{'front' => {'matter' => 'yes, matters'}}, '']
      end

      describe "when input has both" do
        it "returns parsed front matter and rest of the string contents" do
          str = "
---
a:
  b: 123
---

some text
"
          RubyFrontMatter::Parser.new.parse(str).must_equal [{'a' => {'b' => 123}}, "some text"]
        end
      end

      it "allows to inject the parser" do
          #thus changing the front matter format
          p = RubyFrontMatter::Parser.new(parser: JSON)
          str = '
---
{
  "front":   "matters",
  "matters": "front"
}
---
'
          p.parse(str).must_equal [{'front' => 'matters', 'matters' => 'front'}, '']
      end

      it "allows to change the delimiter string" do
          p = RubyFrontMatter::Parser.new(delimiter: '====', parser: JSON)
          str = '
====
{
  "front":   "matters",
  "matters": "front"
}
====
'
          p.parse(str).must_equal [{'front' => 'matters', 'matters' => 'front'}, '']
      end
    end
  end
end
